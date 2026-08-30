# zellij-dev-layout

my [zellij](https://zellij.dev) dev layout — five tabs, opened the way i want them, with one command:

```sh
zellij -l dev
```

new to zellij? it's a terminal multiplexer (like tmux): one terminal window, split into tabs and panes that keep running even if you close the window. this repo gives you a ready-made starting layout.

## what you get

| tab | layout |
|---|---|
| `messier` | one big pane left, two stacked right (main workspace) |
| `mara` | two panes side by side |
| `test` | two panes stacked |
| `voice` | single pane |
| `scratch` | single pane |

every tab has the tab bar on top and the status bar at the bottom. (yes, the tab names are mine — renaming them is step one of making it yours, see below.)

## 1. install zellij (if you don't have it)

```sh
# macOS / Linux with Homebrew
brew install zellij

# with cargo (any platform with Rust)
cargo install --locked zellij

# Arch
pacman -S zellij
```

more options (binaries, other package managers): https://zellij.dev/documentation/installation

check it worked:

```sh
zellij --version
```

## 2. install this layout

```sh
git clone https://github.com/maramasaeva/zellij-dev-layout.git
cd zellij-dev-layout
./install.sh
```

that just copies `layouts/dev.kdl` to `~/.config/zellij/layouts/` — the folder where zellij looks for layouts by name. no homebrew/git? do it by hand:

```sh
mkdir -p ~/.config/zellij/layouts
cp layouts/dev.kdl ~/.config/zellij/layouts/
```

## 3. run it

```sh
zellij -l dev
```

useful once you're inside: `Ctrl t` then arrows to switch tabs, `Ctrl p` for pane commands, `Ctrl q` to quit. the status bar at the bottom shows all the keybindings, so you don't need to memorize anything.

## 4. make it yours

### rename the tabs

easiest way — the helper script (renames it in the repo copy *and* your installed copy):

```sh
./rename-tab.sh messier main
./rename-tab.sh mara notes
```

run it with no arguments to list the current tab names.

or just open `layouts/dev.kdl` in any editor — each tab starts with a line like:

```kdl
tab name="messier" focus=true {
```

change the text between the quotes, re-run `./install.sh` (or copy the file over again), done. changes show up next time you start `zellij -l dev`.

### point tabs at your projects

every pane has a `cwd "~"` (the directory it opens in). change it to wherever you actually work:

```kdl
pane {
    cwd "~/code/my-project"
}
```

### change the splits, add tabs

- `split_direction="vertical"` puts panes side by side, `"horizontal"` stacks them
- add a tab by copying any `tab { ... }` block and giving it a new name
- `focus=true` on a tab makes it the one you land on

full layout docs: https://zellij.dev/documentation/layouts

tested with zellij 0.44.0 on macOS.
