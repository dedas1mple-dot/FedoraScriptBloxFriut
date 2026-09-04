-- ================= НАСТРОЙКИ ESP =================
local ESP_CONFIG = {
    FillColor = Color3.fromRGB(255, 75, 100),
    FillTransparency = 0.5,
    OutlineColor = Color3.fromRGB(255, 255, 255),
    OutlineTransparency = 1,
    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
}

local player = game.Players.LocalPlayer
local espActive = false
local playerConnections = {}
local npcHighlights = {}  -- model -> highlight
local npcScanThread = nil

-- ================= ФУНКЦИИ ДЛЯ ИГРОКОВ =================
local function addESPToPlayer(targetPlayer)
    if targetPlayer == player then return end

    local function onCharacterAdded(character)
        local humanoid = character:WaitForChild("Humanoid", 5)
        if not humanoid then return end

        local highlight = Instance.new("Highlight")
        highlight.Name = "ESPHighlight_Player"
        highlight.FillColor = ESP_CONFIG.FillColor
        highlight.FillTransparency = ESP_CONFIG.FillTransparency
        highlight.OutlineColor = ESP_CONFIG.OutlineColor
        highlight.OutlineTransparency = ESP_CONFIG.OutlineTransparency
        highlight.DepthMode = ESP_CONFIG.DepthMode
        highlight.Parent = character
    end

    local function onCharacterRemoving(character)
        local hl = character:FindFirstChild("ESPHighlight_Player")
        if hl then hl:Destroy() end
    end

    if targetPlayer.Character then
        onCharacterAdded(targetPlayer.Character)
    end

    table.insert(playerConnections, targetPlayer.CharacterAdded:Connect(onCharacterAdded))
    table.insert(playerConnections, targetPlayer.CharacterRemoving:Connect(onCharacterRemoving))
end

local function clearPlayerESP()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("ESPHighlight_Player") then
            plr.Character.ESPHighlight_Player:Destroy()
        end
    end
    for _, conn in pairs(playerConnections) do
        conn:Disconnect()
    end
    playerConnections = {}
end

-- ================= ФУНКЦИИ ДЛЯ NPC =================
local function findEnemiesFolder()
    -- ищем папку Enemies регистронезависимо
    for _, child in ipairs(workspace:GetChildren()) do
        if child:IsA("Folder") and string.lower(child.Name) == "enemies" then
            return child
        end
    end
    return nil
end

local function scanForNPCs()
    local enemiesFolder = findEnemiesFolder()
    local scanRoot

    if enemiesFolder then
        scanRoot = enemiesFolder
    else
        -- если папки нет, сканируем весь Workspace (осторожно, но эффективно)
        scanRoot = workspace
    end

    local npcModels = {}
    for _, obj in ipairs(scanRoot:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
            -- исключаем персонажей игроков
            local plr = game.Players:GetPlayerFromCharacter(obj)
            if not plr then
                npcModels[obj] = true
            end
        end
    end

    -- добавляем новые подсветки
    for model in pairs(npcModels) do
        if not npcHighlights[model] then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESPHighlight_NPC"
            highlight.FillColor = ESP_CONFIG.FillColor
            highlight.FillTransparency = ESP_CONFIG.FillTransparency
            highlight.OutlineColor = ESP_CONFIG.OutlineColor
            highlight.OutlineTransparency = ESP_CONFIG.OutlineTransparency
            highlight.DepthMode = ESP_CONFIG.DepthMode
            highlight.Parent = model
            npcHighlights[model] = highlight
        end
    end

    -- удаляем подсветки для исчезнувших NPC
    for model, hl in pairs(npcHighlights) do
        if not npcModels[model] then
            hl:Destroy()
            npcHighlights[model] = nil
        end
    end
end

local function clearNPCESP()
    if npcScanThread then
        npcScanThread = nil
    end
    for model, hl in pairs(npcHighlights) do
        hl:Destroy()
    end
    npcHighlights = {}
end

-- ================= ГЛАВНЫЕ ФУНКЦИИ ВКЛ/ВЫКЛ =================
local function enableESP()
    espActive = true
    clearPlayerESP()
    clearNPCESP()

    -- игроки
    for _, plr in pairs(game.Players:GetPlayers()) do
        addESPToPlayer(plr)
    end
    table.insert(playerConnections, game.Players.PlayerAdded:Connect(function(plr)
        if espActive then addESPToPlayer(plr) end
    end))
    table.insert(playerConnections, game.Players.PlayerRemoving:Connect(function(plr)
        if plr.Character and plr.Character:FindFirstChild("ESPHighlight_Player") then
            plr.Character.ESPHighlight_Player:Destroy()
        end
    end))

    -- NPC: запускаем цикл сканирования
    npcScanThread = task.spawn(function()
        while espActive do
            scanForNPCs()
            task.wait(1) -- проверка каждую секунду
        end
    end)
end

local function disableESP()
    espActive = false
    clearPlayerESP()
    clearNPCESP()
end

-- ================= АВТООТКЛЮЧЕНИЕ ПРИ УДАЛЕНИИ GUI =================
local playerGui = player:WaitForChild("PlayerGui")
playerGui.ChildRemoved:Connect(function(child)
    if child.Name == "TheDarkScriptGUI" then
        disableESP()
    end
end)
