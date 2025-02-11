-- NOTE: Snacks.explorer() requires fd/fdfind to work. (https://github.com/sharkdp/fd)

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				-- Used by the `header` section
				header = [[
                                                  ███                               
                                     ████████████████                               
                       █             ██████████████████                             
                        ███     █████████████████████████                           
                      ██████████████████████████████████████                        
                    ██████████████████████████████████████████                      
           █      ████████████████████████████████████████████████                  
          ██  ██████████████████████████████████████████████████████████            
          ███  █████████████████████ ████████ █████████████████████████             
          ████████████████████████     █████  ███  ██████████████████               
          ██████████████████   ███      ███  ██            ██████████               
          █████████████████      █     ██                    █████████              
           █████████████              █                       █  █████              
          ███                                                 █   █████             
         ███          █████████                    ████████  █     █████            
         ███             █████████████         ████████            ██████           
        ███                █ █                     █ █              ███ ███         
        ███                ███                     ███               ██             
        ███                                                          ███            
        ███                      ███████  ███████                    ███            
        ███                   ██████████   ████████                  ███            
        ███                   ██                  ██                 ███            
        ███                                                          ███            
         ███                                                        ███             
         ███                                                        ███             
          ████                                                     ███              
           ████                                                   ████              
             ████                                                ████               
               ████                                            ████                 
                 █████                                       █████                  
                   ██████                                 █████                     
                      ████████                       ███████                        
                          ███████████████████████████████                           
                                ██████████████████                                  
                                                                                    
                                ]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = {
      enabled = true,
      sources = {
        files = { hidden = true,
        },
        explorer = {
          layout = {
            layout = { position = "right" },
          }
        }
      }
    },
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
	},
  keys = {
    -- Explorer & File Pickers
    { "<leader>|",  function() Snacks.explorer({ layout = { preview = true } }) end, desc = "Toggle Explorer" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find File" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Recent Files (cwd)" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Find Keymaps" },
    { "<leader>:",  function() Snacks.picker.command_history() end, desc = "Command History" },

    -- Zen Mode & Buffers
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<leader>bs", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>bS", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },

    -- Notifications
    { "<leader>H",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

    -- File Operations
    { "<leader>fC", function() Snacks.rename.rename_file() end, desc = "Rename File" },

    -- Git Operations
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },

    -- Word Navigation
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },

    -- Neovim News
    {
        "<leader>N",
        function()
            Snacks.win({
                file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                width = 0.75,
                height = 0.8,
                wo = {
                    spell = false,
                    wrap = true,
                    signcolumn = "yes",
                    statuscolumn = " ",
                    conceallevel = 3,
                },
            })
        end,
        desc = "Neovim News",
    },
  },
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
