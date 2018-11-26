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
sudo systemctl start jenkins.service
