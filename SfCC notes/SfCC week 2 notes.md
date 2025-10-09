Last login: Thu Oct  9 15:02:37 on console

  

The default interactive shell is now zsh.

To update your account to use zsh, please run `chsh -s /bin/zsh`.

For more details, please visit https://support.apple.com/kb/HT208050.

xcci2032e174:~ up2509065$ pwd

/Users/up2509065

xcci2032e174:~ up2509065$ ls

Desktop Downloads Movies Pictures

Documents Library Music Public

xcci2032e174:~ up2509065$ cd D

Desktop/   Documents/ Downloads/ 

xcci2032e174:~ up2509065$ cd D

Desktop/   Documents/ Downloads/ 

xcci2032e174:~ up2509065$ cd Documents/

xcci2032e174:Documents up2509065$ pwd

/Users/up2509065/Documents

xcci2032e174:Documents up2509065$ ls

GitHub

xcci2032e174:Documents up2509065$ cd ..

xcci2032e174:~ up2509065$ cd Documents/

xcci2032e174:Documents up2509065$ cd ~

xcci2032e174:~ up2509065$ cd ~/Desktop/

xcci2032e174:Desktop up2509065$ ls

LocalHomeFolders.jpg Obsidian.app

xcci2032e174:Desktop up2509065$ mkdir test

xcci2032e174:Desktop up2509065$ cd test

xcci2032e174:test up2509065$ touch file1.txt

xcci2032e174:test up2509065$ cp file1.txt file2.txt

xcci2032e174:test up2509065$ rm file2.txt 

xcci2032e174:test up2509065$ cd ..

xcci2032e174:Desktop up2509065$ cd test

xcci2032e174:test up2509065$ touch image.jpg

xcci2032e174:test up2509065$ touch document.docx

xcci2032e174:test up2509065$ touch notes.md

xcci2032e174:test up2509065$ touch book.pdf

xcci2032e174:test up2509065$ touch document2.docx

xcci2032e174:test up2509065$ touch powerpoint.ppx

xcci2032e174:test up2509065$ rm powerpoint.ppx 

xcci2032e174:test up2509065$ touch powerpoint.pptx

xcci2032e174:test up2509065$ touch zip.zip

xcci2032e174:test up2509065$ mkdir test2

xcci2032e174:test up2509065$ ls

book.pdf document2.docx image.jpg powerpoint.pptx zip.zip

document.docx file1.txt notes.md test2

xcci2032e174:test up2509065$ open file1.txt

xcci2032e174:test up2509065$ ls

book.pdf document2.docx image.jpg powerpoint.pptx zip.zip

document.docx file1.txt notes.md test2

xcci2032e174:test up2509065$ cat file1.txt 

This is a test thing

Its true

Yes it it...

  

Ok...xcci2032e174:test up2509065$ echo 'This is a message'

This is a message

xcci2032e174:test up2509065$ man cp

xcci2032e174:test up2509065$ man pwd

xcci2032e174:test up2509065$ pwd -P

/Users/up2509065/Desktop/test

xcci2032e174:test up2509065$ pwd -L

/Users/up2509065/Desktop/test

xcci2032e174:test up2509065$ ls

book.pdf document2.docx image.jpg powerpoint.pptx zip.zip

document.docx file1.txt notes.md test2

xcci2032e174:test up2509065$ ls -L

book.pdf document2.docx image.jpg powerpoint.pptx zip.zip

document.docx file1.txt notes.md test2

xcci2032e174:test up2509065$ ls -L

book.pdf document2.docx image.jpg powerpoint.pptx zip.zip

document.docx file1.txt notes.md test2

xcci2032e174:test up2509065$ ls -l

total 8

-rw-r--r--  1 up2509065  UNI\Domain Users   0  9 Oct 15:56 book.pdf

-rw-r--r--  1 up2509065  UNI\Domain Users   0  9 Oct 15:56 document.docx

-rw-r--r--  1 up2509065  UNI\Domain Users   0  9 Oct 15:56 document2.docx

-rw-r--r--@ 1 up2509065  UNI\Domain Users  49  9 Oct 16:02 file1.txt

-rw-r--r--  1 up2509065  UNI\Domain Users   0  9 Oct 15:56 image.jpg

-rw-r--r--  1 up2509065  UNI\Domain Users   0  9 Oct 15:56 notes.md

-rw-r--r--  1 up2509065  UNI\Domain Users   0  9 Oct 15:57 powerpoint.pptx

drwxr-xr-x  2 up2509065  UNI\Domain Users  64  9 Oct 15:58 test2

-rw-r--r--  1 up2509065  UNI\Domain Users   0  9 Oct 15:58 zip.zip

xcci2032e174:test up2509065$ cd ~

xcci2032e174:~ up2509065$ cd Desktop/test/

xcci2032e174:test up2509065$ ls

book.pdf document2.docx image.jpg powerpoint.pptx zip.zip

document.docx file1.txt notes.md test2

xcci2032e174:test up2509065$ nano file1.txt 

xcci2032e174:test up2509065$ cat file1.txt 

This is a test thing

Its true

Yes it it...

  

Ok...

  

Do you think its not?

  

xcci2032e174:test up2509065$ touch file1.txt 

xcci2032e174:test up2509065$ open file1.txt 

xcci2032e174:test up2509065$ ls

book.pdf document2.docx image.jpg powerpoint.pptx zip.zip

document.docx file1.txt notes.md test2

xcci2032e174:test up2509065$ touch file1.txt 

xcci2032e174:test up2509065$ touch file2.txt

xcci2032e174:test up2509065$ cat file1.txt 

This is a test thing

Its true

Yes it it...

  

Ok...

  

Do you think its not?

  

xcci2032e174:test up2509065$ cat file1.txt | wc

       8      16      74

xcci2032e174:test up2509065$ man wc

xcci2032e174:test up2509065$ date

Thu  9 Oct 2025 16:23:15 BST

xcci2032e174:test up2509065$ date >> file1.txt 

xcci2032e174:test up2509065$ cat file1.txt 

This is a test thing

Its true

Yes it it...

  

Ok...

  

Do you think its not?

  

Thu  9 Oct 2025 16:24:01 BST

xcci2032e174:test up2509065$ open file1.txt 

xcci2032e174:test up2509065$

Command block:

```bash
touch file1.txt
date >> file1.txt
```
