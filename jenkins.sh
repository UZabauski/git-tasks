#install java and nginx
sudo yum install -y java nginx
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
