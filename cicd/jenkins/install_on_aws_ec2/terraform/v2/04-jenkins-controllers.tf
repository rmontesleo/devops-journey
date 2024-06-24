#############################################################
## EC2 Configuration for Jenkins Controller
#############################################################


#EC2 Instance
resource "aws_instance" "jenkins-controller" {
  instance_type               = "t2.micro"
  ami                         = "ami-08a0d1e16fc3f61ea"
  key_name                    = aws_key_pair.jenkins_cicd_key.id
  subnet_id                   = aws_subnet.jenkins_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_controller_security_group.id]

  root_block_device {
    volume_size = 16
  }

  tags = {
    Name    = "jenkins-controller"
    Project = "cicd-jenkins-project"
  }

}



# an empty resource block
resource "terraform_data" "setup_controller_system" {

  # wait for ec2 to be created
  depends_on = [aws_instance.jenkins-controller]

  # ssh into the ec2 instance 
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.jenkins-controller.public_ip
    private_key = file("~/.ssh/aws/demos/devsecops/devsecops-key")
  }  

  # copy the required variables
  provisioner "file" {
    source      = "./scripts/.env"
    destination = "/tmp/env_variables"
  } 

  # copy the setup_controller_system.sh file from your computer to the ec2 instance
  provisioner "file" {
    source      = "./scripts/bootstrap_jenkins_controller_jdk17.sh"
    destination = "/tmp/bootstrap_jenkins_controller_jdk17.sh"
  }

}


# an empty resource block
resource "terraform_data" "bootstrap_jenkins_controller" {

  # wait for ec2 to be created
  depends_on = [terraform_data.setup_controller_system]

  # ssh into the ec2 instance 
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.jenkins-controller.public_ip
    private_key = file("~/.ssh/aws/demos/devsecops/devsecops-key")
  }

  # set permissions and run the setup_controller_system.sh file
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/bootstrap_jenkins_controller_jdk17.sh",
      "sh /tmp/bootstrap_jenkins_controller_jdk17.sh"
    ]
  } 

}



