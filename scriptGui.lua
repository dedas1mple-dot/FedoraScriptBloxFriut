local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("TheDarkScriptGUI") then
	playerGui.TheDarkScriptGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TheDarkScriptGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui


local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 750, 0, 500)
MainFrame.Position = UDim2.new(0.5, -375, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) 
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame


local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 180, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 8)
SidebarCorner.Parent = Sidebar

local SidebarFix = Instance.new("Frame") 
SidebarFix.Size = UDim2.new(0, 10, 1, 0)
SidebarFix.Position = UDim2.new(1, -10, 0, 0)
SidebarFix.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SidebarFix.BorderSizePixel = 0
SidebarFix.Parent = Sidebar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -10, 0, 50)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "The Dark Script - Ink Game"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Sidebar

local TopLine = Instance.new("Frame")
TopLine.Size = UDim2.new(1, 0, 0, 1)
TopLine.Position = UDim2.new(0, 0, 0, 50)
TopLine.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TopLine.BorderSizePixel = 0
TopLine.Parent = MainFrame


local TabGeneral = Instance.new("TextButton")
TabGeneral.Size = UDim2.new(1, -20, 0, 35)
TabGeneral.Position = UDim2.new(0, 10, 0, 60)
TabGeneral.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TabGeneral.Text = ""
TabGeneral.Parent = Sidebar
local TabGeneralCorner = Instance.new("UICorner")
TabGeneralCorner.CornerRadius = UDim.new(0, 6)
TabGeneralCorner.Parent = TabGeneral

local TabGeneralIcon = Instance.new("ImageLabel")
TabGeneralIcon.Size = UDim2.new(0, 18, 0, 18)
TabGeneralIcon.Position = UDim2.new(0, 10, 0.5, -9)
TabGeneralIcon.BackgroundTransparency = 1
TabGeneralIcon.Image = "rbxassetid://130068439240504"
TabGeneralIcon.Parent = TabGeneral

local TabGeneralText = Instance.new("TextLabel")
TabGeneralText.Size = UDim2.new(1, -35, 1, 0)
TabGeneralText.Position = UDim2.new(0, 35, 0, 0)
TabGeneralText.BackgroundTransparency = 1
TabGeneralText.Text = "General"
TabGeneralText.TextColor3 = Color3.fromRGB(255, 255, 255)
TabGeneralText.Font = Enum.Font.GothamSemibold
TabGeneralText.TextSize = 14
TabGeneralText.TextXAlignment = Enum.TextXAlignment.Left
TabGeneralText.Parent = TabGeneral

local TabPvP = Instance.new("TextButton")
TabPvP.Size = UDim2.new(1, -20, 0, 35)
TabPvP.Position = UDim2.new(0, 10, 0, 105)
TabPvP.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabPvP.Text = ""
TabPvP.Parent = Sidebar
local TabPvPCorner = Instance.new("UICorner")
TabPvPCorner.CornerRadius = UDim.new(0, 6)
TabPvPCorner.Parent = TabPvP

local TabPvPIcon = Instance.new("ImageLabel")
TabPvPIcon.Size = UDim2.new(0, 18, 0, 18)
TabPvPIcon.Position = UDim2.new(0, 10, 0.5, -9)
TabPvPIcon.BackgroundTransparency = 1
TabPvPIcon.Image = "rbxassetid://4391741881"
TabPvPIcon.ImageTransparency = 0.5
TabPvPIcon.Parent = TabPvP

local TabPvPText = Instance.new("TextLabel")
TabPvPText.Size = UDim2.new(1, -35, 1, 0)
TabPvPText.Position = UDim2.new(0, 35, 0, 0)
TabPvPText.BackgroundTransparency = 1
TabPvPText.Text = "PvP"
TabPvPText.TextColor3 = Color3.fromRGB(180, 180, 180)
TabPvPText.Font = Enum.Font.GothamSemibold
TabPvPText.TextSize = 14
TabPvPText.TextXAlignment = Enum.TextXAlignment.Left
TabPvPText.Parent = TabPvP

