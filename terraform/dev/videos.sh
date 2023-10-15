#! /bin/bash
sudo yum update
sudo yum install -y httpd
sudo chkconfig httpd on
sudo service httpd start
sudo mkdir -p /var/www/html/videos
echo "<h1>This is TERRAFORM -VIDEOS@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ELB WORKING GOOD!!!!</h1>" | sudo tee /var/www/html/videos/index.html