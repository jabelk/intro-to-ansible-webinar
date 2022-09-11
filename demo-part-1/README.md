# Ansible-IOSXE-Always-On-Demo

[![published](https://static.production.devnetcloud.com/codeexchange/assets/images/devnet-published.svg)](https://developer.cisco.com/codeexchange/github/repo/barweiss45/Ansible-IOSXE-Always-On-Demo)

## Introduction

For the past few years the network engineering industry has been bombarded with new ideas about Network Automation, Software Defined Networks, Infrastructure as Code (IaC), and the like. It can be really overwhelming to keep out with these new technologies while just keeping up with your day to day work. As a network engineer in the past, when I would hear about all the new automation rage that was supposed to make my work easier I always found myself saying, "Ok where do I start." When I first started my Network Automation journey I was like many other Network Engineers, I lived in the world of the command line interface of systems like IOS or JunOS and the like. I eat and breathed layers 1 through 3 and sometimes 4 of the OSI model and frankly I was pretty much just concerned about getting data from point A to point B. I would like to call it being a "data plumber" and as far as DevOps and programmability was concerned that was someone elses problem. Therefore when it came time for to learn I would spend hours trying to set up my environment and troubleshoot why the very thing I was supposed to test didn't work. I would wast evening and weekends of my life just trying to get the lab to function so I could, learn about Network Automation. That is why I made this demo. It is my goal that the containerized environment will take away the hours spent trying to just get your environment set up. Furthermore, Cisco DevNet's always on IOS XE router sandboxes are the perfect place to test your playbooks. By the end of this demo it is my hope you will see the possiblities of a working ansible environment in acttion and encourage you to begin a deeper journey into Network automation and programibility.

Based on the idea of portability, this lab uses a Docker container running Anisble on an Ubuntu 20.04 Focal image with Python 3.6.10. This portable environment makes it easier to get started with this demo, rather than spending time trying to get your environment set up on your host system. You may run into compatibility issues, you may inadvertently download the wrong version of Python or Ansible; regardless the reason, spending time to set up your system will take time away from what you are here to do and that's to do a hands on demonstration of Ansible network automation. Although you will need to install Docker on your system, this should not be to daunting and there is plenty of resources out there to help you install Docker if you run into problems. Docker is supported on a multitude of operating systems and I will direct you to approriate resouces below in the [Setting up Docker](#setting-up-docker) section.

This lab utilizes the Cisco DevNet's "IOS XE on CSR Recommended Code Always On" sandbox, which is a CSR 1000v currently on a recommended version IOS XE and per the documentation is updated every 12 months.  For more information on the always on sandbox please visit [devnetsandbox.cisco.com](https://devnetsandbox.cisco.com/), if you don't have a DevNet Login, you will be required to register with DevNet, but don't worry, its free! The 'always-on' sandbox is the perfect place to test out the basics of network automation with Ansible. The device is up and running, its not production, and is easily accesible from the internet. Once you have gotten comfortable with the basics of Anisble in this lab, you can branch out to your own lab. I encourage you to set up your own environment such as CML, EveNG, or GNS3 and began to branch out further with Ansible there. I have created a next step walkthrough on a more sophisticated topology for those that are interested. Please visit my repository [Ansible-CML-Demo](https://github.com/barweiss45/Ansible-CML-Demo) if you are looking for a little deeper dive, but just a fair warning the repo is still underconstruction.

## Pre-requisite Skills for this Lab

This is a list of skills that I am asssuming you have prior to running through this demo. However, if you are hazy on a the topics below I have provided some links to help in your learning journey. In the end, if you are hazy on a few of the skills don't worry. This is a walkthrough so if you follow the instructions you'll get through the material. Just be aware that I may skip and glance over some of the basics so, use this section as supplemental resuouce section if you are looking for more information.

* Basic Linux Administration
  * Understanding Bash
  * Linux File Systems and Structures
* Working with Containers and Docker
  * What is a Container?
  * Docker Basics
* Understanding Data Serialization
  * What is YAML?
  * What is JSON?
* Basic Python and Programmaility

## About DevNet's Always On Labs

Information about DevNet's "Always On" lab can be found on [devnetsandbox.cisco.com](https://devnetsandbox.cisco.com). You will be required to login to DevNet (developer.cisco.com). If you do not have a DevNet login then you'll need to register, but don't worry, its free. You don't have to access the device from the web page to do this demo. Everything is already set up for you, but I figured I'd provide you this information if you would like to learn more.

![Screenshot information for the "IOS XE on CSR Recommended Code Always On Sandbox](https://lucid.app/publicSegments/view/4f99bd87-ff95-4e6e-b739-fa5a3d8591be/image.png)

If you find there is an issue with accessing the labs, please reach out to the DevNet Sandbox team on the Cisco Community forums. They are very response and should be able to fix the issue with in 24 hours or so. Here is a direct link to the sub-group forum: [community.cisco.com/t5/devnet-sandbox/bd-p/4426j-disc-dev-devnet-sandbox](https://community.cisco.com/t5/devnet-sandbox/bd-p/4426j-disc-dev-devnet-sandbox)

## Setting up Docker

If you do not have Docker installed on your system, that is fine. I will provide you some links that will walk you through this. Installing docker is not difficult and should only take a few minutes to do. However, you will need adequate privileges to install it. If you already have docker installed on your system you can skip this section. Below are links to the official install instructions on Docker.com. **Docker for Desktop will require a license for use by organizations with more than 250 employees or more than $10 Million in revenue starting January 1, 2022.** You may also choose to use [Podman](https://podman.io/) as an alternative to Docker if you are using Linux.

* [Install Docker on Windows](https://docs.docker.com/desktop/windows/install/)
* [Install Docker on MacOS](https://docs.docker.com/desktop/mac/install/)
* [Install Docker on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
* [Install Docker on CentOS](https://docs.docker.com/engine/install/centos/)
* [General Docker Install Information](https://docs.docker.com/engine/install/)

## Cloning Repo and Building the Container

**NOTE:** All instruction will be given in the command line. You can use a gui for some of the things I will talk about below, but the instuction will vary from GUI application to GUI appliacation so it is easier for me to present this information in the command line format.

:warning:&nbsp; **Before you start!** It is assumed that you have ```git``` on your computer. If you are unsure if it is installed on your computer, then run the following in the command line:
```git --version```
If you you receive an error then ```git``` is probably not installed. If you need to install ```git``` then please visit this [page](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and follow the instructions there.

1. Create a directory for this repo and then clone it do that directory.

    ```bash
    mkdir Ansible-IOSXE-Always-On-Demo
    git clone https://github.com/barweiss45/Ansible-IOSXE-Always-On-Demo.git
    ```

2. Change the directory to to the cloned repo of Ansible-IOSXE-Always-On-Demo.

    ```bash
    cd Ansible-IOSXE-Always-On-Demo
    ```

3. Ensure that you have your container environment ready. If not see [Setting up Docker](#setting-up-docker). If you are using Docker you can verify this by running the following command. If you don't get the expected output when you check for the version then Docker is probably not installed.

    ```bash
    docker --version
    ```

4. As mentioned before I have created a ```Dockerfile``` so that you can run this demo out of my prebuilt and tested environment. To build the Docker container, you can run the following commands. In order for this command to work you need to be in the Ansible-IOSXE-Always-On-Demo folder. See step 2 if you are unsure.

   :warning:&nbsp; Be aware that the initial build of this container may take upwards to 5 to 10 minutes depending on your internet connection and local machine.

    ```bash
    docker build -t ansible-iosxe-always-on-demo:latest  .
    ```

5. After you have built the container then verify that the image is now in your local container repository.

    ```bash
    docker images
    ```

6. Your output should look something like this. Once you are at this point you are ready to start the container and begin the demo. Please move on to the next section [Accessing The Lab](#accessing-the-lab) below.

## Accessing The Lab

Access the lab once the container is very straightfoward. After the container is built you will need to first run it. The way that I demonstrate has you open a second ```bash``` session to log it. This way if you exit out of the container you don't stop the container. If you do stop the container then you just simply need to restart the contaier by running the command ```docker start ansible-demo```.

1. First you will need to run the container to get it going.

    ```bash
    docker run -dit --rm --name ansible-demo ansible-iosxe-always-on-demo:latest
    ```

2. If the command is successful you will see a container ID (is a hash) returned in the next line. You can also verify with the following command.

    ```bash
    docker ps -a
    ```

3. Once you have verified that the container is running they log into it by running the following command.

    ```bash
    docker exec -it ansible-demo bash
    ```

4. When you are in the container you will see see a prompt that will look similar to this, ```root@c91ff98ffdec:~#```. The container ID will likely be different than what you see in the example. Verify the file structure, you should be in the home directory of root on the container. It should like what you see below.

    ```bash
    root@c91ff98ffdec:~# ls -al
    total 36
    drwx------ 1 root root 4096 Nov 15 21:10 .
    drwxr-xr-x 1 root root 4096 Nov 15 21:10 ..
    drwx------ 4 root root 4096 Nov 15 21:11 .ansible
    -rw-r--r-- 1 root root 3106 Dec  5  2019 .bashrc
    drwx------ 1 root root 4096 Nov 14 04:31 .cache
    -rw-r--r-- 1 root root  161 Dec  5  2019 .profile
    drwxr-xr-x 1 root root 4096 Nov 14 04:31 .pyenv
    drwxr-xr-x 1 root root 4096 Nov 14 04:32 Ansible-IOSXE-Always-On-Demo
    -rw-rw-r-- 1 root root  613 Nov 11 21:58 requirements.txt
    root@c91ff98ffdec:~# 
    ```

5. Change to the ```Ansible-IOSXE-Always-On-Demo``` directory in the container.

    ```bash
    cd Ansible-IOSXE-Always-On-Demo
    ```

6. Once you are in the ```Ansible-IOSXE-Always-On-Demo``` directory you are ready to start the lab.

    ```bash
    # To verify that you are in the right directory use the 'pwd' command 
    # and you should have the following output:
    root@c91ff98ffdec:~/Ansible-IOSXE-Always-On-Demo# pwd
    /root/Ansible-IOSXE-Always-On-Demo
    ```

7. When you are done with the lab you can simply type ```exit```. If you would like to stop the container then running the following command after you have exited it.

    ```bash
    docker stop ansible-demo
    ```

8. If you want to restart the container you can then run the following command.

    ```bash
    docker start ansible-demo
    ```

    Once your container is back up and running you can just start from step 3 in this section.

## Exploring the Anisble File Structure

Below is the file structure of this Demo:

```tree
.
├── Dockerfile
├── LICENSE
├── README.md
├── ansible.cfg
├── group_vars
│   └── routers.yml
├── host_vars
│   └── sandbox-iosxe-recomm-1.cisco.com.yml
├── inv.yml
├── playbooks
│   ├── pb-good-citzen-script.yml
│   ├── pb-iosxe-configure-interface-cli-config-mod.yml
│   ├── pb-iosxe-get-facts-with-template.yml
│   ├── pb-iosxe-get-facts.yml
│   └── playbook-template.yml
├── requirements.txt
└── templates
    ├── facts-template.j2
    ├── good-citizen-interface-template.j2
    └── interface-template.j2
```

There are some folders here that you are not really part of 'Ansible' but just part of the lab. The folders and files that are noteworthy though are:

* **ansible.cfg** - the ansisible.cfg is an .ini file that allows you to set the way the entire Ansible application operates. The file allows you to control settings and options for Ansible. Ansible derives its operational settings from a heirarchy of ansible config files at the system, global, and local levels. I highy recomend reviewing ['Ansible Configuration Settings'](https://docs.ansible.com/ansible/latest/reference_appendices/config.html)  to familiarize yourself to understand how this file operates and to see all the available options. There are actually over a hundred settings that you can tweak in this file, but generally you'll only use a few. This file is also location specific, Ansible will first check the environmental variable in you shell first, then moving on to this file in your current directory. Next Ansible will check the settings in the ~/.ansible.cfg file in your home directory and then finally checking your settings in the /etc/ansible/ansible.cfg. The command ```anisble-config list|dump|view``` will display all your current configurations for your ansible deployment.
* **inv.yml** - is the inventory file. You may see some tutorials and implentations name this as host.yml. The fact is Ansible doesn't really care what you name this file. You can point your Ansible implementation to any inventory file by using the the ansible configuration file (see above). This lab sets the inventory location with the following value in ansible.cfg with ```inventory = inv.yml``` in the ```[defaults]``` section. As you can see you can set the inventory file to any file in any location. For more robust deployments Ansible can support dynamic inventories and retrieve inventories from other databases. Review the inventory file documentation for more information about the inventory file [here](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html). You can use the command ```ansible-inventory``` to display the configured inventory in various formats run ```man ansible-inventory``` in the shell for more information.
* **group_vars/** - this directory contains YAML file(s) that contain variables that are specific to a specific group of hosts in the inventory. There is not too much to this file but you can read about it in the Ansible documenation [here](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/host_group_vars_vars.html).
* **host_vars/** - this directory contains YAML files that contain variables that are specific to a particluar host that is listed in the inventory. Just like ```group_vars/``` you can read more about them [here](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/host_group_vars_vars.html).
* **playbooks/** - This is a directory that I created for all the playbooks in this demo. Some other labs and demos will not have this folder but I like using it so that my directory looks a little more clean and orgainized.
* **templates/** - this folder is similar to my ```playbooks/``` directory, it serves as a location to store my jinja2 templates for this project. As far as I can tell it doesn't matter where you store this file or what its named, but it is good to put it somewhere it is going to make sense.

## Running a Ansible Playbook

Let's start your Ansible demonstration here!

1. Be sure you are in the ```-IOSXE-Always-OnAnsible-Demo``` folder, use the 'pwd' command to verify. If you run into issues then refer to the section [Accessing the Lab](#accessing-the-lab)

    ```bash
    pwd

    # You should be in this directory:
    /root/Ansible-IOSXE-Always-On-Demo
    ```

2. To be sure that the always on device is available, let's ssh into sandbox-iosxe-recomm-1.cisco.com since ping will not work.

    ```bash
    ssh developer@sandbox-iosxe-recomm-1.cisco.com
    ```

    The password is ```C1sco12345```. 
    You should be able to log into the CSR. Once you are logged in you can log back out. If you are unable to log in there may  be a problem with the always on device. Hey, its open to the public! ```¯\_(ツ)_/¯```. If you run into issues you rearch out to the [Sandbox Forums](https://community.cisco.com/t5/devnet-sandbox/bd-p/4426j-disc-dev-devnet-sandbox). You also can run this lab on the other always CSR that is running the latest code. That URL is ```sandbox-iosxe-latest-1.cisco.com```. Just remember to update the inventory file ```Ansible-IOSXE-Always-On-Demo/inv.yml```.

3. So let's gather some information about this device. To run the ansible playbook you will use the ```ansible-playbook`` command.

    ```bash
    ansible-playbook ansible-playbook playbooks/pb-iosxe-get-facts.yml 
    ```

    If everything is working properly you will get information about the always on router. Ansible is very descriptive ad will do its best to notify you that there is an error. If you get anything colored red when you run this particular playbook that there is something wrong and the script failed. However green is good and if at the end of the playbook you get the following output then the playbook ran successfully.

    Example of what you should have.

    ```bash
    PLAY RECAP ***************************************************************************************************************************************
    sandbox-iosxe-recomm-1.cisco.com : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    ```

Now that you've ran your first playbook let's discuss what an Ansible playbook is.

### The Anatomy of a Playbook

Ansible uses a YAML file called a playbook, which is a set of instructions that tells Ansible what you want it to do. The **playbook** can be made up of one or more plays. A **play** tells Ansible who it is connecting to and how it is connecting, although there are some other options at this level but we wont worry about that right now. The **play** consists of **tasks** and they are where the action happens. The **tasks** are mae up of modules that tell Anisble what to do and it is here that Ansible pulls together the variables found in the host_var and group_var directories as well as the templates file. All these elements (playbook, play, tasks) are hierarchically listed in an YAML file.

```tree
#PLAYBOOK.yml#
- Play 1
 - Task 1
 - Task 2
 - Task 3
- Play 2
 - Task 1
 - Task 2

 and so on!
```

Playbooks are at the heart of ansible and tells Ansible what it is that you want it to do. As we discussed earlier the **tasks** contain **modules** and **modules** are like the verbs of Ansile. Behind the scenes they are made up of code that instruct on how to carry out the action you want it to do. There are numerous modules that are avaialble and Ansible has them all very well documented.

### Using 'ansible-doc'

One way to lookup information about ansible is going to [docs.ansible.com](https://docs.ansible.com/), but Ansible also provides you a quick way of looking up information about ansible in the command line. You can use the ```ansible-doc``` command to look up information about a particular module. The becomes very useful when you are trying to write your own playbooks. ```ansible-doc``` is like using a ```man``` page and uses vim like features that allows you to search the document. 

Take a moment to review the ```cli_config``` module, which will be a module that you will be using later in this demonstration.

```bash
ansible-doc cli_config

# Then use type 'q' when you are done reviewing to exit.
```

## Using Jinja2 Templates with Ansible

Ansible provides a convienent way of templating by using the Jinja tempalating engine. For more information about the specifics of Jinja2 and what it can do I recommend visiting thier repo at [github.com/pallets/jinja](https://github.com/pallets/jinja) and reading their README.md as well as their official docmentation at [jinja.palletsprojects.com](https://jinja.palletsprojects.com/en/3.0.x/). One particular piece of documentation I highly recommend reading Ansible's official documentation on [templating with Jinja2](https://docs.ansible.com/ansible/latest/user_guide/playbooks_templating.html). One of the benefits of templating with Jinja is the ability to limit the size of your playbooks. Imagine if you had to update a 100 routers with a new loopback interface without templating. Without templating you would have to write out each command for each loopback on each router. Another example is if you had a standardized base config that always used the same base commands but the values were different (e.g. different NTP servers, DNS servers, Hostnames, etc). This scenarios are made easier with templating. In ansible all the templates are found in the ```templates``` folder.

The jinja2 templates allow you to build a skeleton of your configurations and then you are able to place in varable placeholders that point back to variables that are set through anisble wether it been in a ```playbook```, the ```host_vars```, or the ```group_vars``` directory. This flexibilty lends itself to allow your playbooks to be portable and requires less work to automate to a large amount of devices with various varilables in their configurations. Take a moment to review the the ```templates``` folder. You will notice that all the files end with the ```.j2``` extension.

This is the ```facts-template.j2```:

```jinja
Sandbox Device Gather Facts output:
Hostname: {{ ansible_net_hostname }}
Model: {{ ansible_net_model }}
IOS type: {{ ansible_net_iostype }}
OS Version: {{ ansible_net_version }}
Serial: {{ ansible_net_serialnum }}
Interfaces:
  {% for  iname, idata  in raw_facts['ansible_facts']['ansible_net_interfaces'].items() %}
    Interface: {{ iname }}
    Decription: {{ idata.description}}
     {% for ip in idata.ipv4 %}
    Ipv4 address/cidr: {{ ip['address'] }}/{{ ip['subnet'] }}
     {% endfor %}
    Status: {{ idata.operstatus }}
      ======================
      {% endfor %}
```

The variables are surrounded by double curly braces ```{{ }}``` and these variables values are pulled from various parts of Ansible. As you recall when we ran the playbook ```pb-iosxe-get-facts.yml``` the output about the facts were displayed in a key value pair format (formatted in YAML). In the first part of the templay the variables are the keys that were in the get facts output and when this template gets rendered by Ansible it will uses the values retrieved from the ```ios_facts``` module. In the second part of the template where the interfaces information is rendered we are able to leverage jinja2 flexible programibility to iterate the nested dictionary in the output for each interface. This comes handy when we don't know how many interfaces a device will have and since the host sandbox-iosxe-recomm-1.cisco.com is open the public and anyone can configure it, there are a multitude of interfaces configured at any time. Jinja is capable of all sorts of programibilty like loops, condiditionals, filters, etc.

Let's go ahead and take a moment to review the ```pb-iosxe-get-facts-with-template.yml``` playbook.

```yaml
---
# This playbook is very basic and is used to demonstrate the basics about ansible
- name: "PLAY 1: This playbook gathers facts from sandbox-iosxe-recomm-1.cisco.com and prints them in the output and then saves it to the output folder"
  hosts: routers           # THIS WILL REFER TO THE HOST/GROUP THAT THIS PLAY IS TARGETING
  connection: network_cli  # FOR NETWORK DEVICES THE CONNECTION WILL BE 'network_cli'
  tasks:                   # BELOW TASKS IS WHERE EACH TASK IS DEFINED
    - name: "TASK 1: Connect to the device to gather facts about it"
      ios_facts:
      register: raw_facts

    - name: "TASK 2: Print out some information about the device that is formatted on the cli"
      debug:
        msg: "The hostname is {{ ansible_net_hostname }} and the OS is {{ ansible_net_version }}"

    - name: "TASK 3: Print the raw output"
      debug:
        msg: "{{ raw_facts }}"

    - name: "TASK 4: Create outputs/ folder if it does not exist"
      file:
        path: "outputs"
        state: directory
        mode: 0775
      run_once: true

    - name: "TASK 5: send the output of raw_facts to a nice template and print it to a file"
      copy:
        content: "{{ lookup( 'template', '../templates/facts-template.j2') }}"
        dest: "outputs/{{ inventory_hostname }}.txt"
        mode: 0664
```

You will can see that you are even able to use jinja inside the Tasks as well. In this playbook we will run a similar play as the first playbook but this time we will create a folder called outputs if it doesn't exist and then send the output of the playbook to the output directory in the form of a .txt file named after the hostname of the device. Take note of task 5 in the playbook:

```YAML
    - name: "TASK 5: send the output of raw_facts to a nice template and print it to a file"
      copy:
        content: "{{ lookup( 'template', '../templates/facts-template.j2') }}"
        dest: "outputs/{{ inventory_hostname }}.txt"
        mode: 0664
```

You will see that we are using the ```copy``` module and nested below is the options. The option content is using the ```lookup``` filter which tells ansible that we are looking for a ```'template'``` in the destination of ```'../templates/facts-template.j2'```. Ansible will then render that template using the variables that have beend defined including the key values that were retrieved from the ```ios_facts``` module.

Before running the ```pb-iosxe-get-facts-with-template.yml``` be sure you are in the ```:~/Ansible-IOSXE-Always-On-Demo``` folder. To run the command you can enter the command:

```bash
ansible-playbook playbooks/pb-iosxe-get-facts-with-template.yml
```

## Configuring an Interface

***Under Construction***

Retriving information is one thing that Ansible is great at doing but now we really want to leverage to power of automation by configuring network devices. There are many modules out there that you can use to configure your network device. Ansible ships with a multitude of modules for various vendors, including Cisco. There are also vendor netrual modules focused on network configuration. We are going ot be focused on the ```cli_config``` module. This module allows us to enter confiiguration commands into the the router as if we were directly in ```conf t``` ourselves. This module works for IOS, IOS XE, and even IOS XR. Please read the documentation by running the following the command line:

```bash
ansible-doc cli_config
```

After reviewing the documentation, take a moment to review the playbook in the ```./playbooks``` folder. Let's breakdown the playbook and see what is going on here.

First we have to create the name of the play book, just like wat we did in the previous 'get facts' playbooks we ran earlier. In this section you are naming the playbook, telling ansible which hosts to make the change on, and the connection type. In this case, I created a descriptive line in the 'name' section and the playbook will access the 'routers' group in the inventory (the file named inv.yml) which is defined in the 'hosts' key. Since we are going to access a network device over ssh we will set the 'connection' key to 'network_cli'. After that, we need to define the tasks.

```yaml
---
- name: "PLAY 1: This playbook configures loopback interfaces on sandbox-iosxe-recomm-1.cisco.com using a cli_conig module and a jinja"
  hosts: routers            # THIS WILL REFER TO THE HOST/GROUP THAT THIS PLAY IS TARGETING
  connection: network_cli   # FOR NETWORK DEVICES THE CONNECTION WILL BE 'network_cli'
```

Next is the tasks section. The tasks section is similar to the the other playbooks we ran. Here we can see that we are using the ```cli_config``` module. In the ```config``` key we are using a filter to tell Ansible to use the ```interface-template.j2``` jinja template in the ```templates``` folder. We are using a template again, otherwise if we didn't use a template we would have to list out each specific command in the config section. Just like in our earlier example using templates give us much more fexiblity in our playbooks. Take a moment to review ```templates/interface-template.j2``` file, you'll see that the values such as IP address and subnet mask as retrieved from the variables that are stored in the ```host_vars``` folder.  

```yaml
  tasks:                    # BELOW TASKS IS WHERE EACH TASK IS DEFINED
    - name: "TASK 1: Configure the loopback interfaces that are listed in the host_vars/ directory"
      cli_config:
        config: "{{ lookup('template', '../templates/interface-template.j2') }}"
      notify: config_changed  # a conditional that notifies the handler below if the configuration has changed.
      register: cli_result    # save the output to the 'cli_result'

  handlers:
    - name: "HANDLER OUTPUT: Display output of TASK 1 if configure has changed"
      listen: config_changed  # If the notify sends then config_changed then run debug.msg below
      debug:
        msg: "{{ cli_result }}"
```


## Being a Good Citizen

    **COMING SOON**

