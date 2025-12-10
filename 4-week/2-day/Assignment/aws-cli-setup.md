# AWS-CLI Setup

1. **Install aws-cli**
```bash
# Installing for Arch linux
sudo pacman -S aws-cli

# Checking version
which aws
aws --version
```
---

2. **AWS Configure**
```bash
# For default profile
aws configure 
# For specific profile
aws configure --profile <profile_name>
# Enter aws_access_key_id
# Enter aws_secret_access_key
# Enter region
# Enter output format
```
---

3. **Setup session token**
```bash
# For default profile
aws fonfigure set aws_session_token "token_here"
# For specific profile
aws configure set aws_session_token "token_here" --profile <profile_name>
```

---

4. **List credentials**
```bash
# For default profile
aws configure list  

# For specific profile
aws configure list --profile <profile_name>
```

---

5. **View config file and credential file**
```bash
# config file
cat ~/.aws/config
# credential file
cat ~/.aws/credentials
```
---

6. **Unset the credentials**
```bash
# For default profile 
aws configure set aws_access_key_id ""
aws configure set aws_secret_access_key ""
aws configure set aws_session_token ""

# For specific profile
aws configure set aws_access_key_id "" --profile <profile_name>
aws configure set aws_secret_access_key "" --profile <profile_name>
aws configure set aws_session_token "" --profile <profile_name>
```
---
