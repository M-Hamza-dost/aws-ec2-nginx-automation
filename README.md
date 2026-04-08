Terraform & Ansible EC2 Nginx Setup
===================================

This project automates the end-to-end process of provisioning a server and configuring it for web hosting. By combining **Terraform** for infrastructure and **Ansible** for configuration, the entire environment is defined as code.

<br>

Project Overview
-------------------

The goal of this project is to eliminate manual setup by:

1.  **Terraform:** Provisioning an Amazon EC2 instance and a Security Group (allowing SSH and HTTP).
    
2.  **Ansible:** Connecting via SSH to install Nginx, deploy a custom web page, and manage services.

<br>

Tools used
-------------

*   **Cloud:** AWS (EC2)
    
*   **IaC:** Terraform
    
*   **Configuration Management:** Ansible
    
*   **Web Server:** Nginx

<br>

How it works, in simple terms
-------------

Terraform creates an EC2 instance and a security group that allows SSH and HTTP.

Ansible connects to the server using SSH installs Nginx adds a web page and restarts Nginx only if needed.

<br>

Prerequisites
----------------

*   An active **AWS account**.
    
*   Terraform.
    
*   Ansible.

<br>

   
Getting Started
------------------

### Step 1: Provision Infrastructure (Terraform)

Go to terraform folder:

    cd terraform

Initialize Terraform:

    terraform init

Apply configuration:

    terraform apply

After it finishes, you will see:

    public_ip = <your-ec2-ip>
  Copy this IP.

<br>

### Step 2 — Update Ansible inventory

Go to ansible folder:

    cd ../ansible

Open inventory.ini and replace:

    <PUBLIC_IP>

  with your actual EC2 IP.

<br>

### Step 3 — Run Ansible

    ansible-playbook -i inventory.ini playbook.yml

What this will do:

Connect to EC2

Install Nginx

Create a simple web page

<br>

### Step 4 — Verify

Open your browser:

    http://<your-ec2-ip>

You should see:

    Hello from Ansible
  
<br>

What I learned
----------------

*   **Infrastructure as Code:** How to create servers using Terraform.
    
*   **Configuration Management:** How to connect and configure them using Ansible.
    
*   **Basic flow of infrastructure + configuration together**
    
*   **Efficiency:** How automation avoids repeating the same setup again.
    

