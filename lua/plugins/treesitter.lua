return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  tag = "v0.10.0",
  config = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then
      ok, ts = pcall(require, "nvim-treesitter.config")
    end

    if not ok then
      vim.api.nvim_echo({ { "nvim-treesitter: module introuvable", "ErrorMsg" } }, false, {})
      return
    end

    ts.setup({
      ensure_installed = { 
        "lua", 
        "javascript", "html", "css", 
        "java" 
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