local TabVisuals = Instance.new("TextButton")
TabVisuals.Size = UDim2.new(1, -20, 0, 35)
TabVisuals.Position = UDim2.new(0, 10, 0, 150)
TabVisuals.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabVisuals.Text = ""
TabVisuals.Parent = Sidebar
local TabVisualsCorner = Instance.new("UICorner")
TabVisualsCorner.CornerRadius = UDim.new(0, 6)
TabVisualsCorner.Parent = TabVisuals

local TabVisualsIcon = Instance.new("ImageLabel")
TabVisualsIcon.Size = UDim2.new(0, 18, 0, 18)
TabVisualsIcon.Position = UDim2.new(0, 10, 0.5, -9)
TabVisualsIcon.BackgroundTransparency = 1
TabVisualsIcon.Image = "rbxassetid://113542807465335"
TabVisualsIcon.ImageTransparency = 0.5
TabVisualsIcon.Parent = TabVisuals

local TabVisualsText = Instance.new("TextLabel")
TabVisualsText.Size = UDim2.new(1, -35, 1, 0)
TabVisualsText.Position = UDim2.new(0, 35, 0, 0)
TabVisualsText.BackgroundTransparency = 1
TabVisualsText.Text = "Visuals"
TabVisualsText.TextColor3 = Color3.fromRGB(180, 180, 180)
TabVisualsText.Font = Enum.Font.GothamSemibold
TabVisualsText.TextSize = 14
TabVisualsText.TextXAlignment = Enum.TextXAlignment.Left
TabVisualsText.Parent = TabVisuals

local TabInfo = Instance.new("TextButton")
TabInfo.Size = UDim2.new(1, -20, 0, 35)
TabInfo.Position = UDim2.new(0, 10, 0, 195)
TabInfo.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabInfo.Text = ""
TabInfo.Parent = Sidebar
local TabInfoCorner = Instance.new("UICorner")
TabInfoCorner.CornerRadius = UDim.new(0, 6)
TabInfoCorner.Parent = TabInfo

local TabInfoIcon = Instance.new("ImageLabel")
TabInfoIcon.Size = UDim2.new(0, 18, 0, 18)
TabInfoIcon.Position = UDim2.new(0, 10, 0.5, -9)
TabInfoIcon.BackgroundTransparency = 1
TabInfoIcon.Image = "rbxassetid://4871684504"
TabInfoIcon.ImageTransparency = 0.5
TabInfoIcon.Parent = TabInfo

local TabInfoText = Instance.new("TextLabel")
TabInfoText.Size = UDim2.new(1, -35, 1, 0)
TabInfoText.Position = UDim2.new(0, 35, 0, 0)
TabInfoText.BackgroundTransparency = 1
TabInfoText.Text = "Info"
TabInfoText.TextColor3 = Color3.fromRGB(180, 180, 180)
TabInfoText.Font = Enum.Font.GothamSemibold
TabInfoText.TextSize = 14
TabInfoText.TextXAlignment = Enum.TextXAlignment.Left
TabInfoText.Parent = TabInfo


local SearchBar = Instance.new("TextBox")
SearchBar.Size = UDim2.new(1, -200, 0, 30)
SearchBar.Position = UDim2.new(0, 190, 0, 10)
SearchBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SearchBar.Text = ""
SearchBar.PlaceholderText = "Search"
SearchBar.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
SearchBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBar.Font = Enum.Font.Gotham
SearchBar.TextSize = 12
SearchBar.Parent = MainFrame
local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBar

local SearchIcon = Instance.new("ImageLabel")
SearchIcon.Size = UDim2.new(0, 18, 0, 18)
SearchIcon.Position = UDim2.new(1, -24, 0.5, -9)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Image = "rbxassetid://15999597350"
SearchIcon.Parent = SearchBar

