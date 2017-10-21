RTutor Docker Container
------------------------

A docker container with an RStudio server for running RTutor problemsets (see https://github.com/skranz/RTutor)

The container has RTutor and all other required R packages installed, as well as a bunch of example problem sets.

To run the container adapt the following docker RUN command by entering a password for <YOUR_PASSWORD>
```
docker run -entrypoint="/usr/bin/with-contenv bash" --name rtutor -d -p 9898:8787 -e ROOT=TRUE -e USER=rtutor -e PASSWORD=<YOUR_PASSWORD> skranz/rtutor
```
You can then go to your webbrowser and open RStudio server under 

`http://localhost:9898` 

Adapt the URL if you run the container on your webserver. You can map the RStudio port to some other port than 9898 by changing the `-p 9898:8787` argument in docker RUN command.

When you start the RStudio server, you will find in the file pane under `/home/rtutor/ps` the example problem sets that are contained in the container. If you go to a problem set folder, open the file `run.R` and source all code to start the problem set. You can also take a look at the source code of the problem set, by opening the `<problemsetname>_sol.Rmd` file. 

You can install additional problem sets simply by entering the installation commands described on the Github sites of the problem sets in your RStudio server instance. 

If you want to create your own problem sets, it makes sense to mount a directory of your host computer to the docker container. Simple use the `-v` parameter in your docker RUN command. For example

```
docker run -entrypoint="/usr/bin/with-contenv bash" --name rtutor -d -p 9898:8787 -e ROOT=TRUE -e USER=rtutor -e PASSWORD=<YOUR_PASSWORD> -v <DIR_ON_HOST>:/home/rtutor/myps skranz/rtutor
```
where you should replace `<DIR_ON_HOST>` with the directory on your host computer.
