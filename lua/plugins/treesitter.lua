return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  tag = "v0.10.0",
  config = function()
    require("nvim-treesitter.config").setup({
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
