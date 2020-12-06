# Hacking With Me - Docker CTF Cyber Security Learning Enviornment

This repository features the Dockerfiles and other challenge files needed for the [hackingwith.me](hackingwith.me) Capture The Flag website.

Challenges include:

- Linux Basics Container
  - These challenges go over basic command line tools which are used to find flags to enter the next challenge.
  
- Steganography Container
  - These challenges go over tools needed to extract hidden flags from images and other files which are used to enter the next challenge.

- Brute Force Container
  - These challenges go over ways to brute force files and get flags from them which are used to enter the next challenge.
  - **This image is still being worked on and does not yet compile.**
  
## How to use:

````bash
git clone https://github.com/steven-coll/hacking-with-me.git

cd hacking-with-me

#then choose a challenge directory

cd /challengeyouwanttorun

sudo docker build .

sudo docker run *image-id* -p *portnumber*
````
