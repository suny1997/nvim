return {
  {
    -- Install markdown preview, use npx if available.
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
      if vim.fn.executable("npx") then
        vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
      else
        vim.cmd([[Lazy load markdown-preview.nvim]])
        vim.fn["mkdp#util#install"]()
      end
    end,
    init = function()
      if vim.fn.executable("npx") then
        vim.g.mkdp_filetypes = { "markdown" }
      end
    end,
    config = function()
      -- 设置键位
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.api.nvim_buf_set_keymap(0, "n", "<leader>mw", ":MarkdownPreview<CR>", { noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<leader>ms",
            ":MarkdownPreviewStop<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<leader>mt",
            ":MarkdownPreviewToggle<CR>",
            { noremap = true, silent = true }
          )
        end,
      })
    end,
  },
}
