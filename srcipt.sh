printf "[Unit]\n" | sudo tee /etc/systemd/system/jenkins.service
printf "Description=Jenkins Daemon\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "[Service]\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "ExecStart=/usr/bin/java -jar /home/vagrant/jenkins.war\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "User=vagrant\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "[Install]\n" | sudo tee -a /etc/systemd/system/jenkins.service
printf "WantedBy=multi-user.target\n" | sudo tee -a /etc/systemd/system/jenkins.service
sudo systemctl start jenkins
