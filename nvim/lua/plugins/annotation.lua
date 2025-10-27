-- /plugins/annotation.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/danymat/neogen
    "danymat/neogen",
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
    opts = {
      languages = {
        lua = {
          template = {
            annotation_convention = "emmylua"
          }
        }
      },
    },
  },
}
