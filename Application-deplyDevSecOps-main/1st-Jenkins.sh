#!/bin/bash
set -e

# Install a supported JRE (adjust version to what apt-cache shows)
sudo apt-get update -y
sudo apt-get install -y openjdk-21-jre-headless

# Keyrings folder
sudo mkdir -p /usr/share/keyrings

# Download the CURRENT Jenkins signing key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2026.key

# Add Jenkins repo
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins

