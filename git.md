# Git
Git is great. Use it for everything, as far as possible

## Getting info from the git log

Get all of the committers from git commit authors:

``` bash
git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort uniq
```
