# zellij-dev-layout

my [zellij](https://zellij.dev) dev layout — five tabs, opened the way i want them, with one command:

```sh
zellij -l dev
```

## what you get

| tab | layout |
|---|---|
| `messier` | one big pane left, two stacked right (main workspace) |
| `mara` | two panes side by side |
| `test` | two panes stacked |
| `voice` | single pane |
| `scratch` | single pane |

every tab has the tab bar on top and the status bar at the bottom.

## install

```sh
git clone https://github.com/maramasaeva/zellij-dev-layout.git
cd zellij-dev-layout
./install.sh
```

or manually:

```sh
mkdir -p ~/.config/zellij/layouts
cp layouts/dev.kdl ~/.config/zellij/layouts/
```

then:

```sh
zellij -l dev
```

## make it yours

the fun part is editing `dev.kdl`:

- **rename tabs** — change `tab name="..."`
- **point tabs at your projects** — change the `cwd "~"` values to whatever directories you live in
- **change splits** — `split_direction="vertical"` puts panes side by side, `"horizontal"` stacks them
- **add tabs** — copy any `tab { ... }` block

full layout docs: https://zellij.dev/documentation/layouts

tested with zellij 0.44.0.