SearchBar.Focused:Connect(function()
	game:GetService("TweenService"):Create(SearchBar, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
end)

SearchBar.FocusLost:Connect(function(enterPressed)
	game:GetService("TweenService"):Create(SearchBar, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
	if SearchBar.Text == "" then
		game:GetService("TweenService"):Create(SearchIcon, TweenInfo.new(0.3), {ImageTransparency = 0}):Play()
	else
		game:GetService("TweenService"):Create(SearchIcon, TweenInfo.new(0.3), {ImageTransparency = 0.5}):Play()
	end
end)

SearchBar.Changed:Connect(function(property)
	if property == "Text" then
		if SearchBar.Text == "" then
			game:GetService("TweenService"):Create(SearchIcon, TweenInfo.new(0.3), {ImageTransparency = 0}):Play()
		else
			game:GetService("TweenService"):Create(SearchIcon, TweenInfo.new(0.3), {ImageTransparency = 0.5}):Play()
		end
	end
end)


local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -180, 1, -50)
ContentArea.Position = UDim2.new(0, 180, 0, 50)
ContentArea.BackgroundTransparency = 1
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainFrame


local GeneralPage = Instance.new("Frame")
GeneralPage.Size = UDim2.new(1, 0, 1, 0)
GeneralPage.Position = UDim2.new(0, 0, 0, 0)
GeneralPage.BackgroundTransparency = 1
GeneralPage.Parent = ContentArea

local GeneralScrolling = Instance.new("ScrollingFrame")
GeneralScrolling.Size = UDim2.new(1, 0, 1, 0)
GeneralScrolling.BackgroundTransparency = 1
GeneralScrolling.ScrollBarThickness = 2
GeneralScrolling.CanvasSize = UDim2.new(0, 0, 0, 650)
GeneralScrolling.Parent = GeneralPage

local LeftCol = Instance.new("Frame")
LeftCol.Size = UDim2.new(0.5, -15, 1, 0)
LeftCol.Position = UDim2.new(0, 10, 0, 10)
LeftCol.BackgroundTransparency = 1
LeftCol.Parent = GeneralScrolling
local LeftLayout = Instance.new("UIListLayout")
LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
LeftLayout.Padding = UDim.new(0, 10)
LeftLayout.Parent = LeftCol

local RightCol = Instance.new("Frame")
RightCol.Size = UDim2.new(0.5, -15, 1, 0)
RightCol.Position = UDim2.new(0.5, 5, 0, 10)
RightCol.BackgroundTransparency = 1
RightCol.Parent = GeneralScrolling
local RightLayout = Instance.new("UIListLayout")
RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
RightLayout.Padding = UDim.new(0, 10)
RightLayout.Parent = RightCol


local PvPPage = Instance.new("Frame")
PvPPage.Size = UDim2.new(1, 0, 1, 0)
PvPPage.Position = UDim2.new(0, 0, 1, 0)
PvPPage.BackgroundTransparency = 1
PvPPage.Parent = ContentArea

local PvPScrolling = Instance.new("ScrollingFrame")
PvPScrolling.Size = UDim2.new(1, 0, 1, 0)
PvPScrolling.BackgroundTransparency = 1
PvPScrolling.ScrollBarThickness = 2
PvPScrolling.CanvasSize = UDim2.new(0, 0, 0, 650)
PvPScrolling.Parent = PvPPage


local VisualsPage = Instance.new("Frame")
VisualsPage.Size = UDim2.new(1, 0, 1, 0)
VisualsPage.Position = UDim2.new(0, 0, 1, 0)
VisualsPage.BackgroundTransparency = 1
VisualsPage.Parent = ContentArea

local VisualsScrolling = Instance.new("ScrollingFrame")
VisualsScrolling.Size = UDim2.new(1, 0, 1, 0)
VisualsScrolling.BackgroundTransparency = 1
VisualsScrolling.ScrollBarThickness = 2
VisualsScrolling.CanvasSize = UDim2.new(0, 0, 0, 650)
VisualsScrolling.Parent = VisualsPage


local InfoPage = Instance.new("Frame")
InfoPage.Size = UDim2.new(1, 0, 1, 0)
InfoPage.Position = UDim2.new(0, 0, 1, 0)
InfoPage.BackgroundTransparency = 1
InfoPage.Parent = ContentArea

local InfoScrolling = Instance.new("ScrollingFrame")
InfoScrolling.Size = UDim2.new(1, 0, 1, 0)
InfoScrolling.BackgroundTransparency = 1
InfoScrolling.ScrollBarThickness = 2
InfoScrolling.CanvasSize = UDim2.new(0, 0, 0, 650)
InfoScrolling.Parent = InfoPage

local InfoSection = Instance.new("Frame")
InfoSection.Size = UDim2.new(1, -20, 0, 210)
InfoSection.Position = UDim2.new(0, 10, 0, 10)
InfoSection.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
InfoSection.BorderSizePixel = 1
InfoSection.BorderColor3 = Color3.fromRGB(45, 45, 45)
InfoSection.Parent = InfoScrolling

local InfoSectionCorner = Instance.new("UICorner")
InfoSectionCorner.CornerRadius = UDim.new(0, 6)
InfoSectionCorner.Parent = InfoSection

local InfoSectionTitle = Instance.new("TextLabel")
InfoSectionTitle.Size = UDim2.new(1, -10, 0, 30)
InfoSectionTitle.Position = UDim2.new(0, 10, 0, 0)
InfoSectionTitle.BackgroundTransparency = 1
InfoSectionTitle.Text = "Information"
InfoSectionTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoSectionTitle.Font = Enum.Font.GothamBold
InfoSectionTitle.TextSize = 13
InfoSectionTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoSectionTitle.Parent = InfoSection

local InfoSectionLine = Instance.new("Frame")
InfoSectionLine.Size = UDim2.new(1, 0, 0, 1)
InfoSectionLine.Position = UDim2.new(0, 0, 0, 30)
InfoSectionLine.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
InfoSectionLine.BorderSizePixel = 0
InfoSectionLine.Parent = InfoSection

local DevsLabel = Instance.new("TextLabel")
DevsLabel.Size = UDim2.new(1, -20, 0, 25)
DevsLabel.Position = UDim2.new(0, 10, 0, 40)
DevsLabel.BackgroundTransparency = 1
DevsLabel.Text = "Devs"
DevsLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
DevsLabel.Font = Enum.Font.Gotham
DevsLabel.TextSize = 13
DevsLabel.TextXAlignment = Enum.TextXAlignment.Left
DevsLabel.Parent = InfoSection

local DevsValue = Instance.new("TextLabel")
DevsValue.Size = UDim2.new(1, -20, 0, 25)
DevsValue.Position = UDim2.new(0, 10, 0, 65)
DevsValue.BackgroundTransparency = 1
DevsValue.Text = "The Dark Team"
DevsValue.TextColor3 = Color3.fromRGB(255, 75, 100)
DevsValue.Font = Enum.Font.GothamBold
DevsValue.TextSize = 13
DevsValue.TextXAlignment = Enum.TextXAlignment.Left
DevsValue.Parent = InfoSection

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Size = UDim2.new(1, -20, 0, 25)
VersionLabel.Position = UDim2.new(0, 10, 0, 100)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text = "Version"
VersionLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
VersionLabel.Font = Enum.Font.Gotham
VersionLabel.TextSize = 13
VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
VersionLabel.Parent = InfoSection

local VersionValue = Instance.new("TextLabel")
VersionValue.Size = UDim2.new(1, -20, 0, 25)
VersionValue.Position = UDim2.new(0, 10, 0, 125)
VersionValue.BackgroundTransparency = 1
VersionValue.Text = "0.0.1"
VersionValue.TextColor3 = Color3.fromRGB(200, 200, 200)
VersionValue.Font = Enum.Font.Gotham
VersionValue.TextSize = 13
VersionValue.TextXAlignment = Enum.TextXAlignment.Left
VersionValue.Parent = InfoSection

local GameLabel = Instance.new("TextLabel")
GameLabel.Size = UDim2.new(1, -20, 0, 25)
GameLabel.Position = UDim2.new(0, 10, 0, 160)
GameLabel.BackgroundTransparency = 1
GameLabel.Text = "Game"
GameLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
GameLabel.Font = Enum.Font.Gotham
GameLabel.TextSize = 13
GameLabel.TextXAlignment = Enum.TextXAlignment.Left
GameLabel.Parent = InfoSection

local GameValue = Instance.new("TextLabel")
GameValue.Size = UDim2.new(1, -20, 0, 25)
GameValue.Position = UDim2.new(0, 10, 0, 185)
GameValue.BackgroundTransparency = 1
GameValue.Text = "Ink Game"
GameValue.TextColor3 = Color3.fromRGB(200, 200, 200)
GameValue.Font = Enum.Font.Gotham
GameValue.TextSize = 13
GameValue.TextXAlignment = Enum.TextXAlignment.Left
GameValue.Parent = InfoSection



local function CreateSection(parent, titleText, height)
	local Section = Instance.new("Frame")
	Section.Size = UDim2.new(1, 0, 0, height)
	Section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Section.BorderSizePixel = 1
	Section.BorderColor3 = Color3.fromRGB(45, 45, 45)
	Section.Parent = parent

	local SecCorner = Instance.new("UICorner")
	SecCorner.CornerRadius = UDim.new(0, 6)
	SecCorner.Parent = Section

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -10, 0, 30)
	Title.Position = UDim2.new(0, 10, 0, 0)
	Title.BackgroundTransparency = 1
	Title.Text = titleText
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 13
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Section

	local Line = Instance.new("Frame")
	Line.Size = UDim2.new(1, 0, 0, 1)
	Line.Position = UDim2.new(0, 0, 0, 30)
	Line.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Line.BorderSizePixel = 0
	Line.Parent = Section

	local Container = Instance.new("Frame")
	Container.Size = UDim2.new(1, -20, 1, -40)
	Container.Position = UDim2.new(0, 10, 0, 35)
	Container.BackgroundTransparency = 1
	Container.Parent = Section

	local Layout = Instance.new("UIListLayout")
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	Layout.Padding = UDim.new(0, 8)
	Layout.Parent = Container

	return Container
