# Task 4: umask and Default Permissions

1. **Configure UMASK = 002 for devteam**

- Command 

```bash
# For system-wide effect 
sudo vim /etc/profile
# i for insert mode

# append in the file
`if groups $USER | grep -q "\bdevteam\b"; then
    umask 002
fi`

# Esc for command mode
# :wq to write and quit
```

- Output

![alt text](images/task4.png)

![alt text](images/task4b.png)

---