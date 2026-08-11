local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")

local espEnabled = true
local connections = {}
local highlightCount = 0

local function createESP(targetPlayer)
	if targetPlayer == player then return end
	
	local function onCharacterAdded(character)
		local highlight = Instance.new("Highlight")
		highlight.Name = "ESPHighlight"
		highlight.FillColor = Color3.fromRGB(255, 75, 100)
		highlight.FillTransparency = 0.5
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.OutlineTransparency = 1
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Parent = character
		highlightCount = highlightCount + 1
	end
	
	local function onCharacterRemoving(character)
		local highlight = character:FindFirstChild("ESPHighlight")
		if highlight then
			highlight:Destroy()
			highlightCount = highlightCount - 1
		end
	end
	
	if targetPlayer.Character then
		onCharacterAdded(targetPlayer.Character)
	end
	
	table.insert(connections, targetPlayer.CharacterAdded:Connect(onCharacterAdded))
	table.insert(connections, targetPlayer.CharacterRemoving:Connect(onCharacterRemoving))
end

local function removeESP(targetPlayer)
	if targetPlayer.Character then
		local highlight = targetPlayer.Character:FindFirstChild("ESPHighlight")
		if highlight then
			highlight:Destroy()
		end
	end
end

local function enableESP()
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			createESP(plr)
		end
	end
	
	table.insert(connections, game.Players.PlayerAdded:Connect(function(plr)
		if espEnabled then
			createESP(plr)
		end
	end))
	
	table.insert(connections, game.Players.PlayerRemoving:Connect(function(plr)
		removeESP(plr)
	end))
end

local function disableESP()
	espEnabled = false
	for _, plr in pairs(game.Players:GetPlayers()) do
		removeESP(plr)
	end
	
	for _, conn in pairs(connections) do
		conn:Disconnect()
	end
	connections = {}
end

enableESP()

local playerGui = player:WaitForChild("PlayerGui")
playerGui.ChildRemoved:Connect(function(child)
	if child.Name == "TheDarkScriptGUI" then
		disableESP()
	end
end)