end

local function CreateToggle(parent, text, defaultState)
	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(1, 0, 0, 25)
	Frame.BackgroundTransparency = 1
	Frame.Parent = parent

	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(1, -40, 1, 0)
	Label.BackgroundTransparency = 1
	Label.Text = text
	Label.TextColor3 = Color3.fromRGB(180, 180, 180)
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 13
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = Frame

	local ToggleBG = Instance.new("TextButton")
	ToggleBG.Size = UDim2.new(0, 36, 0, 18)
	ToggleBG.Position = UDim2.new(1, -36, 0.5, -9)
	ToggleBG.BackgroundColor3 = defaultState and Color3.fromRGB(255, 75, 100) or Color3.fromRGB(50, 50, 50)
	ToggleBG.Text = ""
	ToggleBG.Parent = Frame
	local TCorner = Instance.new("UICorner")
	TCorner.CornerRadius = UDim.new(1, 0)
	TCorner.Parent = ToggleBG

	local Circle = Instance.new("Frame")
	Circle.Size = UDim2.new(0, 14, 0, 14)
	Circle.Position = defaultState and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
	Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Circle.Parent = ToggleBG
	local CCorner = Instance.new("UICorner")
	CCorner.CornerRadius = UDim.new(1, 0)
	CCorner.Parent = Circle

	local state = defaultState
	ToggleBG.MouseButton1Click:Connect(function()
		state = not state
		local bgColor = state and Color3.fromRGB(255, 75, 100) or Color3.fromRGB(50, 50, 50)
		local circlePos = state and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
		game:GetService("TweenService"):Create(ToggleBG, TweenInfo.new(0.2), {BackgroundColor3 = bgColor}):Play()
		game:GetService("TweenService"):Create(Circle, TweenInfo.new(0.2), {Position = circlePos}):Play()
	end)

	return ToggleBG, function() return state end
