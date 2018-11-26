#install java and nginx
sudo yum install -y java nginx epel-release
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64" | sudo tee -a ~/.bash_profile
echo "export JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.el7_5.x86_64/jre" | sudo tee -a ~/.bash_profile

#install jenkins
sudo wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
sudo mkdir /opt/jenkins
sudo groupadd jenkins 
sudo useradd -M -s /bin/false -g jenkins -d /opt/jenkins jenkins
sudo cp -r jenkins.war /opt/jenkins/
sudo chown -R jenkins:jenkins /opt/jenkins

#Systemd  File
sudo touch /etc/systemd/system/jenkins.service
echo "[Unit]" | sudo tee -a /etc/systemd/system/jenkins.service 
echo "Description=Jenkins Daemon" | sudo tee -a /etc/systemd/system/jenkins.service
echo "[Service]" | sudo tee -a /etc/systemd/system/jenkins.service
echo "ExecStart=/usr/bin/java -Xms1500M -Xmx3000M -jar /opt/jenkins/jenkins.war" | sudo tee -a /etc/systemd/system/jenkins.service
echo "User=jenkins" | sudo tee -a /etc/systemd/system/jenkins.service
echo "[Install]" | sudo tee -a /etc/systemd/system/jenkins.service
echo "WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/jenkins.service
sudo sed -i '/^[^#].*location \/ {/a  proxy_pass    http://192.168.10.10:8080;' /etc/nginx/nginx.conf

sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl enable nginx
sudo systemctl start jenkins
sudo systemctl start nginx
