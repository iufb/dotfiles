return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")

		-- Setup the go debug adapter
		require("dap-go").setup()

		-- Setup DAP virtual text
		require("nvim-dap-virtual-text").setup({})
		vim.g.dap_virtual_text = true

		-- Setup DAP UI
		local dapui = require("dapui")
		dapui.setup()

		-- Automatically open the DAP UI when the debugging session begins
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Adding symbols for breakpoints and such
		vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "→", texthl = "", linehl = "", numhl = "" })
	end,
}
