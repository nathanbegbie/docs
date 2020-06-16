# Code Editor SetUp

## Key Bindings
In order to use the built-in terminal, you want to make it easier to switch between the 2
easily and with a configuration that does not break your hand or flow when doing it.
[This solution](https://superuser.com/a/1343695) on Stack Overflow was helpful in
explaining how to set it up.

Put the following in your Keyboard preferences:
```json
{
  "key": "ctrl+j",
  "command": "workbench.action.focusActiveEditorGroup",
  "when": "!terminalFocus"
},
{
  "key": "ctrl+k",
  "command": "workbench.action.terminal.focus",
  "when": "terminalFocus"
}
```

Now I can easily switch between writing and running code with `ctrl + k` and `ctrl + j`.

## Some of the things that I do
I've recently nuked my vs-code install, so start afresh, which has been interesting, because it's highlighted what I use a lot in my setup:

`editor.action.addSelectionToNextFindMatch` -> ⌘ + D
which is where we select the word that the cursor is in and then progressively find other instances of it in the document.
It also creates multiple cursors which you can edit with.

`workbench.action.toggleSidebarVisibility` -> ⌘ + B
This toggles (hides and shows) the sidebar


## Snippets
They are amazing.
Check out how you can supercharge them [here](https://blog.logrocket.com/custom-polymorphic-code-snippets-in-vs-code-e76d8cad656b/).