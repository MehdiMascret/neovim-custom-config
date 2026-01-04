return {
  "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function ()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.cmd("Neotree toggle focus")
      end,
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.winnr("$") >= 2 then
          vim.cmd("2wincmd w")
        end
      end,
    })
  end
}
