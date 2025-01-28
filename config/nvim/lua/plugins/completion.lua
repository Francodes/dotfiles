return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-j>",
					accept_word = "<C-l>",
	         next = "<C-k>",
	         dismiss = "<C-h>",
				},
			},
      copilot_node_command = "/Users/franco/.asdf/installs/nodejs/18.19.0/bin/node",
		},
	},
}
