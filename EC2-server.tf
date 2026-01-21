# --- 4. Compute (Web Tier) ---
resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 (US-East-1)
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              echo "<h1>HELLO! ADITYA DONGARE</h1>" | sudo tee /var/www/html/index.html
              sudo systemctl start apache2
              EOF

  tags = { Name = "WebServer" }
}

