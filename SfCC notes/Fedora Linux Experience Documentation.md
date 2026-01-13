## Why I Chose Fedora?
Fedora Linux is one of the largest and most mainstream Linux distros, maintained by Red Hat, a very profitable organisation and the second largest contributor to Linux (out of all organisations). This means they are a well known and reputable provider for many servers across the world which use Linux as their operating system. As for their desktop OS, it is considered one of the best for anyone with basic Linux knowledge who is switching from Windows or MacOS, in my case I was switching from Windows, with previous extensive experience with Linux Mint and PopOS and some basic experience with Arch. I chose to fully switch to Linux instead of dual booting as I found Windows to be unethical in more recent times, with its invasive use of user data and lack of privacy features, as well as its pushing of AI features which are not only useless for my use case but also run on an external server which is known to harm the environment. Because of these reasons, I found turning to open source software, not only in an OS with Linux but also with software such as GIMP, Blender, OBS Studio and VLC Media Player, each providing an alternative to software run and controlled by organisations whose only real aim is for profit. While Fedora is owned and maintained by Red Hat, due to Fedora's open source and free nature, when using the OS it becomes clear that profit is not what drives this project, as it is refined to be a fantastic software for people who wish to get work done without any distractions or inconveniences, as I found most software I was already familiar with worked out of the box without any issues. On Window's I found the excessive number of AI tools in almost every application to be quite invasive, and often to get in the way of work or entertainment, because of this I was pleased that there was no AI tools built into Fedora, which was a large reason for me for switching to Linux. Also, due to it being open source, I found the customisability to be a major selling point, as I could customise my OS exactly to my preference to optimise efficiency, although I have found the customisability on Arch to be slightly easier when you understand the process. 

## My Experience
My overall experience with Fedora Linux was very positive. During my installation, as I had chosen to replace Windows, I used a USB with the ISO file on it to replace my OS. During my first attempt I experienced an issue with drivers which caused me to experience a completely black screen upon restarting my system. Because of this I figured the best course of action was to attempt to install it again, so I did, and experienced the same issue. Upon restarting my system a few times, I managed to get through to a very blurry and pixelated desktop. Due to having an Nvidia GPU, I had already known this would likely be an issue, as I had heard that proprietary software, like Nvidia's drivers, and open source software, like Linux, didn't always work well together. With this issue, I researched a solution and found some commands (all commands I used will be in the section below) and used them to fix this issue. The commands were inputted into the terminal and effectively installed the proprietary version of Nvidia's software, which was required for the 50 series GPU's. Upon doing this fix, I had no further issues with the setup. All my software installed correctly for about the first week. The only software I ever faced issues with was Steam, as my install had an issue with 32-bit software, which Steam apparently contains. To this day I am unsure if this is something that all Fedora installs experience, or just mine, but I could not get this to work, as the software needed was the same as what is required for Fedora OS, so I couldn't touch these system files. There is very possibly a way around this that I was unaware of, but I chose to go for the far easier route of using flatpak instead of dnf as I had with all other software up until this point. This worked perfectly and I then had all software set up and experience no issues. In terms of usability, Linux was perfect for my use case at the time as it supported all software I used, and I found accessing some other software, such as music players and file managers, to be more useful compared to their Windows equivalents due to customisability and lack of a common UI. As for hobbies, I found gaming on Linux to be as good as on Windows in majority of cases, with the only inconvenience being needing to preload some elements of the games on Steam. For work, it worked perfectly as majority of what I already did was on open source software, with the exception of DaVinci Resolve, which I found an alternative to which worked just as well in my use case, although will likely install Resolve next time as it apparently does work and is a far more advanced software.

## All Commands I Found Useful and Took Notes Of
Force nvidia comands:
```
sudo akmods --force 
sudo systemctl restart systemd-modules-load
```

System Info:
```
fastfetch
```

Audio Visualiser:
```
cava
```

Open a Port:
```
sudo firewall - cmd --permanent --add - port = 80/tcp
sudo firewall - cmd --reload
```

Music player:
```
kew
~/.cargo/bin/rmpc
mpd --kill
```

Install applications:
```
flatpak install flathub
sudo dnf install
sudo dnf remove
flatpak uninstall
flatpak uninstall --unused
```

Update Everything: 
```
sudo dnf upgrade --refresh
flatpak update --assumeyes
sudo fwupdmgr update
```

Fun:
```
cmatrix
```

Navigating terminal:
*(this lists all items in a folder eg ls Pictures/iPhone12Pro)*
```
ls
``` 
*(same but long listing)*
```
ls -l
``` 
*(same but hidden files too)*
```
ls -a
``` 

File manager:
```
mc
```

GPU Monitoring:
```
watch -n 2 nvidia-smi
```

PowerOff:
```
systemctl poweroff
```

## Conclusion
I found Linux to be a fantastic OS, and due to previously daily running it before, I was familiar with the terminal and was able to find my way around Fedora just as I would have any other distro. I have switched back to Windows for now as unfortunately for the game development and 3D designing topics we are required to use proprietary software, but when that is not necessary I personally prefer Linux, and will likely daily run Arch next as I have heard it is a challenge but can be worth it if you have specific needs for optimising your workflow. Fedora had an excellent package manager that I had only one issue with, but ended up finding a workaround anyway. I found most software works as expected, and for running servers it is still fantastic, as with every distro I have tried. I typically prefer to use free and open source software due to its cutomisability and it more often being more designed for a user instead of for making money, so for me Linux is always a good experience. 