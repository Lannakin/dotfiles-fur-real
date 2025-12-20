-- /plugins/documentation.lua
-- disabled if below line is active
-- if true then return {} end
---@module "lazy"

---@type LazySpec
return {
  {
    -- https://github.com/amrbashir/nvim-docs-view
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = "DocsViewToggle",
    opts = {
      position = "right",
      width = 60,
    },
  },
  {
    -- https://github.com/danymat/neogen
    "danymat/neogen",
    ---@type LazyKeysSpec[]
    keys = {
      { "<leader>cn", function() require("neogen").generate() end, desc = "Generate Annotations (Neogen)" },
    },
    opts = {
      languages = {
        lua = {
          template = {
            annotation_convention = "emmylua",
          },
        },
      },
    },
  },
}
