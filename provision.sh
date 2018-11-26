#!/bin/bash
#MODIFIED SCRIPT BY IKAZLOUSKI
JENKINS_HOME=/opt/jenkins/master
JENKINS_DIR=/opt/jenkins/bin   #(<- .war here)
sudo yum install -y epel-release 

sudo yum install -y git nginxvim net-tools mc nano unzip wget nano firewalld httpd-tools
#java java-devel 

sudo yum install -y java-1.8.0-openjdk

echo "java has been installed"

cd /opt
sudo mkdir /opt/jenkins
sudo mkdir $JENKINS_HOME
sudo mkdir $JENKINS_DIR
cd $JENKINS_DIR

echo "directory for jenkins has been just created"


sudo wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war

