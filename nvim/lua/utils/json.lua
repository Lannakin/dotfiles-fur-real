-- /utils/json.lua
-- from MeteorVim
-- may be gigabusted
--- Module for reading and modifying JSON configuration in Neovim.
local M = {}

--- Neovim configuration path
local config_path = vim.fn.stdpath('config')
--- JSON file path
local path = string.format("%s/settings.json", config_path)

--- Function to get the content of a file.
--- @param filepath string path to the file.
local getFileContent = function(filepath)
    local file = io.open(filepath, "r")
    if not file then
        return nil
    end

    local content = file:read("*a")
    file:close()
    return content
end

local writeFileContent = function(filepath, content)
    local file, err = io.open(filepath, "w")

    if not file then
        print("Error opening the file: " .. err)
        return false
    else
        file:write(content)
        file:close()
        return true
    end
end

local getTable = function()
    local json = getFileContent(path)
    if json == nil then
        print("Error: Could not read settings.json (file may not exist)")
        return {}
    end
    return vim.json.decode(json)
end

--- Function to encode a Lua table as JSON.
--- @param json table Lua table to encode as JSON.
local setTable = function(json)
    return vim.json.encode(json)
end

--- Function to get a value from the JSON configuration.
--- @param object string key to retrieve from the JSON configuration.
M.getValue = function(object)
    local data = getTable()
    return data[object]
end

--- Function to set a value in the JSON configuration.
--- @param object string key to set in the JSON configuration.
--- @param value string value to assign to the key.
M.setValue = function(object, value)
    local data = getTable()
    data[object] = value
    local json = setTable(data)
    writeFileContent(path, json)
end

return M
