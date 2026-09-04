local player = game.Players.LocalPlayer
local runService = game:GetService("RunService")

-- Настройки ESP (можно менять под свой вкус)
local ESP_CONFIG = {
    FillColor = Color3.fromRGB(255, 75, 100),     -- цвет заливки
    FillTransparency = 0.5,                       -- прозрачность заливки
    OutlineColor = Color3.fromRGB(255, 255, 255), -- цвет обводки (если используется)
    OutlineTransparency = 1,                      -- прозрачность обводки (1 = скрыта)
    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- видимость сквозь стены
}

local espEnabled = true
local connections = {}
local highlightCount = 0

-- Создание ESP для конкретного игрока
local function createESP(targetPlayer)
    if targetPlayer == player then return end

    local function onCharacterAdded(character)
        -- Проверяем, что у персонажа есть Humanoid (R15 обязателен)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end

        -- Создаём Highlight
        local highlight = Instance.new("Highlight")
        highlight.Name = "ESPHighlight"
        highlight.FillColor = ESP_CONFIG.FillColor
        highlight.FillTransparency = ESP_CONFIG.FillTransparency
        highlight.OutlineColor = ESP_CONFIG.OutlineColor
        highlight.OutlineTransparency = ESP_CONFIG.OutlineTransparency
        highlight.DepthMode = ESP_CONFIG.DepthMode
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

    -- Если персонаж уже существует, сразу применяем ESP
    if targetPlayer.Character then
        onCharacterAdded(targetPlayer.Character)
    end

    -- Подписываемся на события появления/удаления персонажа
    table.insert(connections, targetPlayer.CharacterAdded:Connect(onCharacterAdded))
    table.insert(connections, targetPlayer.CharacterRemoving:Connect(onCharacterRemoving))
end

-- Удаление ESP с конкретного игрока
local function removeESP(targetPlayer)
    if targetPlayer.Character then
        local highlight = targetPlayer.Character:FindFirstChild("ESPHighlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

-- Включение ESP для всех текущих и будущих игроков
local function enableESP()
    -- Применяем ко всем существующим игрокам
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player then
            createESP(plr)
        end
    end

    -- Новые игроки
    table.insert(connections, game.Players.PlayerAdded:Connect(function(plr)
        if espEnabled then
            createESP(plr)
        end
    end))

    -- Игроки, покинувшие сервер
    table.insert(connections, game.Players.PlayerRemoving:Connect(function(plr)
        removeESP(plr)
    end))
end

-- Полное отключение ESP и очистка ресурсов
local function disableESP()
    espEnabled = false

    -- Удаляем все активные Highlight
    for _, plr in pairs(game.Players:GetPlayers()) do
        removeESP(plr)
    end

    -- Отключаем все обработчики событий
    for _, conn in pairs(connections) do
        conn:Disconnect()
    end
    connections = {}
end

-- Запускаем ESP
enableESP()

-- Автоматическое отключение при закрытии GUI (если используется меню)
local playerGui = player:WaitForChild("PlayerGui")
playerGui.ChildRemoved:Connect(function(child)
    if child.Name == "TheDarkScriptGUI" then
        disableESP()
    end
end)

-- Опционально: можно отключить ESP при смерти локального игрока (не обязательно)
