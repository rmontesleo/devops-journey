#############################################################
## EC2 Configuration for Jenkins Agents
#############################################################



#EC2 Instance
resource "aws_instance" "jenkins-agent-01" {

  instance_type               = "t2.micro"
  ami                         = "ami-08a0d1e16fc3f61ea"
  key_name                    = aws_key_pair.jenkins_cicd_key.id
  subnet_id                   = aws_subnet.jenkins_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_agent_security_group.id]
  user_data = base64decode(local.setup_jenkins_agent)

  root_block_device {
    volume_size = 16
  }

  tags = {
    Name    = "jenkins-agent-01"
    Project = "cicd-jenkins-project"
  }

}


#EC2 Instance
resource "aws_instance" "jenkins-agent-02" {

  instance_type               = "t2.micro"
  ami                         = "ami-08a0d1e16fc3f61ea"
  key_name                    = aws_key_pair.jenkins_cicd_key.id
  subnet_id                   = aws_subnet.jenkins_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_agent_security_group.id]
  user_data = base64decode(local.setup_jenkins_agent)

  root_block_device {
    volume_size = 16
  }

  tags = {
    Name    = "jenkins-agent-02"
    Project = "cicd-jenkins-project"
  }

}

#EC2 Instance
resource "aws_instance" "jenkins-agent-03" {

  instance_type               = "t2.micro"
  ami                         = "ami-08a0d1e16fc3f61ea"
  key_name                    = aws_key_pair.jenkins_cicd_key.id
  subnet_id                   = aws_subnet.jenkins_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_agent_security_group.id]
  user_data = base64decode(local.setup_jenkins_agent)

  root_block_device {
    volume_size = 16
  }

  tags = {
    Name    = "jenkins-agent-03"
    Project = "cicd-jenkins-project"
  }

}

#EC2 Instance
resource "aws_instance" "jenkins-agent-04" {

  instance_type               = "t2.micro"
  ami                         = "ami-08a0d1e16fc3f61ea"
  key_name                    = aws_key_pair.jenkins_cicd_key.id
  subnet_id                   = aws_subnet.jenkins_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_agent_security_group.id]
  user_data = base64decode(local.setup_jenkins_agent)

  root_block_device {
    volume_size = 16
  }

  tags = {
    Name    = "jenkins-agent-04"
    Project = "cicd-jenkins-project"
  }

}



/*
resource "terraform_data" "setup_agent_system" {
  # wait for ec2 to be created
  depends_on = [aws_instance.jenkins-agent-01]

  # ssh into the ec2 instance 
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = aws_instance.jenkins-agent-01.public_ip
    private_key = file("~/.ssh/aws/demos/devsecops/devsecops-key")
  }

  # copy thesetup_agetnt_system.sh file from your computer to the ec2 instance
  provisioner "file" {
    source      = "./scripts/setup_agent_system.sh"
    destination = "/tmp/setup_agent_system.sh"
  }

  # set permissions and run the setup_agent_system.sh file
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/setup_agent_system.sh",
      "sh /tmp/setup_agent_system.sh"
    ]
  }

}

*/