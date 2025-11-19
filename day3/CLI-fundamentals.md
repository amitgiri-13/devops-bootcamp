# Command-Line Fundamentals 


## Sharing Files

When users create files, those files get their own default user and group, making sharing difficult. The easy fix is to use a shared group and shared directory so all files automatically inherit the right group and permissions.

![alt text](images/suid-sgid-sticky.png)

**There are three additional bits of information that Linux stores for each ﬁle and directory:**

1. **The set user id (SUID):** When a ﬁle is executed by a user, the program runs under
the permissions of the ﬁle owner, not the user who runs it.

```bash
sudo chmod u+s <filename>        # SUID for file
sudo chmod u+s <dir>             # SUID for directory
```

2. **The set group id (SGID):** For a ﬁle, the program runs under the permissions of the
ﬁle group. For a directory, new ﬁles created in the directory use the directory group
as the default group.

```bash
sudo chmod g+s <filename>       # SGID for file
sudo chmod g+s <dir>            # SGID for directory
```

3. **The sticky bit:** The ﬁle remains (sticks) in memory after the process ends. In file or directory with sticky bit on, everyone can write but cannot delete each other's files.

```bash
sudo chmod +t <filename>              # sticky bit on file
sudo chmod +t <dir>                   # sticky bit on directory
```
---