-- GitHubSyncPlugin v0.1
-- Entry point for the plugin

local toolbar = plugin:CreateToolbar("GitHub Sync")
local syncButton = toolbar:CreateButton("Sync", "Sync project with GitHub", "")

local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Right,
	true, -- Initial enabled
	false, -- Override enabled toggle
	300, 400, 150, 150, 500, 500
)

local widget = plugin:CreateDockWidgetPluginGui("GitHubSync", widgetInfo)
widget.Title = "GitHub Sync"

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.Parent = widget

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 50)
statusLabel.Position = UDim2.new(0, 0, 0, 0)
statusLabel.Text = "Status: Idle"
statusLabel.Parent = mainFrame

local syncBtn = Instance.new("TextButton")
syncBtn.Size = UDim2.new(1, -20, 0, 50)
syncBtn.Position = UDim2.new(0, 10, 0, 60)
syncBtn.Text = "Sync to GitHub"
syncBtn.Parent = mainFrame

syncButton.Click:Connect(function()
	widget.Enabled = not widget.Enabled
end)

syncBtn.MouseButton1Click:Connect(function()
	statusLabel.Text = "Syncing... (TODO)"
	-- Placeholder for sync logic
end)