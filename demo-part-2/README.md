# Demo Part 2: Jinja2 Templating with Ansible Variables Tips & Tricks

Links mentioned:
- https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable
- https://td4a.codethenetwork.com/

### Vars 

Ansible does apply variable precedence. Here is the order of precedence from least to greatest (the last listed variables override all other variables):

(Lowest precedence - getting overridden easily)
 1. command line values (for example, -u my_user, these are not variables)
 2. role defaults (defined in role/defaults/main.yml) 
 3. inventory file or script group vars 
 4. inventory group_vars/all 
 5. playbook group_vars/all  
 6. inventory group_vars/*  
 7. playbook group_vars/* 
 8. inventory file or script host vars  
 9. inventory host_vars/*  
10. playbook host_vars/*  
11. host facts / cached set_facts  
12. play vars
13. play vars_prompt
14. play vars_files
15. role vars (defined in role/vars/main.yml)
16. block vars (only for tasks in block)
17. task vars (only for the task)
18. include_vars
19. set_facts / registered vars
20. role (and include_role) params
21. include params
22. extra vars (for example, -e "user=my_user")(always win precedence)
(Highest precedence - overridding those below it)

In general, Ansible gives precedence to variables that were defined more recently, more actively, and with more explicit scope.


These demos are using the [NSO DevNet Sandbox](https://devnetsandbox.cisco.com/RM/Diagram/Index/43244b33-7af5-4e6b-9b48-58cadf3d2d24?diagramType=Topology), not because we are using NSO, but it has a nice topology (IOS, NXOS, ASA, XR) and we can reserve it for a week at a time.


The dockerfile provided follows [Barry Weiss' super helpful Ansible repo](https://github.com/barweiss45/Ansible-IOSXE-Always-On-Demo), check it out for more examples. This repo has a `requirements.txt` file for the version of Ansible used and a dockerfile. See Barry's repo on how to set it up, only basic instructions will be given here. If you do want to use docker, here are some commands that will get it up and running from my adaptation of Barry's repo.


```bash
git clone https://github.com/jabelk/intro-to-ansible-webinar.git
cd intro-to-ansible-webinar
docker build -t intro-ansible-webinar:latest .
docker run -dit --rm --name webinar-demo intro-ansible-webinar:latest
docker exec -it webinar-demo bash
cd intro-to-ansible-webinar/
cd demo-part-2/
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
- gather facts no
- looks for templates in playbook directory, so don't need full path unless playbooks are in a dir
- Ansible documentation and examples
- ignore_errors for uncertain playbooks