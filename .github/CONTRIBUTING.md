# Contributing to the codebase
We love your input! We want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## We Develop with Github
We use github to host code, to track issues and feature requests, as well as accept pull requests.

## We Use [Github Flow](https://guides.github.com/introduction/flow/index.html), So All Code Changes Happen Through Pull Requests
Pull requests are the best way to propose changes to the codebase (we use [Github Flow](https://guides.github.com/introduction/flow/index.html)). We actively welcome your pull requests:

1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
3. If you've changed APIs, update the documentation.
4. Ensure the test suite passes.
5. Make sure your code lints.
6. Issue that pull request!

## Report bugs using Github's issues
We use GitHub issues to track public bugs. Report a bug by [opening a new issue](); it's that easy!

## Write bug reports with detail, background, and sample code
When raising issues, provide as much details as possible. Try to stick to one of the templates provided in the repository, and answer as many questions as possible.

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can. [This stackoverflow question](http://stackoverflow.com/q/12488905/180626) includes sample code that *anyone* with a base R setup can run to reproduce what I was seeing
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

People *love* thorough bug reports. I'm not even kidding.

## Use a Consistent Coding Style

* Always run your framework linter before committing your code.

# For repository owners
## Branch rules
By default, no branch protection rules are set up. Its your responsibility to protect the main branch and enforce pull requests, and code reviews.

## Update the CODEOWNERS file
Codeowners are automatically added to every pull request, and issues raised. Add your capability team lead name, and avoid adding individuals names.

## Issues and pull requests management
Issues and pull requests will be marked with the `stale` label after 50 days of inactivity. see `.github/workflows/stale.yml`
Marked as stale issues and pull requests, will be locked after 60 days of inactivity. see `.github/workflows/lock.yml`

## Bots installed
### [Auto Assign Issues](https://github.com/andrewlock/auto-assign-issues)
The bot uses the file `.github/auto_assign-issues.yml` for rules related to which assignees to assign the issues to.
By default all issues go to the repo codeowners.



