# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration written primarily in **Fennel** (a Lisp that compiles to Lua). Fennel source lives in `fnl/` and is compiled at runtime by [rig.nvim](https://github.com/codebeige/rig.nvim), which inserts custom searchers into Lua's `package.loaders` so that `require()` transparently finds, compiles, and caches Fennel modules. There is no build step — edit `.fnl` files directly.

## Architecture

**Entry point**: `init.lua` (pure Lua) handles bootstrap:
1. Loads `rig.nvim` (prefers dev copy at `~/src/rig.nvim`, falls back to GitHub clone)
2. Calls `rig.setup()` — registers Fennel searchers into Lua's module system
3. Runs `config.base.setup()` — core Neovim options before plugins load
4. Calls `rig.exrc()` — loads project-local `.nvim.fnl` files (secured via `vim.secure.read`)
5. Calls `require('plugins').setup()` — installs/loads plugins via `vim.pack`, runs init and config callbacks
6. On success, runs `config.setup()` — highlights, diagnostics, terminal, language configs, LSP

**Module layout**:
- `fnl/plugins/init.fnl` — plugin setup orchestrator: registers `PackChanged` hooks, calls init functions, runs `vim.pack.add` for all plugins, then calls config functions
- `fnl/plugins/<name>.fnl` — per-plugin configuration modules (export `init` and/or `config` functions)
- `fnl/config/base.fnl` — Neovim options (set before plugins)
- `fnl/config/init.fnl` — post-plugin setup orchestrator
- `fnl/config/<lang>.fnl` — language-specific settings (clojure, fennel)
- `fnl/lsp/init.fnl` — LSP orchestrator; each server in `fnl/lsp/<name>.fnl` exports `{name, config}` and is enabled via `vim.lsp.enable` (native 0.12+ LSP config)
- `fnl/lsp/shared.fnl` — shared LspAttach autocmd and keybindings
- `fnl/lib/` — utility modules (highlight helpers, lualine components, LSP utils)

**Plugin management**: Uses Neovim 0.12's built-in `vim.pack` package manager. Lockfile is `nvim-pack-lock.json` (auto-managed). Personal plugins (`codebeige` org) prefer dev copies from `~/src/` with GitHub fallback.

**Key conventions**:
- Leader: `<Space>`, Local leader: `,`
- Keybindings organized through which-key.nvim
- LSP servers only enabled if their binary is on `$PATH` (`vim.fn.executable` check)