end

local function CreateButton(parent, text)
	local Btn = Instance.new("TextButton")
	Btn.Size = UDim2.new(1, 0, 0, 28)
	Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Btn.Text = text
	Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
	Btn.Font = Enum.Font.Gotham
	Btn.TextSize = 13
	Btn.Parent = parent

	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(60, 60, 60)
	Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	Stroke.Parent = Btn

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 4)
	Corner.Parent = Btn

	Btn.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
	end)

	Btn.MouseLeave:Connect(function()
		game:GetService("TweenService"):Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
	end)

	Btn.MouseButton1Down:Connect(function()
		game:GetService("TweenService"):Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
	end)

	Btn.MouseButton1Up:Connect(function()
		game:GetService("TweenService"):Create(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
	end)

	return Btn
end

local function CreateLabel(parent, text)
	local Lbl = Instance.new("TextLabel")
	Lbl.Size = UDim2.new(1, 0, 0, 35)
	Lbl.BackgroundTransparency = 1
	Lbl.Text = text
	Lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
	Lbl.Font = Enum.Font.Gotham
	Lbl.TextSize = 12
	Lbl.TextWrapped = true
	Lbl.TextXAlignment = Enum.TextXAlignment.Left
	Lbl.Parent = parent

	return Lbl
end


local currentTab = "General"
local isAnimating = false

local allTabs = {
	General = {page = GeneralPage, btn = TabGeneral, text = TabGeneralText, icon = TabGeneralIcon},
	PvP = {page = PvPPage, btn = TabPvP, text = TabPvPText, icon = TabPvPIcon},
	Visuals = {page = VisualsPage, btn = TabVisuals, text = TabVisualsText, icon = TabVisualsIcon},
	Info = {page = InfoPage, btn = TabInfo, text = TabInfoText, icon = TabInfoIcon}
}

local function SwitchTab(tab)
	if isAnimating or currentTab == tab then return end
	isAnimating = true
	
	local oldTab = allTabs[currentTab]
	local newTab = allTabs[tab]
	
	game:GetService("TweenService"):Create(oldTab.page, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0, 0, -1, 0)}):Play()
	newTab.page.Position = UDim2.new(0, 0, 1, 0)
	game:GetService("TweenService"):Create(newTab.page, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
	
	game:GetService("TweenService"):Create(oldTab.btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}):Play()
	game:GetService("TweenService"):Create(oldTab.text, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
	game:GetService("TweenService"):Create(oldTab.icon, TweenInfo.new(0.3), {ImageTransparency = 0.5}):Play()
	
	game:GetService("TweenService"):Create(newTab.btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play()
	game:GetService("TweenService"):Create(newTab.text, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	game:GetService("TweenService"):Create(newTab.icon, TweenInfo.new(0.3), {ImageTransparency = 0}):Play()
	
	currentTab = tab
	
	task.wait(0.5)
	isAnimating = false
end

TabGeneral.MouseButton1Click:Connect(function()
	SwitchTab("General")
end)

TabPvP.MouseButton1Click:Connect(function()
	SwitchTab("PvP")
end)

TabVisuals.MouseButton1Click:Connect(function()
	SwitchTab("Visuals")
end)

TabInfo.MouseButton1Click:Connect(function()
	SwitchTab("Info")
end)



local InfoSec = CreateSection(RightCol, "Information", 160)
CreateLabel(InfoSec, "Hello User, welcome to the Script menu.")

local DiscordButton = CreateButton(InfoSec, "Join Discord Server")
DiscordButton.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/dFkbJAwmKY")
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Discord",
		Text = "Link copied to clipboard!",
		Duration = 5
	})
end)

local UnloadButton = CreateButton(InfoSec, "Unload")
UnloadButton.MouseButton1Click:Connect(function()
	local currentPos = MainFrame.Position
	local targetPos = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, 1, MainFrame.Size.Y.Offset / 2)
	local unloadAnimation = game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = targetPos})
	unloadAnimation:Play()
	unloadAnimation.Completed:Connect(function()
		ScreenGui:Destroy()
	end)
end)


local VisualsCol = Instance.new("Frame")
VisualsCol.Size = UDim2.new(1, -20, 1, 0)
VisualsCol.Position = UDim2.new(0, 10, 0, 10)
VisualsCol.BackgroundTransparency = 1
VisualsCol.Parent = VisualsScrolling
local VisualsLayout = Instance.new("UIListLayout")
VisualsLayout.SortOrder = Enum.SortOrder.LayoutOrder
VisualsLayout.Padding = UDim.new(0, 10)
VisualsLayout.Parent = VisualsCol


local ESPSection = CreateSection(VisualsCol, "ESP", 90)
local ESPToggle, getESPState = CreateToggle(ESPSection, "ESP Enabled", false)
