# DevSecOps Tutorial for Beginners, CI Pipeline with GitHub Actions and Docker Scout

## Basic concepts


### DevOps Definition
It includes Any tool or concept to remove bottlenecks, to deliver changes to the end user fast and with minimal bugs.

### DevSecOps Concepts and Tools
- Automated tests for `Application Security`
- Automated tests for `Configuration Security`
- Automated tests for `Cloud Security`

- SAST Tests : Static Application Security Testing
	- Static code analysis (app is not running)
	- Identifies security vulnerabilities in app's source code, configuration files etc.
	- Look for common coding errors, deviations from secure coding practices etc.

- Secret Scanning
	- Scan for any hard-code secrets
	- Tools that scan source code and detect hard-coded secrets
		- API keys
		- Passwords
		- Tokens
		- Private Keys
		- Authentication Files

- Implement Pre-commit Hooks
	- To prevent secrets from ending up in Git repo
	- Catch earliest possible - "Shift security left"


- SCA Tests : Software Composition Analysis.
	- Check third-party and open-source libraries and frameworks (dependencies of our application)
	- 3rd party code can have vulnerabilites, just like our own code
	- SCA tools goes through our dependencies
	- List of vulnerabilites


- DAST Tests: Dynamic Application Security Testing.
	- There are security issues that can only be detected, when application is running.
	- Focuses on idenfitying vulnerabilites in a running application
	- No knowledge of the internal code or design of application
	- DAST tools probe an app from outside, just like a potential attacker would


- Image Scanning: Tools that validate the container image
	- Scan every image layer for known vulnerabilities

---

## Practice


### 

- Each job is executed on a fresh new environment
- Hosted by GitHub or self-hosted option

### Bandit
```bash
# give all levels of issues, bugs
bandit -r .

# Focus on --ii (MEDIUM or hight level of confidence) and -ll (MEDIUM or hight level of issues)
bandit -ll -ii -r .

# generate a report in json format (-f) and create a report file (-o)
bandit -ll -ii -r . -f json -o bandit-report.json


```


### Docker scout
```bash


```



## Resources

- [DevSecOps Tutorial for Beginners | CI Pipeline with GitHub Actions and Docker Scout](https://www.youtube.com/watch?v=gLJdrXPn0ns)
- [GitHub Repository](https://github.com/nanuchi/devsecops-crash-course-pygoat)
- [Original Project](https://owasp.org/www-project-pygoat/)
- [Bandit Settings](https://bandit.readthedocs.io/en/latest/config.html#bandit-settings)
- [Docker Hub Python Buster Image Layers](https://hub.docker.com/layers/library/python/3.11.0b1-buster/images/sha256-55df1167df4e691e8c6fe3e2f9286b22d7d79daa757eaa4862ee7d4eba771094)
- [GitHub Docker Hub scour action](https://github.com/docker/scout-action)












