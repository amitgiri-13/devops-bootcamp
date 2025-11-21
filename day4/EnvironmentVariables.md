# Using Linux Environment Variables

The shell uses a feature called environment variables to store information about the shell session and the working environment.

**View Environment Variables**
```bash
env             # view all environment variables
printenv        # view all environment variables

echo $HOME      # view HOME environment variables
```

--- 

**Local** variables can be used only in shell that created.
```bash
local_variable="hi"     # set local variable
echo $local_variable    # get variable in same shell

bash                    # creating subshell
echo $local_variable    # output is empty

```

**Global** variables are visible from the shell session and from any spawned child subshells.
```bash
GLOBAL_VARIABLE="hello"     # setting variable
export GLOBAL_VARIABLE      # export to make it global

bash                        # createing subshell
echo $GLOBAL_VARIABLE       # should print `hello`
```
---

**unset** Environment Variable
```bash
unset variable_name
```

If we unset global variable in child shell, it is still present in parent. 
```bash
export var=3     # set global variable

bash             # create subshell
unset var        # unset var
exit             # exit subshell

echo $var        # must show the value 
```

---

## Common Environment Variables


| Variable | Definition |
|---------|------------|
| **PATH** | List of directories the shell searches when you run a command. |
| **HOME** | The current user’s home directory. |
| **USER** | Username of the logged-in user. |
| **SHELL** | The default shell for the user (e.g., `/bin/bash`). |
| **PWD** | Current working directory. |
| **OLDPWD** | Previous working directory (used by `cd -`). |
| **EDITOR** | Default command-line editor for programs. |
| **LANG** | System language and locale settings. |
| **TERM** | Terminal type (e.g., `xterm-256color`). |
| **LOGNAME** | Login name of the current user. |
| **TZ** | System or user-set timezone. |
| **HOSTNAME** | Name of the machine on the network. |
| **MAIL** | Location of the user’s mailbox. |
| **SHLVL** | Current shell nesting level. |
| **PATH_MAX** | Maximum length allowed for file paths. |

---

## Setting the PATH Environment Variable

When we enter an external command in the shell command line interface (CLI), the shell must search the system to ﬁ nd the program. The PATH environment variable deﬁnes the directories it searches looking for commands and programs. The directories in the PATH are separated by colons.

```bash 
echo $PATH
```
**Adding a new search directories to the existing PATH**
```bash
PATH=$PATH:/home/amit/Scripts

echo $PATH      # should show newly added path aswell
```
By adding the Scripts directory to the PATH, we can execute our program from anywhere in the virtual directory structure.

**Making it available to both shell and it's subshell**
```bash
export PATH=$PATH:/home/amit/Scripts
```

**Changes to the PATH variable last only until you exit the system or the system reboots. The changes are not persistent. To make it persist we use startup files or environment files.** 

---

## Startup Files or Environment Files

When we start a bash shell by logging in to the Linux system, by default bash checks several files for commands. These files are called startup files or environment files. 

**We can start shell in three ways:**

- As a default login shell at login time
- As a interactive shell that is started by spwaning a subshell
- As a non-interactive shell to run a script

---

### The Login Shell Process

When we log in to Linux system, the shell starts as  a login shell. The login shell looks for five different startup files to process commands from:

```bash
1. /etc/profile             # system-wide
2. $HOME/.bash_profile      # user specific
3. $HOME/.bashrc            # user specific
4. $HOME/.bash_login        # user specific
5. $HOME/.procile           # user specific
```

These files sets environment and environment variables that are active for every shell session that we start. 

---

## Making Environment Variable Persistent

**Setting variables systemwide**
```bash
# Local Variables
echo "var=5" >> /etc/profile        # not best practice
echo "var2=6" >> /etc/profile.d/my_variables.sh  # create .sh file inside /etc/profile.d/ and append variable there

# Global Variables
echo "export var3=8" >> /etc/profile.d/my_variables.sh
```

**Setting variables For Individual User**
```bash
# Local Variables
echo "var4=10" >> $HOME/.bashrc

# Global Variables
echo "export var5=11" >> $HOME/.bashrc
```

---

## Making PATH Variable Persistent

```bash
echo "export PATH=$PATH:/home/amit/Scripts" >> ~/.bashrc   # now PATH persists and is also global.
```
---

## Variables Arrays
An array is a variable that can hold multiple values. Values can be referenced either individually or as a whole for the entire array.

```bash
myarray=(one two three four five)       # setting array

echo $myarray       # prints just first element

echo ${myarray[2]}   # prints third element as array starts from index 0

echo ${myarray[*]}   # prints all elements
```

---
