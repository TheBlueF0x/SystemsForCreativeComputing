---
title: Terminal & Unix Systems  
subtitle: Systems for Creative Computing – Week 2  
author: Dr. Matt Bellingham – <matt.bellingham@port.ac.uk>  
institute: University of Portsmouth  
date: Thursday 9th October 2025
---

## Workshop Overview

* **Duration**: 2 hours
* **Focus**: Terminal and Unix systems
* **Learning Outcome**: LO1 – Understanding computer architecture and foundational technical vocabulary
* **Tools**: Terminal, Obsidian, GitHub Desktop

## Learning Objectives

* Use basic terminal commands to navigate and manipulate the file system
* Apply pipes and redirection to process file content
* Combine terminal commands into a simple script
* Set up a version-controlled note-taking workflow with Obsidian and Git

## Welcome & Context (10 mins)

* What is the terminal?
* Why is it still relevant in creative computing?
* **From Mainframes to PCs**: The terminal is a direct descendant of how users interacted with large, room-sized mainframe computers.
- **From TUI to GUI**: We'll explore the shift from Text-User Interfaces (the terminal) to the Graphical User Interfaces (GUIs) we use daily, and understand why the TUI remains powerful.
- **Hierarchical Filesystems**: The terminal is the most direct way to interact with the tree-like structure of folders and files that all modern computers use to organise data.

## Setup: GitHub & Obsidian (20 mins) 

* **GitHub Desktop Recap**:
    * Open GitHub Desktop. Ensure you have your module repository cloned locally.
    * **Important**: Click `Fetch origin` to make sure you have the latest updates.
* **Obsidian Setup**:
    * Download Obsidian from https://obsidian.md/, double-click on the .dmg file, and move Obsidian to the Desktop (note - NOT to the Applications folder)
    * On first launch, create a new vault (folder) inside your GitHub module repo. This connects your notes directly to version control.
* **Your First Note**:
    * Inside Obsidian, create a new note. Title it `Week 2 - Terminal Notes.md`.
    * As we go through today's workshop, use this file to document commands, ideas, and reflections.


## Terminal commands

- `Up Arrow`: Will show your last command
- `Down Arrow`: Will show your next command
- `Tab`: Will auto-complete your command
- `Ctrl + L`: Will clear the screen
- `Ctrl + C`: Will cancel a command

**Commands:** `pwd`, `ls`, `cd`, `mkdir`, `touch`, `rm`, `cp`, `mv`


## Basic Navigation & File Management (15 mins)

**Commands:** `pwd`, `ls`, `cd`, `mkdir`, `touch`, `rm`, `cp`, `mv`

**Activity:** Create a folder structure for a fictional project and populate it with dummy files.

How might this help you organise assets in a creative project?

Hint: keep <https://explainshell.com/> open and check for interactive command breakdowns

## Viewing & Editing Files (10 mins)

**Commands:** `cat`, `echo`, `open`

**Activity:** Create a text file and append content to it using `echo >>`

What kinds of logs or notes might you automate using these tools?

## Flags & Manual Pages (10 mins)

**Commands:** `ls -la`, `rm -r`, `cp -r`, `man`

**Activity:** Explore hidden files in your home directory and use `man` to look up an unfamiliar command.

What’s one command you’d like to explore further after reading its manual page?

## Pipes & Redirection (20 mins)

**Concepts:** `|`, `>`, `>>`

**Commands:** `grep`, `wc`

**Activity:** - Count lines in a file using `cat somefile.txt | wc -l`
- Filter for specific file types using `ls | grep .txt`
- Log the output of a command to a file.

How could this help automate repetitive tasks in creative workflows?

## Command Chaining (10 mins)

**Operators:** `&&`, `;`, `||`

```zsh
A; B    # Run A and then B, regardless of success of A
A && B  # Run B if and only if A succeeded
A || B  # Run B if and only if A failed
A &     # Run A in background.
```

**Activity:** Create a folder and move into it only if the creation succeeds (`mkdir new_folder && cd new_folder`)

Why is conditional execution (`&&`) useful?

## Intro to Scripting (5 mins)

* A script is just a series of commands saved in a plain text file.
* It's the first step to automating tasks.
* We will make a script with the `.sh` extension, make it executable with `chmod +x script.sh` , and run it with `./script.sh`.
* We will cover more advanced concepts like **variables, conditionals (if/else), and loops** in future weeks.

## Intro to Scripting (5 mins)
```zsh
#!/bin/zsh

# A simple script to set up a project structure

echo "Creating project folder and files..."

mkdir my_project
cd my_project
touch script.js

echo "Project setup complete."
```

## Mini Challenge (10 mins)

**Task:** Automate a simple folder clean-up and logging task.

**Tiered Goals:** 

- **Bronze:** Manually create a `logs` directory. Use a command to list the contents of your project folder and redirect the output to a `log.txt` file inside `logs`.
- **Silver:** Write a simple `.zsh` script that performs the Bronze task automatically.
- **Gold:** In your script, use the `date` command and redirection to add a timestamp to the bottom of your log file.

## Wrap-Up & Reflection (10 mins)

* How do terminal skills support creative coding, automation, and scripting?
* Make a note in Obsidian after today: “One insight or question from week 2.”
* **Action**: Commit and push your `Week 2 - Terminal Notes.md` file to GitHub using GitHub Desktop.
* **Preview next week**: Scripting with Python; session with Andy Holyer

## Suggested Reading

* Chapter 1 of *Code* by Charles @petzoldCodeHiddenLanguage2022
* <https://explainshell.com/> – interactive command breakdowns