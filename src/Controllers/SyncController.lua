-- SyncController v0.1
-- Orchestrates the syncing process between Roblox Studio and GitHub

local SyncController = {}

local GitHubAPIService = require(script.Parent.Parent.Services.GitHubAPIService)
local FileSerializer = require(script.Parent.Parent.Services.FileSerializer)

-- Settings (you can expose these to UI in future versions)
local SYNC_ROOT = game:GetService("ReplicatedStorage"):WaitForChild("SyncFolder")

function SyncController:StartSync()
	print("[SyncController] Starting sync...")

	local files = FileSerializer:SerializeFolder(SYNC_ROOT)
	print("[SyncController] Files prepared:", #files)

	for _, file in ipairs(files) do
		print("Uploading:", file.path)
		local result, err = GitHubAPIService:CreateFile(file.path, file.content, "Sync: " .. file.path)
		if result then
			print("Success:", file.path)
		else
			warn("Failed:", file.path, err)
		end
	end
	
	print("[SyncController] Sync complete!")
end

return SyncController