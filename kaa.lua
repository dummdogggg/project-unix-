-- Simple UI Library for Roblox
local SimpleUILib = {}

-- Function to create a window with a title
function SimpleUILib.createWindow(title)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Het hoofdframe
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 112)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.437014967, 0, 0.341717303, 0)
mainFrame.Size = UDim2.new(0, 266, 0, 294)

-- Een binnenframe voor de titel
local titleFrame = Instance.new("Frame")
titleFrame.Parent = mainFrame
titleFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleFrame.BackgroundTransparency = 0.6
titleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleFrame.BorderSizePixel = 0
titleFrame.Size = UDim2.new(1, 0, 0, 29)

-- Een UICorner om afgeronde hoeken te creëren
local titleFrameCorner = Instance.new("UICorner")
titleFrameCorner.Parent = titleFrame

-- Een titel label
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = titleFrame
titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.BorderSizePixel = 0
titleLabel.Position = UDim2.new(0.09, 0, 0.14, 0)
titleLabel.Size = UDim2.new(0, 130, 0, 18)
titleLabel.Font = Enum.Font.SourceSans
titleLabel.Text = "Project Qnix"
titleLabel.TextColor3 = Color3.fromRGB(211, 211, 211)
titleLabel.TextSize = 20

-- Een UICorner voor het hoofdframe
local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.Parent = mainFrame

-- Een gradient voor het hoofdframe
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 25, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 57, 139))
})
gradient.Parent = mainFrame

-- Een afbeeldingslabel
local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = mainFrame
imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
imageLabel.BackgroundTransparency = 1
imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
imageLabel.BorderSizePixel = 0
imageLabel.Position = UDim2.new(-0.08, 0, -0.09, 0)
imageLabel.Size = UDim2.new(0, 80, 0, 80)
imageLabel.Image = "http://www.roblox.com/asset/?id=17360859188"

-- Een extra frame voor andere componenten
local additionalFrame = Instance.new("Frame")
additionalFrame.Parent = screenGui
additionalFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
additionalFrame.BackgroundTransparency = 1
additionalFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
additionalFrame.BorderSizePixel = 0
additionalFrame.Position = UDim2.new(0.436, 0, 0.365, 0)
additionalFrame.Size = UDim2.new(0, 266, 0, 335)

    return {
        screenGui = screenGui,
        mainFrame = mainFrame,
        nextButtonY = 0.15  -- To keep track of button placement
    }
end

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

