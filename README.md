RTutor Docker Container
------------------------

A docker container with an RStudio server for running RTutor problemsets (see https://github.com/skranz/RTutor)

The container has RTutor and all other required R packages installed, as well as a bunch of example problem sets.

To run the container adapt the following docker run command by entering a password for <YOUR_PASSWORD>
```
docker run -entrypoint="/usr/bin/with-contenv bash" --name rtutor -d -p 9898:8787 -e ROOT=TRUE -e USER=rtutor -e PASSWORD=<YOUR_PASSWORD> skranz/rtutor
```
You can then go to your webbrowser and open RStudio server under 

http://localhost:9898 

(Or another URL if you run the container on your webserver). You can map the RStudio port to some other port than 9898 by changing the `-p 9898:8787` argument in docker run.

The example problemsets can be found in the directory `/home/rtutor/ps` inside your container. You can install additional problem sets simply by entering the installation commands described on the Github sites of the problem sets in your RStudio server instance. 


