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
  {
    "TobinPalmer/pastify.nvim",
    cmd = { "Pastify", "PastifyAfter" },
    event = { "BufReadPost" }, -- Load after the buffer is read, I like to be able to paste right away
    keys = {
      { noremap = true, mode = "x", "<leader>p", "<cmd>PastifyAfter<CR>" },
      { noremap = true, mode = "n", "<leader>p", "<cmd>PastifyAfter<CR>" },
      { noremap = true, mode = "n", "<leader>P", "<cmd>Pastify<CR>" },
    },
    config = function()
      require("pastify").setup({
        opts = {
          absolute_path = false, -- use absolute or relative path to the working directory
          apikey = "", -- Api key, required for online saving
          local_path = function()
            return "/assets/imgs/" .. os.date("%Y%m%d") .. "/"
          end, -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
          save = "local", -- Either 'local' or 'online' or 'local_file'
          filename = function()
            return vim.fn.expand("%:t:r") .. "_" .. os.date("%Y-%m-%d_%H-%M-%S")
          end,
          default_ft = "markdown", -- Default filetype to use
        },
        ft = { -- Custom snippets for different filetypes, will replace $IMG$ with the image url
          html = '<img src="$IMG$" alt="">',
          markdown = "![]($IMG$)",
          tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
          css = 'background-image: url("$IMG$");',
          js = 'const img = new Image(); img.src = "$IMG$";',
          xml = '<image src="$IMG$" />',
          php = '<?php echo "<img src="$IMG$" alt="">"; ?>',
          python = "# $IMG$",
          java = "// $IMG$",
          c = "// $IMG$",
          cpp = "// $IMG$",
          swift = "// $IMG$",
          kotlin = "// $IMG$",
          go = "// $IMG$",
          typescript = "// $IMG$",
          ruby = "# $IMG$",
          vhdl = "-- $IMG$",
          verilog = "// $IMG$",
          systemverilog = "// $IMG$",
          lua = "-- $IMG$",
        },
      })
    end,
  },
}
