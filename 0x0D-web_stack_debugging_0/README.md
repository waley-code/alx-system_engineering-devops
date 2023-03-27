# Web stack debugging #0
## DevOps	SysAdmin	Scripting	Debugging

### Background Context
The Webstack debugging series train me in the art of debugging. Computers and software rarely work the way we want (that’s the “fun” part of the job!).

Being able to debug a webstack is essential for a Full-Stack Software Engineer, and it takes practice to be a master of it.

In this debugging series, broken/bugged webstacks was given to me, the final goal was to come up with a Bash script that once executed, will bring the webstack to a working state. But before writing this Bash script,I should figure out what is going on and fix it manually.

In this first debugging project, I needed to get Apache to run on the container and to return a page containing Hello Holberton when querying the root of it.

Example:

	vagrant@vagrant:~$ docker run -p 8080:80 -d -it holbertonschool/265-0
	47ca3994a4910bbc29d1d8925b1c70e1bdd799f5442040365a7cb9a0db218021
	vagrant@vagrant:~$ docker ps
	CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS                  NAMES
	47ca3994a491        holbertonschool/265-0   "/bin/bash"         3 seconds ago       Up 2 seconds        0.0.0.0:8080->80/tcp   vigilant_tesla
	vagrant@vagrant:~$ curl 0:8080
	curl: (52) Empty reply from server
	vagrant@vagrant:~$
Here we can see that after starting my Docker container, I curl the port 8080 mapped to the Docker container port 80, it does not return a page but an error message.
After connecting to the container and fixing the apache server by starting it, you can see that curling port 80 return a page that contains Hello Holberton below
	vagrant@vagrant:~$ curl 0:8080
	Hello Holberton
	vagrant@vagrant:~$
