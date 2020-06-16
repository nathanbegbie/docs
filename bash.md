# Bash/Zsh
It's a weird language. I use zsh in my terminal, along with oh-my-zsh.

## Checking things
If you want to check things on the CLI, you can use the following to check if you should proceed:

is something empty?
```bash
[ -z $(yarn config get version-tag-prefix) ] 
```

to check if it is equal to something
```bash
[ $(yarn config get version-tag-prefix) = 'v' ]
```

to check what the result of the previous command was
```bash
echo $?
```
