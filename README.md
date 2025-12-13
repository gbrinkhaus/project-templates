
# Project Templates: Modular AI Agent Setup

## Usage Instructions

**To start a new project from this template:**

1. **Create a new project folder** (e.g., `my-new-app`).
2. **Copy** (do not clone) the template files into your new folder:
	```sh
	cp -r ../project-templates/* ../project-templates/.[!.]* .
	```
	Or download as ZIP from GitHub and extract.
3. **Run the setup script** in your new project folder:
	- For a general project:
	  ```sh
	  ./setup.sh
	  ```
	- For a Flask project:
	  ```sh
	  ./setup.sh --flask
	  ```
4. **The script will automatically remove the .git folder** (disconnecting from the template repo).
5. **Initialize a new git repo** for your project:
	```sh
	git init
	git add .
	git commit -m "Initial commit from template"
	```

**Do not clone the template repo into your new project folder.**

---
Sharing my standard dev setup with 4 +1 agents.
