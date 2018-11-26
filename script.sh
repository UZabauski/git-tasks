#install nginx and java
sudo yum install java nginx -y
sudo sed -i "/^[^#].*server {/i $(printf '%.0s\ ' {0..3})upstream jenkins {\n\tserver 127.0.0.1:8080;\n    }" /etc/nginx/nginx.conf
sudo sed -i '/^[^#].*location \//a \\tproxy_pass http://jenkins;' /etc/nginx/nginx.conf
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64/" | sudo tee -a ~/.bash_profile
echo "export JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64/jre" | sudo tee -a ~/.bash_profile
source ~/.bashrc
#install jenkins
cd /home/vagrant
sudo mkdir /opt/jenkins
sudo useradd jenkins -d /opt/jenkins
sudo chown jenkins:jenkins /opt/jenkins
cd /opt/jenkins
sudo wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
cd /etc/systemd/system/
sudo touch jenkins.service
printf "[Unit]\n" | sudo tee /etc/systemd/system/jenkins.service
printf "Description=Jenkins Daemon\n\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "[Service]\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "ExecStart=/usr/bin/java -jar /opt/jenkins/jenkins.war\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "User=jenkins\n\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "[Install]\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "WantedBy=multi-user.target\n" | sudo tee -a /etc/systemd/system/jenkins.service
sudo systemctl daemon-reload
sudo systemctl start nginx
sudo systemctl start jenkins.service
