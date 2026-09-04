-- ================= НАСТРОЙКИ ESP =================
local ESP_CONFIG = {
    FillColor = Color3.fromRGB(255, 75, 100),      -- цвет заливки
    FillTransparency = 0.5,                        -- прозрачность заливки
    OutlineColor = Color3.fromRGB(255, 255, 255),  -- цвет обводки
    OutlineTransparency = 1,                       -- обводка скрыта
    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- видимость сквозь стены
}

-- ================= ПЕРЕМЕННЫЕ =================
local player = game.Players.LocalPlayer
local espActive = false               -- флаг активности ESP
local playerConnections = {}          -- связи для событий игроков
local npcHighlights = {}              -- словарь: модель NPC -> Highlight
local npcScanThread = nil             -- поток для сканирования NPC

-- ================= ФУНКЦИИ ДЛЯ ИГРОКОВ =================
local function addESPToPlayer(targetPlayer)
    if targetPlayer == player then return end

    local function onCharacterAdded(character)
        -- ждём появления Humanoid (R15)
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
local function scanForNPCs()
    -- проходим по всем объектам в Workspace
    for _, obj in ipairs(workspace:GetDescendants()) do
        -- нас интересуют только модели с Humanoid
        if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
            -- исключаем персонажей игроков
            local plr = game.Players:GetPlayerFromCharacter(obj)
            if not plr then
                -- если подсветки ещё нет, создаём
                if not npcHighlights[obj] then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "ESPHighlight_NPC"
                    highlight.FillColor = ESP_CONFIG.FillColor
                    highlight.FillTransparency = ESP_CONFIG.FillTransparency
                    highlight.OutlineColor = ESP_CONFIG.OutlineColor
                    highlight.OutlineTransparency = ESP_CONFIG.OutlineTransparency
                    highlight.DepthMode = ESP_CONFIG.DepthMode
                    highlight.Parent = obj
                    npcHighlights[obj] = highlight
                end
            end
        end
    end

    -- удаляем подсветки для NPC, которых больше нет (модель удалена)
    for model, highlight in pairs(npcHighlights) do
        if not model.Parent then
            highlight:Destroy()
            npcHighlights[model] = nil
        end
    end
end

local function clearNPCESP()
    -- останавливаем поток сканирования, если он есть
    if npcScanThread then
        npcScanThread = nil -- фактически поток завершится сам, но мы обнуляем ссылку
    end
    -- удаляем все подсветки NPC
    for model, highlight in pairs(npcHighlights) do
        highlight:Destroy()
    end
    npcHighlights = {}
end

-- ================= ГЛАВНЫЕ ФУНКЦИИ ВКЛ/ВЫКЛ =================
local function enableESP()
    espActive = true

    -- очищаем старое (на всякий случай)
    clearPlayerESP()
    clearNPCESP()

    -- подключаем игроков
    for _, plr in pairs(game.Players:GetPlayers()) do
        addESPToPlayer(plr)
    end
    table.insert(playerConnections, game.Players.PlayerAdded:Connect(function(plr)
        if espActive then
            addESPToPlayer(plr)
        end
    end))
    table.insert(playerConnections, game.Players.PlayerRemoving:Connect(function(plr)
        if plr.Character and plr.Character:FindFirstChild("ESPHighlight_Player") then
            plr.Character.ESPHighlight_Player:Destroy()
        end
    end))

    -- запускаем цикл сканирования NPC (каждые 5 секунд)
    npcScanThread = task.spawn(function()
        while espActive do
            scanForNPCs()
            task.wait(5)
        end
    end)
end

local function disableESP()
    espActive = false
    clearPlayerESP()
    clearNPCESP()
end

-- ================= ИСПОЛЬЗОВАНИЕ =================
-- Вызовите enableESP() для включения и disableESP() для выключения.
-- Пример интеграции в меню (если нужно):
-- ESPToggle.MouseButton1Click:Connect(function()
--     task.wait(0.1)
--     if getESPState() then
--         enableESP()
--     else
--         disableESP()
--     end
-- end)
