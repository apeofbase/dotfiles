## Plan: Replace zinit with package managers

**Summary of what zinit is currently doing (5 things):**

| zinit responsibility | Replacement |
|---|---|
| Bootstrap itself (git clone) | Removed entirely |
| `zinit-annex-binary-symlink` | Not needed (no more zinit) |
| `fzf-tab` | Manual `git clone` to `~/.local/share/zsh/plugins/fzf-tab` |
| `zsh-autosuggestions` | `pacman` (Arch) / `brew` (macOS) |
| `zsh-completions` | `pacman` (Arch) / `brew` (macOS) — fpath-only, no source |
| `fast-syntax-highlighting` | `yay` AUR (Arch) / `brew` (macOS) |
| `zinit cdreplay -q` | Removed — not needed without zinit |

---

### Step 1 — Update `scripts/apps-arch-install.sh`

Uncomment the three commented-out packages already in the file, and add `yay` packages for the AUR ones:

```bash
# In the pacman array, uncomment:
"zsh-completions"
"zsh-autosuggestions"

# Add a separate yay block after the pacman block:
aur_apps=(
  "zsh-fast-syntax-highlighting"
  "fzf-tab-git"   # OR omit this since fzf-tab will be a manual clone
)
yay -S --noconfirm "${aur_apps[@]}"
```

> Since you chose **manual clone** for `fzf-tab`, only `zsh-fast-syntax-highlighting` goes in the AUR block.

---

### Step 2 — Create `Brewfile`

New file at `./Brewfile` covering all packages (including the zsh plugins and the existing tools from the Arch script, so macOS has a single install command: `brew bundle`):

```ruby
# ZSH plugins
brew "zsh-autosuggestions"
brew "zsh-completions"
brew "zsh-fast-syntax-highlighting"
brew "fzf-tab"

# Core tools (mirrors apps-arch-install.sh)
brew "bat"
brew "bob"
brew "diff-so-fancy"
brew "eza"
brew "fastfetch"
brew "fd"
brew "fzf"
brew "git"
brew "gh"
brew "glab"
brew "glow"
brew "lazygit"
brew "ripgrep"
brew "stow"
brew "trash-cli"
brew "tmux"
brew "yazi"
brew "zoxide"
```

---

### Step 3 — Add `fzf-tab` bootstrap to `.zshrc`

A small self-bootstrapping snippet (mirrors the old zinit auto-clone pattern), placed near the top of the zinit configs section:

```zsh
# fzf-tab: managed manually (no package manager version available without AUR)
_FZF_TAB_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins/fzf-tab"
if [[ ! -d "$_FZF_TAB_DIR" ]]; then
  git clone https://github.com/Aloxaf/fzf-tab "$_FZF_TAB_DIR"
fi
```

---

### Step 4 — Rewrite the zinit section of `.zshrc`

**Remove:**
- The entire zinit bootstrap block (lines 9–18)
- The `# zinit configs` block (lines 195–204)
- `zinit cdreplay -q` (line 327)

**Replace with** a clean `# ZSH Plugins` section sourcing each plugin directly, with OS-aware paths:

```zsh
# -------
# ZSH Plugins
# -------

# fzf-tab: replaces zsh's completion menu with fzf
# Must be loaded AFTER compinit but BEFORE zsh-autosuggestions
_FZF_TAB_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins/fzf-tab"
if [[ -f "$_FZF_TAB_DIR/fzf-tab.zsh" ]]; then
  source "$_FZF_TAB_DIR/fzf-tab.zsh"
fi

# zsh-autosuggestions
if [[ $(uname) == "Darwin" ]]; then
  _AUTOSUGG="$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
  _AUTOSUGG="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
[[ -f "$_AUTOSUGG" ]] && source "$_AUTOSUGG"

# zsh-completions: fpath addition only (no source needed on Arch; brew needs fpath)
if [[ $(uname) == "Darwin" ]] && [[ -d "$HOMEBREW_PREFIX/share/zsh-completions" ]]; then
  fpath=("$HOMEBREW_PREFIX/share/zsh-completions" $fpath)
fi
# On Arch, zsh-completions installs to /usr/share/zsh/site-functions which is already in $fpath

# fast-syntax-highlighting: MUST be sourced last among plugins
if [[ $(uname) == "Darwin" ]]; then
  _FSH="$HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
else
  _FSH="/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fi
[[ -f "$_FSH" ]] && source "$_FSH"
```

> **Load order matters:** `fzf-tab` → `zsh-autosuggestions` → `zsh-completions` (fpath) → `compinit` → `fast-syntax-highlighting` (last). The existing `.zshrc` runs `compinit` near the bottom — the plugin sources need to be placed relative to that.

---

### Step 5 — Remove zinit data directory (manual cleanup)

After the `.zshrc` changes are working:

```zsh
rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/zinit"
```

And remove the `zsh_cache_clear` references to zinit if any exist there (check `bin/zsh_cache_clear`).

---

### File change summary

| File | Change |
|---|---|
| `.zshrc` | Remove zinit bootstrap + plugin block + cdreplay; add `# ZSH Plugins` section |
| `scripts/apps-arch-install.sh` | Uncomment `zsh-completions`, `zsh-autosuggestions`; add yay block for `zsh-fast-syntax-highlighting` |
| `Brewfile` | New file — all tools + zsh plugins for macOS |
| `plans/replace-zinit.md` | This plan document |

