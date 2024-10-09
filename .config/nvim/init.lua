vim.opt.termguicolors = true
require("core.maps")
require("core.lazy")
require("core.options")
require("core.colors")

-- Function to reload init.lua and connected files
function ReloadConfig()
	-- Clear the Lua module cache for your custom modules
	for name, _ in pairs(package.loaded) do
		-- Match only your custom modules or configuration files
		if name:match("^user_") or name:match("^myconfig_") or name:match("^mymodule_") then
			package.loaded[name] = nil
		end
	end

	-- Re-source the init.lua (re-run your entire configuration)
	dofile(vim.env.MYVIMRC)
	print("Configuration reloaded!")
end

-- Create a Neovim command to run the reload function
vim.api.nvim_create_user_command("ReloadConfig", ReloadConfig, {})
