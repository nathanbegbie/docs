# Git

Git is great. Use it for everything, as far as possible

## Getting info from the git log

Get all of the committers from git commit authors:

```bash
git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort uniq
```

## Setting up SSH on a machine you don't really trust.

Hey Nathan, remember when you keep on ignoreing the bit about using a passphrase in [this walkthrough](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)?
Well it's a great way of protecting your SSH key! Yes, it doesn't solve things in a seamless way,
you have to enter the passphrase every time you push (and pull on a private repo), but it
means that you can sleep easy at night knowing someone isn't going to steal it.
Use the passphrase on any computer that is not physically something that only you control.

## Bugger Ups

When you have committed a file that you want to remove from that commit (so where `--amend` wouldn't solve your problem).

```bash
git reset --soft HEAD~1
```

This will take what was in the commit and put it back in staging.
This won't work if you're already pushed the commit. Or you could overwrite with `-f`, but that does lead to issues.

## Git Config for Divergetn Branches

I accidentally reinstalled git today and was hit with the following:

```bash
warning: Pulling without specifying how to reconcile divergent branches is
discouraged. You can squelch this message by running one of the following
commands sometime before your next pull:

  git config pull.rebase false  # merge (the default strategy)
  git config pull.rebase true   # rebase
  git config pull.ff only       # fast-forward only

You can replace "git config" with "git config --global" to set a default
preference for all repositories. You can also pass --rebase, --no-rebase,
or --ff-only on the command line to override the configured default per
invocation.

Already up to date.
```

Good to know! I think by default I would prefer a rebase, but at the moment, my work
seems to prefer merge strategies.

## Dealing with Forked repos

[stack overflow link](https://stackoverflow.com/a/7244456/3623641)

```bash
# Add the remote, call it "upstream":

git remote add upstream https://github.com/whoever/whatever.git

# Fetch all the branches of that remote into remote-tracking branches,
# such as upstream/main or upstream/master:

git fetch upstream

# Make sure that you're on your main branch:

git checkout main

# Rewrite your main branch so that any commits of yours that
# aren't already in upstream/main are replayed on top of that
# other branch:

git rebase upstream/main
```
