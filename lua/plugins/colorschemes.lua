return {
  {
    "rebelot/kanagawa.nvim",
	  config = function()
		  require("kanagawa").setup({
			  theme = "wave",
			  commentStyle = { italic = false },
		  })
		  vim.cmd("colorscheme kanagawa")
	  end

  },
}
