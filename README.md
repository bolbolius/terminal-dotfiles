# terminal-dotfiles

This is my personal terminal setup focused on speed, minimalism, and a cohesive Tokyo Night palette.

<!-- ![Preview](preview.png) -->

### Benchmarks

| Component                     | Metric             |   Before |      Now |
| ----------------------------- | ------------------ | -------: | -------: |
| **Interactive Shell Startup** | `zsh -i -c exit`   |   ~53ms  | **~50ms** |
| **Starship Prompt**           | per prompt, in zsh |  ~8.5ms  |  **~5ms** |
| **Fastfetch**                 | `fastfetch`        |   ~18ms  | **~18ms** |

Prompt time is end to end inside zsh. The previous config ran starship twice per
prompt, once for the prompt and once for the clock in the right prompt.

---

### Components

| Tool          | Config                           | Description                                                                                                               |
| ------------- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **WezTerm**   | `.config/wezterm/wezterm.lua`    | Tokyo Night palette, pill tabs on the retro tab bar, 4-line wheel scrolling, low-power WebGPU                             |
| **Zsh**       | `.zshrc`                         | Zinit, deferred plugin loading, fzf-tab, autosuggestions, syntax highlighting, history search, zoxide, and useful aliases |
| **Starship**  | `.config/starship.toml`          | 2-line prompt, Tokyo Night capsules, Git integration, project toolchains, command status; `starship-full` adds git status |
| **Fastfetch** | `.config/fastfetch/config.jsonc` | Minimal tree-style system info with colored glyphs                                                                        |

---

### Prerequisites

* `wezterm`
* `zsh`
* `starship`
* `fastfetch`
* Any Nerd Font (I recommend Hack Nerd Font, it's my favorite)
* *(Optional)* `eza`, `fzf`, `zoxide`
