# Code Editor SetUp

## Key Bindings

In order to use the built-in terminal, you want to make it easier to switch between the 2
easily and with a configuration that does not break your hand or flow when doing it.
[This solution](https://superuser.com/a/1343695) on Stack Overflow was helpful in
explaining how to set it up.

Put the following in your Keyboard preferences:

```json
{
    "key": "ctrl+`",
    "command": "workbench.action.focusActiveEditorGroup",
    "when": "terminalFocus"
},
{
"key": "ctrl+`",
"command": "workbench.action.terminal.focus",
"when": "!terminalFocus"
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

They are amazing.
Check out how you can supercharge them [here](https://blog.logrocket.com/custom-polymorphic-code-snippets-in-vs-code-e76d8cad656b/).

## Running Selected Code

One of the things that is really nice about RStudio, is the ability to be working
in a script or RMarkdown document and the ability to run code where your cursor is
instead of having to copy/paste in to the command line.

[This stack overlflow answer](https://stackoverflow.com/a/54439971/3623641) explains
how to do it, but it's a matter of updating the `workbench.action.terminal.runSelectedText`.

## [Enable Emmet for JSX](https://medium.com/@eshwaren/enable-emmet-support-for-jsx-in-visual-studio-code-react-f1f5dfe8809c)

Quick and easy - click the link ^

## Python Specific Settings

If you're using isort and black for your project, you can auto-format both onSave
with the following in your Workspace settings folder.

```json
{
    "python.formatting.provider": "black",
    "editor.codeActionsOnSave": { "source.organizeImports": true }
}
```
