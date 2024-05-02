-- Simple UI Library for Roblox
local SimpleUILib = {}

-- Function to create a window with a title
function SimpleUILib.createWindow(parent, title)
-- Roblox Lua Script voor het creëren van een UI-frame met scrollbaar inhoudsgebied

-- Maak een ScreenGui om de UI te bevatten
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Het hoofdframe
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 112)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.437, 0, 0.342, 0)
mainFrame.Size = UDim2.new(0, 266, 0, 294)

-- Titel frame aan de bovenkant
local titleFrame = Instance.new("Frame")
titleFrame.Parent = mainFrame
titleFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleFrame.BackgroundTransparency = 0.6
titleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleFrame.Size = UDim2.new(1, 0, 0, 29)

local titleFrameCorner = Instance.new("UICorner", titleFrame)

-- Titel label
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = titleFrame
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Project Qnix"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(211, 211, 211)
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Size = UDim2.new(1, 0, 1, 0)

-- Scroll frame voor knoppen of inhoud
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = mainFrame
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.Position = UDim2.new(0, 0, 0.1, 0)  -- Onder het titelgedeelte
scrollFrame.Size = UDim2.new(1, 0, 0.9, 0)  -- 90% van het hoofdframe
scrollFrame.CanvasSize = UDim2.new(0, 0, 1, 0)  -- CanvasSize kan worden aangepast afhankelijk van het aantal elementen
scrollFrame.ScrollBarThickness = 10  -- De breedte van de scrollbar
scrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y  -- Alleen verticaal scrollen

-- Voeg een UIListLayout toe om automatische positionering van de knoppen mogelijk te maken
local listLayout = Instance.new("UIListLayout", scrollFrame)
listLayout.FillDirection = Enum.FillDirection.Vertical
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 5)  -- Ruimte tussen knoppen

-- Voeg een UICorner toe aan het hoofdframe
local mainFrameCorner = Instance.new("UICorner", mainFrame)

-- Voeg enkele knoppen toe aan het scrollframe
for i = 1, 10 do
    local button = Instance.new("TextButton")
    button.Parent = scrollFrame
    button.BackgroundColor3 = Color3.fromRGB(135, 84, 244)
    button.BackgroundTransparency = 0.6
    button.Size = UDim2.new(0.8, 0, 0.1, 0)  -- 10% van de hoogte van het scrollframe
    button.Text = "Button " .. i
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Voeg een UICorner toe voor een afgerond uiterlijk
    local uiCorner = Instance.new("UICorner", button)

    -- Stel de LayoutOrder in om de volgorde te bepalen
    button.LayoutOrder = i
end

-- Pas de CanvasSize aan om aan te geven hoeveel er gescrollt moet worden
scrollFrame.CanvasSize = UDim2.new(0, 0, listLayout.AbsoluteContentSize.Y, 0)

-- Function to create a button in a given window
function SimpleUILib.createButton(window, text, onClick)
    local button = Instance.new("TextButton", window.mainFrame)
    button.BackgroundColor3 = Color3.fromRGB(135, 84, 244)
    button.BackgroundTransparency = 0.6
    button.Size = UDim2.new(0.8, 0, 0.1, 0)  -- Default button size
    button.Position = UDim2.new(0.1, 0, window.nextButtonY, 0)  -- Position based on nextButtonY
    button.Text = text or "Button"
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    local uiCorner = Instance.new("UICorner", button)

    -- Connect the onClick function if provided
    if onClick then
        button.MouseButton1Click:Connect(onClick)
    end
    
    -- Update the next button position for vertical stacking
    window.nextButtonY = window.nextButtonY + 0.15  -- Increment the Y position
    
    return button
end

return SimpleUILib
