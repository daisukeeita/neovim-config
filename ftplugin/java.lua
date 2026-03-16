local jdtls = require("jdtls")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

local jdtls_path = home .. "/.local/share/jdtls"
local java_debug_path = home .. "/.local/share/java-debug"
local vscode_java_test_path = home .. "/.local/share/vscode-java-test"

local os_config = jdtls_path .. "/config_linux"
local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

local bundles = {
	vim.fn.glob(java_debug_path .. "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
}

local java_test_bundles = vim.split(vim.fn.glob(vscode_java_test_path .. "/server/*.jar", 1), "\n")
local excluded = {
	"com.microsoft.java.test.runner-jar-with-dependencies.jar",
	"jacocoagent.jar",
}
for _, java_test_jar in ipairs(java_test_bundles) do
	local fname = vim.fn.fnamemodify(java_test_jar, ":t")
	if not vim.tbl_contains(excluded, fname) then
		table.insert(bundles, java_test_jar)
	end
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local on_attach = function(client, bufnr)
	-- 1. Setup Java Debugger (DAP)
	-- This specifically connects the java-debug bundles you already have
	require("jdtls").setup_dap({ hotcodereplace = "auto" })

	-- 2. Setup Java Test (Optional helper for nvim-jdtls)
	require("jdtls.dap").setup_dap_main_class_configs()

	-- 3. The "Ghost Text" (CodeLens) Refresh we discussed
	if client.supports_method("textDocument/codeLens") then
		vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
			buffer = bufnr,
			callback = function()
				vim.lsp.codelens.refresh()
			end,
		})
		vim.lsp.codelens.refresh()
	end

	-- 4. Keymaps (Helper function to keep things clean)
	local function opts(desc)
		return { noremap = true, silent = true, buffer = bufnr, desc = desc }
	end

	-- DAP (Debugger) Keymaps
	vim.keymap.set("n", "<F5>", function()
		require("dap").continue()
	end, opts("Debug: Start/Continue"))
	vim.keymap.set("n", "<leader>b", function()
		require("dap").toggle_breakpoint()
	end, opts("Debug: Toggle Breakpoint"))

	-- JDTLS Specific (Testing)
	vim.keymap.set("n", "<leader>df", function()
		require("jdtls").test_class()
	end, opts("Test: Class"))
	vim.keymap.set("n", "<leader>dn", function()
		require("jdtls").test_nearest_method()
	end, opts("Test: Method"))
end

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		launcher_jar,
		"-configuration",
		os_config,
		"-data",
		workspace_dir,
	},

	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
	capabilities = capabilities,

	settings = {
		java = {
			cleanup = {
				actionOnSave = {
					"addFinalModifier",
					"stringConcatToTextBlock",
					"invertEquals",
				},
			},
			codeGeneration = {
				useBlocks = true,
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
			},
			completion = {
				enabled = true,
				guessMethodArguments = true,
				postfix = {
					enabled = true,
				},
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			contentProvider = { preferred = "fernflower" },
			eclipse = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			implementationCodeLens = "all",
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = { enabled = true },
			references = {
				includeAccessors = true,
				includeDecompiledSources = true,
			},
			saveActions = {
				organizeImports = true,
				cleanup = true,
			},
			signatureHelp = { enabled = true },
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			symbols = {
				includeSourceMethodDeclarations = true,
			},
		},
	},

	init_options = {
		bundles = bundles,
		extendedClientCapabilities = extendedClientCapabilities,
	},

	on_attach = on_attach,
}

require("jdtls").start_or_attach(config)
