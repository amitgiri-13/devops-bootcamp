# Task 2: Dierctory and File Setup

Scenario You are a DevOps engineer at a XYZ company. The development team works
on a shared project located in /var/www/project . Multiple developers and a
deployment user need different levels of access. You must set up proper users,
groups, and permissions to ensure security and collaboration.

---

1. **Create the project directory:**
```bash
/var/www/project
```

- Command
```bash
sudo makdir -p /var/www/project
```

2. Insid /var/www/project, create:
```bash
    - source/ ( source code - only devteam can read/write )
    - logs/   ( logs - everyone in devteam can append, but not delter other's files )
    - scripts/ ( deployment scripts - only deploy user can execute some scripts )
    - shared/  ( shared assets - all devteam can read/write, new files inherit group)
```

```bash
0  sudo makdir -p /var/www/project/source
   41  clear
   42  sudo mkdir -p /var/www/project/source
   43  sudo chown -R root:devteam /var/www/project/source
   44  sudo chmod -R 2770 /var/www/project/source
   45  sudo mkdir -p /var/www/project/logs
   46  sudo chown -R root:devteam /var/www/project/logs
   47  sudo chmod 2770 /var/www/project/logs
   48  sudo chmod -t /var/www/project/logs
   49  sudo chown -R root:devteam /var/www/project/scripts
   50  sudo mkdir -p /var/www/project/scripts
   51  sudo chown -R deploy:deployers /var/www/scripts
   52  sudo chown -R deploy:deployers /var/www/project/scripts/
   53  sudo chmod -R 700 /var/www/project/scripts/
   54  sudo mkdir -p /var/www/project/shared
   55  sudo chown -R root:devteam /var/www/project/shared/
   56  sudo chmod -R 2775 /var/www/projet/shared
   57  sudo chmod -R 2775 /var/www/project/shared
```

