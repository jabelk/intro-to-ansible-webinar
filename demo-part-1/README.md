# Demo Part 1: Ansible Basics

These demos are using the [NSO DevNet Sandbox](https://devnetsandbox.cisco.com/RM/Diagram/Index/43244b33-7af5-4e6b-9b48-58cadf3d2d24?diagramType=Topology), not because we are using NSO, but it has a nice topology and we can reserve it for a week at a time.

The docker component and basic structure of this example follows [Barry Weiss' super helpful Ansible repo](https://github.com/barweiss45/Ansible-IOSXE-Always-On-Demo), check it out for more examples. This repo has a `requirements.txt` file for the version of Ansible used and a dockerfile. See Barry's repo on how to set it up, only basic instructions will be given here.


```bash
git clone https://github.com/jabelk/intro-to-ansible-webinar.git
cd intro-to-ansible-webinar
docker build -t intro-ansible-webinar:latest .
docker run -dit --rm --name webinar-demo intro-ansible-webinar:latest
docker exec -it webinar-demo bash
cd intro-to-ansible-webinar/
ls
cd demo-part-1/
ansible-playbook -i inventory.ini 0-playbook-basics.yaml -v
```

If you are using docker, you can attach [VS Code to it](https://code.visualstudio.com/docs/remote/attach-container). You don't need to use docker, you can set up a virtual environment, or install Ansible on your device directly. Installing Ansible is not within the scope of this tutorial.

Tips:

- shift tab
- vs code for yaml
- muscle memory
- comment out
- don't make too many changes at once
- double quotes outside everything
- single quotes within double quotes.

variables ecosystem / j2 / roles next time