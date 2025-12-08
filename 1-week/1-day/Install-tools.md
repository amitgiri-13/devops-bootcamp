# Install Tools 

## Node.js

NVM allows us to install multiple Node.js versions and switch between them easily.

---
1. Install NVM (Node Version Manager)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

2. Load NVM
```bash
source ~/.nvm.nvm.sh
```

3. List available versions
```bash
nvm ls-remote
```

4. Install the required version
```bash
nvm install <version> 
```

5. List available versions locally
```bash
nvm ls
```

6. Point to required version
```bash
nvm use <version>
```

7. Check node version
```bash
node -v
```

8. npm (node package manager) is also installed with node
```bash
npm -v
```

9. Set default version
```bash
nvm alias default <version> # optional
```
---

## Java

1. Install SDKMAN
```bash
curl -s "https://get.sdkman.io" | bash
```

2. Load SDKMAN
```bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

3. List available versions
```bash 
skd list java
```

4. Install java 
```bash
sdk install java # latest version
sdk install java <version> # install specific version
```

5. Use specific version
```bash
sdk use java <version>
```

6. Check version
```bash
java --version
```

7. Set default version
```bash 
sdk default java <version> # optional
```
---
