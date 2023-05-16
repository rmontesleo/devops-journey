################################################################################
# Create n web servers with nginx installed and a custom message on main page  #
################################################################################
resource "digitalocean_droplet" "web" {
    # How many droplet(s) do we want. Taken from our variables
    count = var.droplet_count

    # Which image to use. Taken from our variables
    image = var.image

    # The human friendly name of our droplet. Combination of web, region, and 
    # count index. 
    name = "web-${var.name}-${var.region}-${count.index +1}"

    # What region to deploy the droplet(s) to. Taken from our variables
    region = var.region

    # What size droplet(s) do I want? Taken from our variables
    size = var.droplet_size

    # The ssh keys to put on the server so we can access it. Read in through a 
    # data source
    ssh_keys = [data.digitalocean_ssh_key.main.id]

    # What VPC to put our droplets in
    vpc_uuid = digitalocean_vpc.web.id

    # Tags for identifying the droplets and allowing db firewall access
    tags = ["${var.name}-webserver", "terraform-sample-archs"]

    #--------------------------------------------------------------------------#
    # Use user data, also known as cloud-init, to do an initial configuration  #
    # of the servers. This example is just for demonstration. In reality it    #
    # would probably be more advantageous to use a configuration management    #
    # system after server initialization.                                      #
    #--------------------------------------------------------------------------#
    user_data = <<EOF
    #cloud-config
    packages:
        - nginx
        - postgresql
        - postgresql-contrib
    runcmd:
        # TODO. Review the lines 45 and 46
        #- wget -P /var/www/html https://raw.githubusercontent.com/do-community/terraform-sample-digitalocean-architectures/master/01-minimal-web-db-stack/assets/index.html
        #- sed -i "s/CHANGE_ME/web-${var.region}-${count.index +1}/" /var/www/html/index.html
        - [  sh, -xc, "echo '<h1>web-${var.region}-${count.index + 1}</h1>' >> /var/www/html/index.html" ]

        
    EOF

    #-----------------------------------------------------------------------------------------------#
    # Ensures that we create the new resource before we destroy the old one                         #
    # https://www.terraform.io/docs/configuration/resources.html#lifecycle-lifecycle-customizations #
    #-----------------------------------------------------------------------------------------------#
    lifecycle {
        create_before_destroy = true
    }
}
