# Command-Line Fundamentals

## Shell
The interpreter that executes commands typed as strings. 

---

## Terminal
An interface that provides a display for output and a keyboard for input to a shell session.

---

## Terminal Emulator
Software that emulates the function of a terminal. It allows the use of text-based programs within a graphical user interface (GUI).

---

## Prompt
The visual cue that indicates an interactive shell is waiting for the user to type a command.

### Privileged Prompt: Root Shell Prompt

Used for root and has the **#** symbol.  

```bash
root@host:#
```

### Unprivileged Prompt: User Shell Prompt
Used for users and has the **$** symbol.

```bash
user@host:$
```

---

## General Command Structure

```bash
command [options..] [arguments..]
```

### Command

Command is the name of a program to run. It is an executable, generally searched in **$PATH** environment variable. 

### Option
 
Option is the part of the command line that adjusts the behavior of a
command.

### Argument

Argument Specifies the target file, directory, or value that the command acts on.

---

## Switch Users

1. Switch to root user
```bash 
su -
``` 

2. Switch to user
```bash
su <user_name>
```

---

## What is sudo ?

sudo is used to gain privilage to run certain commands. The user must be present in  *sudo* or *wheel* group. 

``` bash
user@host:$ sudo command
```
---

## Navigation

1. Print Present Working Directory
```bash 
pwd
```

2. List Contents of Present Working Directory
```bash
ls          # normal
ls -l       # long listnig format
ls -a       # list hidden files as well
ls -la      # long listing and hidden files 
``` 

2. Create New Directory
```bash
mkdir <dir1>            # create empty directory 
mkdir -p <dir1>/<dir2>  # create nested directory, doesn't throw error if directory exists
```

3. Delete Directory
```bash
rmdir <dir>             # remove empty directory
rm -r <dir>             # remove non empty directory recursively
rm -rfv <dir>            # -f: force delete,  -v: verbose output
```

4. Change Present Working Directory

*Absolute Path* always starts form /.

*Relative Path* starts from current working directory.
- .  -> Represents current directory
- .. -> Represents parent directory

```bash
cd /absolute/path/to/dir    # visit  given directory from anywhere
cd ..                       # vist  parent directory of current directory
cd ./dir                    # visit dir directory within current working directory
cd -                        # visit last visited directory 
```
---

## File Management

1. Create New File
```bash
touch <file_name>       # if file already exists it updates the timestamp
```


2. Copy File/Directory
```bash
cp <source> <destination>   # copies file or directory to destination
cp -r <source-dir> <destination-dir> # copies directory recursively
```
3. Move/Rename File
```bash
mv <source> <destination>   # moves or renames file/directory
```

4. Remove File/Directory
```bash
rm <file_name>              # deletes a file
rm -r <directory_name>      # deletes a directory recursively
```

5. View File Content
```bash
cat <file_name>             # displays entire content of a file
```

6. View Start of File
```bash
head <file_name>            # shows first 10 lines of a file by default
head -n <lines> <file_name> # shows first <lines> lines
```

7. View End of File
```bash
tail <file_name>            # shows last 10 lines of a file by default
tail -n <lines> <file_name> # shows last <lines> lines
```

8. Find Files
```bash
find <path> -name <pattern> # searches for files matching pattern under path
```

9. Locate Files (faster search using database)
```bash
locate <file_name>          # finds file paths using prebuilt database
```

10. Search Text in Files
```bash
grep <pattern> <file_name>  # searches for pattern in the file
grep -r <pattern> <dir>     # searches recursively in a directory
```

11. Compare Files
```bash
diff <file1> <file2>        # shows line-by-line differences between two files
```

12. File Archival and Extraction
```bash
tar -cvf archive_name.tar <files_or_directories>  
# -c: create archive, -v: verbose, -f: specify archive file name

tar -xvf archive_name.tar  
# -x: extract archive, -v: verbose, -f: specify archive file name

tar -xvf archibe_name.tar -C <directory> 
# extract in given directory

tar -czvf archive_name.tar.gz <files_or_directories>  
# -z: compress with gzip

tar -xzvf archive_name.tar.gz  
# -x: extract, -z: decompress gzip, -v: verbose, -f: file
``` 

---

