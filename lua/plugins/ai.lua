return {
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = "v0.1.2", -- Never set this value to "*"! Never!
    ---@module 'avante'
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      -- for example
      provider = "sakura",
      providers = {
        ---@type AvanteProvider
        sakura = {
          __inherited_from = "openai",
          endpoint = "https://api.ai.sakura.ad.jp/v1",
          api_key_name = "SAKURA_AI_ACCOUNT_TOKEN", -- The name of the environment variable that contains the API key
          model = "preview/Kimi-K2.6",
          timeout = 30000, -- Timeout in milliseconds
        },
        sakura_dev = {
          __inherited_from = "openai",
          endpoint = "https://gateway.aipf-dev.sakuraha.jp/v1",
          api_key_name = "SAKURA_AI_ACCOUNT_TOKEN_DEV", -- The name of the environment variable that contains the API key
          model = "preview/Kimi-K2.7-Code",
          timeout = 30000, -- Timeout in milliseconds
        },
      },
      disabled_tools = { "web_search" },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        enable_token_counting = true, -- Whether to enable token counting. Default to true.
        auto_add_current_file = true, -- Whether to automatically add the current file when opening a new chat. Default to true.
        auto_approve_tool_permissions = {
          "rag_search",
          -- "python",
          "git_diff",
          -- "git_commit",
          "glob",
          "search_keyword",
          "read_file_toplevel_symbols",
          "read_file",
          "create_file",
          -- "move_path",
          "copy_path",
          -- "delete_path",
          "create_dir",
          -- "bash",
          -- "web_search",
          "fetch",
        }, -- Auto-approve specific tools only
        ---@type "popup" | "inline_buttons"
        confirmation_ui_style = "inline_buttons",
        --- Whether to automatically open files and navigate to lines when ACP agent makes edits
        ---@type boolean
        acp_follow_agent_locations = true,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
      {
        "iamcco/markdown-preview.nvim",
        opts = function()
          local ft = vim.g.mkdp_filetypes
          table.insert(ft, "Avante")
          vim.g.mkdp_filetypes = ft
        end,
        keys = {
          {
            "<leader>cp",
            ft = "Avante",
            "<cmd>MarkdownPreviewToggle<cr>",
            desc = "Markdown Preview",
          },
        },
      },
    },
  },
  {
    "ravitemer/mcphub.nvim",
    event = "VeryLazy",
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    opts = {
      auto_approve = function(params)
        if params.server_name == "web-search" then
          return true
        end

        -- default
        return false
      end,
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "yetone/avante.nvim",
        opts = {
          -- system_prompt as function ensures LLM always has latest MCP server state
          -- This is evaluated for every message, even in existing chats
          system_prompt = function()
            local hub = require("mcphub").get_hub_instance()
            return hub and hub:get_active_servers_prompt() or ""
          end,
          -- Using function prevents requiring mcphub before it's loaded
          custom_tools = function()
            return {
              require("mcphub.extensions.avante").mcp_tool(),
            }
          end,
        },
      },
    },
  },
}
