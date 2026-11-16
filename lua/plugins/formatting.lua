return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { cpp = { "clang-format" }, c = { "clang-format" } },
      formatters = {
        ["clang-format"] = {
          -- Long bracket string keeps the style readable and easy to copy into a
          -- .clang-format file. clang-format requires the flow-mapping braces and
          -- a trailing comma after every entry, so keep them when adding options.
          prepend_args = {
            "--style",
            [[{
              BasedOnStyle: Google,
              IndentWidth: 4,
              AccessModifierOffset: -4,
              IndentCaseLabels: false,
            }]],
          },
        },
      },
    },
  },
}
