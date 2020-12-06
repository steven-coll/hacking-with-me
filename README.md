# Hacking With Me - CTF

This repository features the Dockerfiles and other challenge files 
needed for the [hackingwith.me](hackingwith.me) Capture The Flag website.
It will store all Dockerfiles of challenges running on hackingwith.me

- Linux Basics Container
  - These challenges go over basic command line tools which are used to find flags to enter the next challenge.
  
- Steganography Container
  - These challenges go over tools needed to extract hidden flags from images and other files which are used to enter the next challenge.

- Brute Force Container
  - These challenges go over ways to brute force files and get flags from them which are used to enter the next challenge.
  - **This image is still being worked on and does not yet compile.**
  
## How to use:

````bash
#installing Docker is required
sudo apt-get install docker
# OR
sudo yum install docker
---
# clone this repository
git clone https://github.com/steven-coll/hacking-with-me.git
# choose a challenge directory
cd hacking-with-me/challengeyouwanttorun
# build the docker image
sudo docker build .
# find the image id
sudo docker images
# run the enviornment with a port to ssh into, eg: 32768
sudo docker run -d -p 32768:22 *image-id*
# you can now ssh into it, locally or on an IP/domain webserver depending on how you are setting this up
ssh user0@localhost -p 32768
# the password for user0 is "password", the rest of the passwords are the flags achieved from the last challenge.
````
