# Dockerfiles

### blackarch-zsh

blackarch-zsh is my docker container that pre-configured with shell, environment tweaks while additional tools that (I found) helpful to my daily needs are installed.

It also downloads non-blackarch-tools that are **not** in blackarch [repository](https://www.blackarch.org/tools.html)

### WHY BLACKARCH? Why not container based on Kali

- The answer is simple. With Blackarch it's way easier to install packages with ```pacman -Syu <package_name>``` to install or ```pacman -Ss <package_name>``` to search for package.
- There are way more tools available on Blackarch, even those that are not mainstream. With Kali, you're stuck with packages that the devs chose to add
- It's way easier to ask for help if a given tool has some errors, because there's blackarch Discord server.

>I'm not saying that there's no great community for Kali, I just find it way more accessible in blackarch.

>Also, keep in mind, that it's mostly all about feeling confident with the OS you use, if you like Debian based apt package manager, nothing stops you from using it in Kali container. Though this container will probably remain blackarch based.

### CONS OF USING BLACKARCH

- If you're not proficient in Linux, or have never used Arch based OS, then you might struggle a bit with solving issues on your own. Though If we're saying about arch specific skills required to use this container then it's mostly knowledge about ```pacman``` package manager.

### USAGE - blackarch-zsh

All you have to do to install this container is cloning this repo:

```git clone https://github.com/Cloufish/dockerfiles.git```

OR just wget docker-compose:

```wget https://raw.githubusercontent.com/Cloufish/dockerfiles/master/blackarch-zsh/docker-compose.yml ```

 and then in cloned folder/in folder where docker-compose.yml file is, execute:

``` docker-compose up ```

IF the docker-compose didn't attached you to the container you can do this with:

``` docker attach blackarch-zsh ``` while docker-compose is still running

To stop the container type:

``` docker-compose down ```
or Ctrl + c to gracefully exit the container

This machine will be run always, unless you stopped it manually with 'docker stop'



### TODO - blackarch-zsh

- [ ] I want to separate dadevel's dockerfile with my, as it would improve redundancy of the docker image. Unfortunately, I tried that already and there were issues regarding ENTRYPOINT and in general - penelope user.

- [ ] For many people, docker-compose doesn't attach you to the container automatically. I don't know what might be the issue

### CONTRIBUTING

I am not an expert in building docker images and Dockerfiles, if you think you could solve the issue from TODO section, I would really appreaciate it

