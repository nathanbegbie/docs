# Git
Git is great. Use it for everything, as far as possible

## Getting info from the git log

Get all of the committers from git commit authors:

``` bash
git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort uniq
```

## Setting up SSH on a machine you don't really trust.
Hey Nathan, remember when you keep on ignoreing the bit about using a passphrase in [this walkthrough](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)?
Well it's a great way of protecting your SSH key! Yes, it doesn't solve things in a seamless way,
you have to enter the passphrase every time you push (and pull on a private repo), but it
means that you can sleep easy at night knowing someone isn't going to steal it.
Use the passphrase on any computer that is not physically something that only you control.
