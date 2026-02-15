-- ~/.config/nvim/lua
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    {
        "rebelot/kanagawa.nvim", 
        config = function()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = ""},
                    section_separators = { left = "", right = ""},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16, -- ~60fps
                        events = {
                            "WinEnter",
                            "BufEnter",
                            "BufWritePost",
                            "SessionLoadPost",
                            "FileChangedShellPost",
                            "VimResized",
                            "Filetype",
                            "CursorMoved",
                            "CursorMovedI",
                            "ModeChanged",
                        },
                    }
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "diff", "diagnostics"},
                    lualine_c = {"filename"},
                    lualine_x = {"encoding", "fileformat", "filetype"},
                    lualine_y = {"progress"},
                    lualine_z = {"location"}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {"filename"},
                    lualine_x = {"location"},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        config = function()
            require("nvim-treesitter.configs").setup ({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "bash" },

                sync_install = false,

                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,

                        lookahead = true,

                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                        },
                        selection_modes = {
                            ["@parameter.outer"] = "v", -- charwise
                            ["@function.outer"] = "v", -- linewise
                            ["@class.outer"] = "<c-v>", -- blockwise
                        },
                        include_surrounding_whitespace = true,
                    },
                },           
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Setup LSP configurations
            vim.lsp.config("clangd", {
                filetypes = { "c", "cpp" },
                cmd = { "clangd" },
                root_markers = { ".git" }
            })

            vim.lsp.config("lua_ls", {
                filetypes = { "lua" },
                cmd = { "lua-language-server" },
                root_markers = { ".git" },
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })

            vim.lsp.config("pylsp", {
                filetypes = { "python" },
                cmd = { "pylsp" },
                root_markers = { ".git", "pyproject.toml", "setup.py", "requirements.txt" },
                settings = {
                    pylsp = {
                        plugins = {
                            -- Disable some default plugins
                            pycodestyle = { enabled = false },
                            mccabe = { enabled = false },
                            pyflakes = { enabled = true },  -- Catches calling non-callables
                            pylint = { enabled = false },  -- Can enable if you have pylint installed

                            -- If you have these installed, enable them:
                            -- ruff = { enabled = true },
                            -- black = { enabled = true },
                        }
                    }
                }
            })

            -- Enable it

            -- Enable the servers
            vim.lsp.enable("clangd")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("pylsp")

            -- Setup keymaps on LSP attach
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local bufnr = args.buf
                    local opts = { buffer = bufnr, noremap = true, silent = true }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                end,
            })

            -- Diagnostic configuration
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "󰝤",
                    spacing = 2,
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                    },
                },
                underline = true,
            })
        end,
    },

    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },

        -- use a release tag to download pre-built binaries
        version = "1.*",

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",

                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<M-y>"] = { "accept", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono"
            },

            completion = { documentation = { auto_show = false } },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {},
    }
})
