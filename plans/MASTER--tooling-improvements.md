## Assistant (Plan · claude-sonnet-4.6 · 42.8s)

Here's a thorough breakdown of improvement suggestions based on your actual config. I've organized by tool and by category (quality-of-life, gaps, cleanup, etc.).

---

## Neovim

### Gaps / Missing Features

**PHP/Drupal workflow:**
- No **phpstan/psalm** integration for static analysis. `conform.nvim` handles formatting, but there's no linter running diagnostics. The kickstart `lint.lua` is disabled — enabling it with `phpstan` would surface type errors inline.
- The `vscode-php-debug` path is **hardcoded** to `~/Repos/vscode-php-debug/out/phpDebug.js`. This will silently break on any machine where that path doesn't exist. A `vim.fn.expand` + existence check with a clear error message would be safer.
- `intelephense` and `phpactor` are **both running simultaneously** on every PHP file. They can conflict (duplicate definitions, double hover). Consider a clear comment explaining why both are kept, or pick one as primary and use the other only for specific capabilities.
- `.module`, `.theme`, `.inc` filetype detection exists in your un-stowed `.vimrc` but **not in your Neovim config**. You're relying on the LSP `filetypes` list but Neovim won't syntax-highlight or indent these files as PHP unless you add an autocommand for it.

**Markdown/Writing:**
- `vim-pencil` and `render-markdown` are both active. No dedicated spell-check autocommand for markdown/obsidian buffers — you have `<leader>sc` to toggle it manually but it won't auto-enable in writing contexts.
- Obsidian config: no configured `completion.nvim_cmp` or `blink.cmp` source for Obsidian wiki-link completion.

**General:**
- No **session management** (e.g., `persistence.nvim` or `auto-session`). Your `mux` script auto-opens nvim, but workspace state (open buffers, splits) isn't persisted across restarts.
- No **git conflict resolution** tooling — you have gitsigns and fugitive, but no `diffview.nvim` or similar for reviewing PRs/conflict resolution visually.
- The `laravel.nvim` plugin is configured with `executable = "ddev"` but you do Drupal work primarily. If you don't actively use Laravel, this is dead weight. If you do use it, there's no Drupal-equivalent (drush commands via a picker).
- `guess-indent.nvim` and `vim-sleuth` are **both installed** — they do the same thing (auto-detect indentation). Pick one.

### Cleanup

- `lua/kickstart/plugins/` — all files are disabled in `init.lua` except `debug.lua`, which is itself superseded by your custom `dap.lua`. This dead code adds confusion.
- The `yY` keybind (yank entire buffer) is a clever but unusual mapping. A comment explaining the intent would help future-you.

---

## ZSH

### Quality of Life

- `SAVEHIST=3000` is quite low for a daily driver — 50,000–100,000 is common. You'll lose history quickly with `SHAREHISTORY` enabled across multiple sessions.
- No **`HISTTIMEFORMAT`** equivalent — you have `EXTENDED_HISTORY` which saves timestamps, but no way to see them. `fc -li` shows them but it's not obvious.
- The `fvim` alias (`fzf | xargs -n 1 nvim`) doesn't handle filenames with spaces. A function using `fzf --print0 | xargs -0` would be more robust.
- `fkill` uses `ps -A` which on Linux gives a very noisy list. `ps aux --sort=-%cpu` or `pgrep`-based approach would be more useful.
- No **`git log` with graph** alias — your `glo` is `--oneline --first-parent` which hides branch topology. A `glog` alias with `--graph --oneline --decorate` would complement it.
- `pbcopy`/`pbpaste` are aliased to `xsel` — but `xclip` or `wl-copy`/`wl-paste` (Wayland) would be more robust depending on your display server. Consider detecting Wayland (`$WAYLAND_DISPLAY`) and using the right tool.

### Missing Features

- No **directory history** beyond zoxide — no `pushd`/`popd` abbreviations or `d` (list recent dirs) like in oh-my-zsh.
- No **`mkcd` function** (make directory and cd into it) — very common utility missing.
- The `open` function checks for `dolphin` but falls back to `nautilus` via alias — but if both are installed, `dolphin` wins regardless. The precedence is slightly tangled (alias set first, then function may override).
- `rvm` is loaded unconditionally if `~/.rvm` exists, which adds ~100-200ms to startup. A lazy-load similar to how you handle other tools would keep startup fast.
- No **completions for `ddev`** — ddev has a `ddev completion zsh` command. Given your Drupal workflow, this would be very useful.

### Consistency

- Most tool integrations use `_has` to guard them, but `rvm` loading skips this check — it only checks `~/.rvm` directory existence, not whether `rvm` is actually functional.

---

## tmux

### Quality of Life

- No **automatic session restoration** after reboot (`tmux-resurrect` / `tmux-continuum`). Your `mux` script creates a fresh session each time — state is lost on reboot or `tmux kill-server`.
- The status bar updates every **1 second** — this is slightly expensive. Unless you need second-level precision on the clock, `status-interval 5` is the common default.
- No **tmux Plugin Manager (tpm)** — all config is manual. This is fine, but adopting tpm would make `tmux-resurrect` and other plugins trivial to add.
- `allow-passthrough on` is set globally for yazi image previews. In tmux ≥3.3 this should be `on` specifically for `yazi` panes only (or scoped), since passthrough is a minor security surface. The `set-option -g` makes it global.
- The `mux` script hardcodes 3 windows (`Neovim`, `Lazygit`, `Shell`) for every project. A more flexible approach would read a per-project `.mux.yml` / `.tmuxinator.yml` file, or at minimum have a way to add extra windows per-project.

### Minor Gaps

- No binding to **move/swap windows** — with `base-index 1` you have windows 1–N, but no easy way to reorder them.
- `prefix + y` for `synchronize-panes` — this conflicts with the copy-mode `y` (yank) binding conceptually, though they're in different modes. Worth a comment.

---

## Cross-Cutting / General

- **No `editorconfig`** in the dotfiles root — given you work across PHP/Drupal (2-space indent) and other codebases, an `.editorconfig` would enforce consistent indentation in editors that respect it.
- **`diff-so-fancy`** is configured in both `.gitconfig` and `lazygit` — but you also have lazygit open inside Neovim via `lazygit.nvim`. The pager is redundant inside Neovim's terminal. This is minor but worth knowing.
- **No `bat` config file** — you set `BAT_THEME=ansi` via env var in `.zshrc`, but a `~/.config/bat/config` would be cleaner and work in non-zsh contexts.
- The `workspace.json` for OpenCode only lists a subset of your nvim config files — it doesn't include the `lua/custom/plugins/` directory, meaning AI assistance in those files will have less context.
