# Dockerfiles

## blackarch-zsh

The blackarch-zsh is built upon dadevel's blackarch [HERE](https://github.com/dadevel/dockerfiles/tree/master/blackarch)
The credit of creating users, managing permissions and basically creating basic blackarch environment goes to him.

This version though offers few upgrades... one of them is the added zsh shell with nice Luke Smith's theme as default, though, you can change reference in this Dockerfile for any .zshrc that you want to have. There is also bat for better manpages and as a replacement of cat

It also downloads blackarch-ctf-bugbounty.sh that would download many great tools for solving ctfs, hack the boxes, and that would be useful in bug bounty hunting and recon.

### USAGE - blackarch-zsh

First you need to build the image from Dockerfile

``` docker build -t blackarch-zsh ```

After that, all you need to do is run docker-compose!

``` docker-compose up ```

IF the docker-compose didn't attached you to the container you can do this with:

``` docker attach blackarch-zsh ``` while docker-compose is still running

To stop the container type:

``` docker-compose down ```
or Ctrl + c to gracefully exit the container
### COMMON ISSUES - blackarch-zsh

#### No internet access / Temporary failure in name resolution.

This issue happened to me and it's caused by failure to resolve DNSes. I don't exactly know why it's happening to this image, and not dadevels, but there's a way to solve this:

```sudo vim /etc/docker/daemon.json```

and add following content
```json
{
	"dns": ["8.8.8.8", "8.8.4.4"]
}
```
then restart docker service with:

``` sudo service docker restart ```

### How to expand this Dockerfile:
There are few rules for expanding this Dockerfile:
- Avoid using $HOME variable, as it will evaluate to root's directory and wouldn't affect the user 'penelope'. The `WORKDIR /home/penelope` makes that you don't need to use $HOME variable
- Understanding of dadevel's Dockerfile is really helpful in expanding this Dockerfile

### TODO - blackarch-zsh

- [ ] I want to separate dadevel's dockerfile with my, as it would improve redundancy of the docker image. Unfortunately, I tried that already and there were issues regarding ENTRYPOINT and in general - penelope user.

- [ ] For many people, docker-compose doesn't attach you to the container automatically. I don't know what might be the issue

### CONTRIBUTING

I am not an expert in building docker images and Dockerfiles, if you think you could solve the issue from TODO section, I would really appreaciate it
