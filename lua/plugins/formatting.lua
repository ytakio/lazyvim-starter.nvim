return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { cpp = { "clang-format" }, c = { "clang-format" } },
      formatters = {
        ["clang-format"] = {
          -- Single source of truth: the .clang-format file at the root of this
          -- config. Referencing it by absolute path applies the style to every
          -- project, and the very same file can be copied into any project (or
          -- used by clangd/CI) to reuse the exact same settings.
          prepend_args = {
            "--style",
            "file:" .. vim.fn.stdpath("config") .. "/_clang-format",
          },
        },
      },
    },
  },
}
