# README

This is a repository for reproducing [this `vim-mucomplete` issue](https://github.com/lifepillar/vim-mucomplete/issues/179). 

Instructions:

1. `$ docker build -t foo .`
2. `$ docker run -it --entrypoint /bin/bash foo`
3. `$ nvim main.go`
4. `:MUcompleteNotify 3`
5. Create a new line at the bottom of the file and type `fu` and stay in insert mode
6. Hit `C-X C-O` to trigger Omnicompletion, which should show `func keyword` from `gopls`
7. Undo the `func` so you're back at just `fu` and now hit `TAB` which should bring up the mucomplete completions. Notice that the current completion method says `c-n` even though it should have tried `omni` first.

