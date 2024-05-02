-- Simple UI Library for Roblox
local SimpleUILib = {}

-- Function to create a window with a title
function SimpleUILib.createWindow(parent, title)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = parent
    
    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 112)
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.Size = UDim2.new(0.25, 0, 0.4, 0)  -- Default size
    mainFrame.Position = UDim2.new(0.375, 0, 0.3, 0)  -- Centered on screen
    
    local uiCorner = Instance.new("UICorner", mainFrame)
    
    local titleLabel = Instance.new("TextLabel", mainFrame)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title or "Untitled Window"
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 24
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Size = UDim2.new(1, 0, 0.15, 0)  -- Top section for title
    titleLabel.TextYAlignment = Enum.TextYAlignment.Center
    
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

