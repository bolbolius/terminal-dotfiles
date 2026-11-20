# terminal-dotfiles

This is my personal terminal setup focused on speed, minimalism, and a cohesive Tokyo Night palette.

<!-- ![Preview](preview.png) -->

### Benchmarks

| Component                     | Metric             |    Timing |
| ----------------------------- | ------------------ | --------: |
| **Interactive Shell Startup** | `zsh -i -c exit`   | **~53ms** |
| **Starship Prompt**           | `starship timings` |  **~4ms** |
| **Fastfetch**                 | `fastfetch`        | **~18ms** |

---

### Components

| Tool          | Config                           | Description                                                                                                               |
| ------------- | -------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **WezTerm**   | `.config/wezterm/wezterm.lua`    | Tokyo Night palette, pill tabs on the retro tab bar, 4-line wheel scrolling, low-power WebGPU                             |
| **Zsh**       | `.zshrc`                         | Zinit, deferred plugin loading, fzf-tab, autosuggestions, syntax highlighting, history search, zoxide, and useful aliases |
| **Starship**  | `.config/starship.toml`          | 2-line prompt, Tokyo Night capsules, Git integration, and command status                                                  |
| **Fastfetch** | `.config/fastfetch/config.jsonc` | Minimal tree-style system info with colored glyphs                                                                        |

---

### Prerequisites

* `wezterm`
* `zsh`
* `starship`
* `fastfetch`
* Any Nerd Font (I recommend Hack Nerd Font, it's my favorite)
* *(Optional)* `eza`, `fzf`, `zoxide`
