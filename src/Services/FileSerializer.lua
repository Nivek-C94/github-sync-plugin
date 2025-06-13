-- FileSerializer v0.1
-- Converts Roblox instances to plain text for GitHub syncing

local FileSerializer = {}

-- Serialize one script object
function FileSerializer:SerializeScript(instance)
	if instance:IsA("Script") or instance:IsA("LocalScript") or instance:IsA("ModuleScript") then
		return instance.Source
	else
		return nil
	end
end

-- Recursively scan and serialize folder hierarchy
function FileSerializer:SerializeFolder(root)
	local files = {}

	local function recurse(folder, path)
		for _, child in ipairs(folder:GetChildren()) do
			local childPath = path .. "/" .. child.Name
			if child:IsA("Folder") then
				recurse(child, childPath)
			elseif child:IsA("Script") or child:IsA("LocalScript") or child:IsA("ModuleScript") then
				local content = self:SerializeScript(child)
				if content then
					table.insert(files, {
						path = childPath .. ".lua",
						content = content
					})
				end
			end
		end
	end

	recurse(root, "")
	return files
end

return FileSerializer