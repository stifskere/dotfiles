local Log = require("utils.logs").for_module("recursive_load")
local Merge = require("utils.deep_merge")

local config_path = vim.fn.stdpath("config") .. "/lua"
local raw_modules = io.popen("find " .. config_path .. "/plugins/*/ -print | grep .lua$", "r")

if raw_modules == nil then
	Log:error("Couldn't load nested plugins.")
	return
end

local result = {}

for filename in raw_modules:lines() do
	local replaced = tostring(filename)
		:gsub(config_path, "")
		:gsub("/", ".")
		:gsub(".lua", "")

	Merge.merge_lists(result, require(replaced))
end

raw_modules:close()

return result
