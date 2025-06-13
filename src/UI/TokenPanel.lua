-- TokenPanel v0.1
-- UI panel for entering GitHub token

local TokenStorage = require(script.Parent.Parent.Services.TokenStorage)

local TokenPanel = {}

function TokenPanel:Create(parent)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 0, 100)
	frame.BackgroundColor3 = Color3.new(0.9, 0.9, 0.9)
	frame.Position = UDim2.new(0, 0, 0, 130)
	frame.Parent = parent

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -20, 0, 20)
	label.Position = UDim2.new(0, 10, 0, 10)
	label.Text = "GitHub Token"
	label.BackgroundTransparency = 1
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = frame

	local textbox = Instance.new("TextBox")
	textbox.Size = UDim2.new(1, -20, 0, 30)
	textbox.Position = UDim2.new(0, 10, 0, 40)
	textbox.PlaceholderText = "Enter GitHub token here"
	textbox.ClearTextOnFocus = false
	textbox.Text = TokenStorage:GetToken() or ""
	textbox.Parent = frame

	local saveButton = Instance.new("TextButton")
	saveButton.Size = UDim2.new(0, 100, 0, 30)
	saveButton.Position = UDim2.new(1, -110, 0, 40)
	saveButton.Text = "Save"
	saveButton.Parent = frame

	saveButton.MouseButton1Click:Connect(function()
		TokenStorage:SaveToken(textbox.Text)
		print("Token saved!")
	end)

	return frame
end

return TokenPanel