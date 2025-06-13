-- TokenStorage v0.1
-- Securely stores and retrieves GitHub access token in Studio settings

local TokenStorage = {}
local plugin = plugin -- Roblox plugin context provides this implicitly
local KEY = "GitHubSyncToken"

-- Save token securely in Studio settings
function TokenStorage:SaveToken(token)
	pcall(function()
		plugin:SetSetting(KEY, token)
	end)
end

-- Retrieve token from Studio settings
function TokenStorage:GetToken()
	local token = nil
	pcall(function()
		token = plugin:GetSetting(KEY)
	end)
	return token
end

-- Clear token if needed
function TokenStorage:ClearToken()
	pcall(function()
		plugin:SetSetting(KEY, nil)
	end)
end

return TokenStorage