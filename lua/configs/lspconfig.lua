-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/Users/erlen/AppData/Roaming/nvm/v18.17.1/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
  -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

-- hack to make sure volar finds typescript even if its a monorepo. can be made more specific to turborepo
local util = require "lspconfig.util"
local function get_typescript_server_path(root_dir)
  local global_ts = "/Users/erlen/AppData/Roaming/nvm/v18.17.1/node_modules/typescript/lib"
  local found_ts = ""
  local function check_dir(path)
    found_ts = util.path.join(path, "node_modules", "typescript", "lib")
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

lspconfig.volar.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}

-- servers with default config
local servers = { "html", "cssls", "eslint", "docker_compose_language_service", "dockerls", "tailwindcss" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
