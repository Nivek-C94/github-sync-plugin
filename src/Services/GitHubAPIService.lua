-- GitHubAPIService v0.1
-- Handles communication with GitHub REST API

local HttpService = game:GetService("HttpService")
local GitHubAPIService = {}

-- CONFIG --
local ACCESS_TOKEN = "REPLACE_WITH_YOUR_GITHUB_TOKEN"
local REPO_OWNER = "Nivek-C94"
local REPO_NAME = "github-sync-plugin"
local BRANCH = "main"
local API_BASE = "https://api.github.com"

function GitHubAPIService:Request(method, endpoint, data)
	local url = API_BASE .. endpoint
	local headers = {
		["Authorization"] = "token " .. ACCESS_TOKEN,
		["Accept"] = "application/vnd.github.v3+json"
	}
	
	local requestBody = data and HttpService:JSONEncode(data) or nil
	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = url,
			Method = method,
			Headers = headers,
			Body = requestBody,
		})
	end)
	
	if not success or not response.Success then
		warn("GitHub API request failed:", response and response.StatusCode, response and response.Body)
		return nil, response and response.Body
	end
	
	return HttpService:JSONDecode(response.Body)
end

-- Example: Get latest commit SHA of branch
function GitHubAPIService:GetLatestCommitSHA()
	local endpoint = string.format("/repos/%s/%s/git/refs/heads/%s", REPO_OWNER, REPO_NAME, BRANCH)
	local result, err = self:Request("GET", endpoint)
	if result then
		return result.object.sha
	else
		return nil, err
	end
end

-- Example: Create a file
function GitHubAPIService:CreateFile(path, content, message)
	local endpoint = string.format("/repos/%s/%s/contents/%s", REPO_OWNER, REPO_NAME, path)
	local data = {
		message = message,
		content = HttpService:Base64Encode(content),
		branch = BRANCH
	}
	return self:Request("PUT", endpoint, data)
end

return GitHubAPIService