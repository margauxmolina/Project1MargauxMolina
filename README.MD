## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](Images/project1.1.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yaml file may be used to install only certain pieces of it, such as Filebeat.

  - [filebeat-playbook](Ansible/filebeat-playbook.yml)
  - [filebeat-config](Ansible/filebeat-config.yml)
  - [install-elk](Ansible/install-elk.yml)
  - [my-playbook](Ansible/my-playbook.yml)
  
This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
What aspect of security do load balancers protect? What is the advantage of a jump box?_
protect applications from emerging threats: the web application firewall (WAF) in the load balancer protects your website from hackers and includes daily rule updates just like a virus scanner.
authenticate user access: the load balancer can request a username and password before granting access to your website to protect against unauthorized access.
protect against DDoS attack: the load balancer can request a username and password before granting access to your website to protect against unauthorized access.
Simplify PCI compliance: if you process credit carrds, you need to comply with Payment Card Industry (PCI) regulations. a load balancer simplifies compliance with PCI rules.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Logs and system Traffic.
What does Filebeat watch for?
filebeat monitors the log files or locations that you specify, collects log events, and fowards them either to elasticlog or logstash for indexing.

What does Metricbeat record?_
metricbeat takes the metrics and statistics that it collects and ships them to the output that oyu specify.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.1   | Linux            |
| web 1.1  |web server| 10.0.0.6   | Linux            |
| web 2.2  |web server| 10.0.0.7   | Linux            |
| web 3.3  |web server| 10.0.0.9   | Linux            |
|red-elk-vm|elk server| 10.1.0.4   | Linux            |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
98.225.xxx.xx

Machines within the network can only be accessed by .
Which machine did you allow to access your ELK VM? What was its IP address?_
98.225.xxx.xx

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | yes                 | 98.225.xxx.xx        |
| web 1.1  | no                  | 10.0.0.4             |
| web 2.2  | no                  | 10.0.0.4             |
| web 3.3  | no                  | 10.0.0.4             |
|elk-web-vm| yes                 | 98.225.xxx.xx        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
What is the main advantage of automating configuration with Ansible?_
ansible allows a single person to deploy the same configuration across multiple devices quickly with out the risk of human error. 

The playbook implements the following tasks:
In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- install docker
- download ansible
- configure elk-playbook.yaml 
- push the play book to the machine/machines
- ssh into the machine and confirm the playbook was successful

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](Images/dockerps.jpg)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-List the IP addresses of the machines you are monitoring_
- 10.0.0.6
- 10.0.0.7
- 10.0.0.9

We have installed the following Beats on these machines:
-Specify which Beats you successfully installed_
filebeat

These Beats allow us to collect the following information from each machine:
In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

-filebeat: collects data about the file system such as log events, and ships them to the comnitoring cluster.

-metricbeat: collects metrics and statistics and ships them to the output that was specified, such as Elasticsearch or Logstash

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the my-playbook.yml file to the jumpbox anisble container.
- Update the hosts file to include the webserver and elk ip addresses.
- Run the playbook, and navigate to kibana to check that the installation worked as expected.

Answer the following questions to fill in the blanks:

- _Which file is the playbook? Where do you copy it?_
- the filebeat-plabook.yml 
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- by adding the elk servers ip address to the [ansible.cfg](Ansible/ansible.cfg) file
- _Which URL do you navigate to in order to check that the ELK server is running?
- http://52.167.162.34:5601/app/kibana


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

- nano ansible.cfg
- add the machine, its IP, and ansible_python_interpreter=/usr/bin/python3 to the hosts
- Ctrl + x to exit file
- in the folder that install-elk.yml is in, run: cp install-elk.yml /etc/ansible
- nano install-elk.yml /etc/ansible
- name: installing elk hosts: [your_machine]
- Ctrl + x to exit file
- ansible-playbook install-elk.yml
 
