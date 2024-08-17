provider "aws" {
  region     = "eu-north-1"         # Replace with your desired region
  access_key = "${AWS_ACCESS_KEY_ID}"   # Replace with your AWS access key
  secret_key = "${AWS_SECRET_ACCESS_KEY}"   # Replace with your AWS secret key
}

resource "aws_instance" "flask_app" {
  ami           = "ami-02af70169146bbdd3" # Replace with your desired AMI ID
  instance_type = "t3.micro"              # Replace with your desired instance type

  # Use existing VPC and subnet
  subnet_id                   = "subnet-063f3c043d3918165" # Replace with your subnet ID
  associate_public_ip_address = true

  key_name      = "Tal-key-pair" # Replace with your key-pair name
  security_groups = ["sg-06f76035728128e05"] # Replace with your security group name or ID

  tags = {
    Name = "flask-app-instance"  # Replace with your desired tag
  }

  # User Data script to install packages, clone repo, and set up Flask environment
  user_data = <<-EOF
                #!/bin/bash
                
                # Update package manager and install necessary packages
                sudo yum update -y
                sudo yum install -y git python3 python3-pip

                # Clone the Git repository
                git clone https://github.com/your-username/your-repository.git /home/ec2-user/app

                # Navigate to the application directory
                cd /home/ec2-user/app

                # Create and activate Python virtual environment
                python3 -m venv venv
                source venv/bin/activate

                # Install Flask and other dependencies
                pip install flask

                # Create a basic Flask server script
                source app.py
                EOT

                # Run the Flask application
                nohup python3 app.py &
              EOF

  # Block device mapping (optional)
  root_block_device {
    volume_size = 8           # Size of the root volume in GiB
    volume_type = "gp3"        # Type of the root volume
  }

  # Enable monitoring (optional)
  monitoring = true
}

output "instance_id" {
  value = aws_instance.flask_app.id
}

output "instance_public_ip" {
  value = aws_instance.flask_app.public_ip
}

output "instance_public_dns" {
  value = aws_instance.flask_app.public_dns
}
