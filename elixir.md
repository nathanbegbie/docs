# Elixir

## Livebook with asdf

We want to install livebook as a part of the elixir installtion that runs on our machine.
Because we use asdf, we need to reference the correct version of elixir.
Livebook only works with 1.13 and up.
We call a specific script to kick off the livebook server.
We want to manage this in the background with screen, and reference the correct version of elixir.

To find out where elixir is, we use `asdf where elixir`
which gives us the path that the asdf version of elxir.

```shell
screen -S livebook $(asdf where elixir)/.mix/escripts/livebook server
```

open the link that appears, as you need the token in the path,
then hit ctrl+a, ctrl+d to detach.
