Read = 4
Write = 2
Execute = 1
Owner (rwx): 4 + 2 + 1 = 7

## Give self executable privileges:
```
chmod +x newfile.txt
```
or
```
chmod 755 newfile.txt
```

## Program:
```sh
#!/bin/bash

read -p "What are you having for tea? : " FOOD

echo "Hey $USER, you are having $FOOD for tea."
```

## Outcome:
xcci2036e1125b:week4 up2509065$ ./interactive.sh 

What are you having for tea? : mcdonalds

Hey up2509065, you are having mcdonalds for tea.

## Terminal Logs:
Last login: Thu Oct 23 15:21:44 on console

  

The default interactive shell is now zsh.

To update your account to use zsh, please run `chsh -s /bin/zsh`.

For more details, please visit https://support.apple.com/kb/HT208050.

xcci2036e1125b:~ up2509065$ man -l

/usr/bin/man: illegal option -- l

Usage:

 man [-adho] [-t | -w] [-M manpath] [-P pager] [-S mansect]

     [-m arch[:machine]] [-p [eprtv]] [mansect] page [...]

 man -f page [...] -- Emulates whatis(1)

 man -k page [...] -- Emulates apropos(1)

xcci2036e1125b:~ up2509065$ ls -l

total 0

drwx------+  6 up2509065  UNI\Domain Users   192 23 Oct 15:24 Desktop

drwx------+  4 up2509065  UNI\Domain Users   128 23 Oct 15:26 Documents

drwx------+  4 up2509065  UNI\Domain Users   128 23 Oct 15:24 Downloads

drwx------@ 79 up2509065  UNI\Domain Users  2528 23 Oct 15:24 Library

drwx------   3 up2509065  UNI\Domain Users    96 23 Oct 15:21 Movies

drwx------+  3 up2509065  UNI\Domain Users    96 23 Oct 15:21 Music

drwx------+  4 up2509065  UNI\Domain Users   128 23 Oct 15:22 Pictures

drwxr-xr-x+  4 up2509065  UNI\Domain Users   128 23 Oct 15:21 Public

xcci2036e1125b:~ up2509065$ cd Desktop/

xcci2036e1125b:Desktop up2509065$ ls -l

total 1128

-rw-r--r--@ 1 up2509065  UNI\Domain Users  574398 23 Oct 15:23 LocalHomeFolders.jpg

drwxr-xr-x@ 3 up2509065  UNI\Domain Users      96 29 Sep 18:21 Obsidian.app

xcci2036e1125b:Desktop up2509065$ mkdir week4

xcci2036e1125b:Desktop up2509065$ cd week4

xcci2036e1125b:week4 up2509065$ cd ~

xcci2036e1125b:~ up2509065$ cd Desktop/

xcci2036e1125b:Desktop up2509065$ cd week4/

xcci2036e1125b:week4 up2509065$ touch newfile.txt

xcci2036e1125b:week4 up2509065$ chmod 600 newfile.txt

xcci2036e1125b:week4 up2509065$ ls -l

total 0

-rw-------  1 up2509065  UNI\Domain Users  0 23 Oct 15:45 newfile.txt

xcci2036e1125b:week4 up2509065$ chmod 755 newfile.txt 

xcci2036e1125b:week4 up2509065$ ls -l

total 0

-rwxr-xr-x  1 up2509065  UNI\Domain Users  0 23 Oct 15:45 newfile.txt

xcci2036e1125b:week4 up2509065$ touch interactive.sh

xcci2036e1125b:week4 up2509065$ nano interactive.sh 

xcci2036e1125b:week4 up2509065$ open interactive.sh 

xcci2036e1125b:week4 up2509065$ open interactive.sh 

xcci2036e1125b:week4 up2509065$ ls -l

total 8

-rw-r--r--@ 1 up2509065  UNI\Domain Users  108 23 Oct 16:06 interactive.sh

-rwxr-xr-x  1 up2509065  UNI\Domain Users    0 23 Oct 15:45 newfile.txt

xcci2036e1125b:week4 up2509065$ chmod 755 interactive.sh 

xcci2036e1125b:week4 up2509065$ ls -l

total 8

-rwxr-xr-x@ 1 up2509065  UNI\Domain Users  108 23 Oct 16:06 interactive.sh

-rwxr-xr-x  1 up2509065  UNI\Domain Users    0 23 Oct 15:45 newfile.txt

xcci2036e1125b:week4 up2509065$ ./interactive.sh 

What are you having for tea? : mcdonalds

Hey up2509065, you are having mcdonalds for tea.

xcci2036e1125b:week4 up2509065$
