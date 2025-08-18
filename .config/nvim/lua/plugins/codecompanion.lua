return {
    {
        "olimorris/codecompanion.nvim",
        cmd = {
            "CodeCompanion",
            "CodeCompanionActions",
            "CodeCompanionChat",
            "CodeCompanionCmd",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            { 'echasnovski/mini.diff', version = '*' },
            "nvim-treesitter/nvim-treesitter",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                ft = { "codecompanion" }
            },
        },
        -- Configuration options for the plugin,
        opts = {
            strategies = {
                chat = {
                    adapter = "openai",
                },
                inline = {
                    adapter = "openai",
                    display = {
                        provider = "float",
                        opts = {
                            border = "rounded",
                            relative = "cursor",
                            width = 80,
                            height = 20,
                        },
                    },
                },
            },

            adapters = {
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {
                        schema = {
                            model = {
                                default = "gpt-4o-mini", -- Default model to use
                            },
                        },
                        env = {
                            api_key = os.getenv("OPENAI_KEY"), -- API key for OpenAI
                        },
                    })
                end,
            },
            display = {
                diff = {
                    enabled = true,
                    close_chat_at = 240,    -- Close an open chat buffer if the total columns of your display are less than...
                    layout = "vertical",    -- vertical|horizontal split for default provider
                    opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
                    provider = "mini_diff", -- Provider for displaying differences
                },
            },
        }
    },
}
