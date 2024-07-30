return {
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		config = function()
			local rmd = require("render-markdown")
			rmd.setup({
				heading = {
					icons = { "◈ ", "◇ ", "◆ ", "⋄ ", "❖ ", "⟡ " },
				},
				bullet = {
					icons = { "•" },
				},
			})
		end,
	},
	{
		"jakewvincent/mkdnflow.nvim",
		config = function()
			require("mkdnflow").setup({
				new_file_template = {
					use_template = true,
					placeholders = {
						before = {
							date = function()
								return os.date("%B %d, %Y")
							end,
							name = function()
								return os.getenv("USER")
							end,
						},
						after = {
							filename = function()
								return vim.api.nvim_buf_get_name(0)
							end,
						},
					},
					template = [[
---
title: {{ title }}
author: {{ name }}
date: {{ date }}
---
          ]],
				},
				foldtext = {
					title_transformer = function()
						local function my_title_transformer(text)
							local updated_title = text:gsub("%b{}", "")
							updated_title = updated_title:gsub("^%s*", "")
							updated_title = updated_title:gsub("%s*$", "")
							updated_title = updated_title:gsub("^######", "░░░░░▓")
							updated_title = updated_title:gsub("^#####", "░░░░▓▓")
							updated_title = updated_title:gsub("^####", "░░░▓▓▓")
							updated_title = updated_title:gsub("^###", "░░▓▓▓▓")
							updated_title = updated_title:gsub("^##", "░▓▓▓▓▓")
							updated_title = updated_title:gsub("^#", "▓▓▓▓▓▓")
							return updated_title
						end
						return my_title_transformer
					end,
					object_count_icon_set = "nerdfont",
					object_count_opts = function()
						local opts = {
							link = false,
							blockquote = {
								icon = " ",
								count_method = {
									pattern = { "^>.+$" },
									tally = "blocks",
								},
							},
							fncblk = {
								icon = " ",
							},
						}
						return opts
					end,
					line_count = false,
					word_count = true,
					fill_chars = {
						left_edge = "╾─ ─",
						right_edge = "──╼",
						item_separator = " · ",
						section_separator = " // ",
						left_inside = " ┝",
						right_inside = "┥ ",
						middle = "─",
					},
				},
				perspective = {
					priority = "current",
					fallback = "root",
					root_tell = 'index.md',
				},
			})
		end,
	},
}
