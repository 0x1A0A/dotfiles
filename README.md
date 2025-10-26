# Dotfile

## How to install

### Using Stow

Configuration is stored as a package like nvim for nvim configuration, tmux for tmux configuration etc.

```sh
├── ghossty
│   └── .config
│       └── ghostty
├── helix
│   └── .config
│       └── helix
├── hyprland
│   └── .config
│       └── hypr
├── linux
│   └── .config
│       ├── alacritty
│       ├── dunst
│       ├── gtk-2.0
│       ├── gtk-3.0
│       ├── kitty
│       ├── rofi
│       │   └── themes
│       ├── waybar
│       └── wofi
├── nvim
│   └── .config
│       └── nvim
│           ├── after
│           │   └── lsp
│           ├── lua
│           │   ├── core
│           │   └── plugins
│           └── plugin
├── tmux
│   └── .config
│       └── tmux
└── zsh
```

> It is recommended to try a dryrun first.

```sh
stow -nv <packge_name>
```

An output should look something like this

```sh
LINK: .config => ../nvim/.config
WARNING: in simulation mode so not modifying filesystem.
```

If the link are correct, then you can run the command without `-n` option.

Sometime you might don't want it to fold an entire folder. This is the case for my `tmux` since it contains a git directory. Installing **tmux package manager** will interfere your git repository. So we can prevent this using `--no-folding` option to link individual files instead.

```sh
stow -v --no-folding <packge_name>
```

### Uninstall

Just add `-D` option it will unlink for you (and you might want to use `-nv` first to make sure you run a correct command).

```sh
stow -Dnv <packge_name>
```

Again, once verified remove `-D` option to actually uninstall.
