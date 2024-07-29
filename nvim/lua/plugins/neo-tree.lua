return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
	keys = {
		{
			"<C-n>",
			function()
				require("neo-tree.command").execute({
					toggle = true,
					source = "filesystem",
					position = "left",
					reveal = true,
				})
			end,
		},
	},
}
