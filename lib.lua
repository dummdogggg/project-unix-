local UILibrary = {}

-- Functie om een nieuw venster te maken
function UILibrary.CreateWindow(titleText)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local TitleBar = Instance.new("Frame")
    local TitleText = Instance.new("TextLabel")
    local ButtonContainer = Instance.new("Frame")

    -- Configureer ScreenGui
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Configureer MainFrame
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 112)
    MainFrame.Position = UDim2.new(0.5, -133, 0.3, 0)  -- Centered and some height
    MainFrame.Size = UDim2.new(0, 266, 0, 100)  -- Initial height
    MainFrame.BorderSizePixel = 0

    -- Configureer TitleBar
    TitleBar.Parent = MainFrame
    TitleBar.Size = UDim2.new(1, 0, 0, 30)  -- Title bar height
    TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TitleBar.BackgroundTransparency = 0.6

    -- Configureer TitleText
    TitleText.Parent = TitleBar
    TitleText.Size = UDim2.new(1, 0, 1, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.Font = Enum.Font.Gotham
    TitleText.Text = titleText
    TitleText.TextSize = 18
    TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleText.TextWrapped = true
    TitleText.TextXAlignment = Enum.TextXAlignment.Center

    -- Configureer ButtonContainer
    ButtonContainer.Parent = MainFrame
    ButtonContainer.Position = UDim2.new(0, 0, 1, 0)  -- Below title bar
    ButtonContainer.Size = UDim2.new(1, 0, 0, 0)  -- Initially zero height, will grow with buttons
    ButtonContainer.BackgroundTransparency = 1

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        TitleText = TitleText,
        ButtonContainer = ButtonContainer
    }
end

-- Functie om een knop toe te voegen aan een venster
function UILibrary.CreateButton(window, buttonText, callback)
    local Button = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")

    -- Configureer de knop
    Button.Parent = window.ButtonContainer
    Button.Text = buttonText
    Button.Size = UDim2.new(1, -20, 0, 30)  -- Button height
    Button.Position = UDim2.new(0, 10, 1, 10)  -- Padding
    Button.BackgroundColor3 = Color3.fromRGB(135, 84, 244)
    Button.BackgroundTransparency = 0.6
    Button.Font = Enum.Font.Gotham
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.AutoButtonColor = true

    -- Configureer de hoekafronding
    UICorner.Parent = Button

    -- Voeg de callback toe
    Button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    -- Pas de hoogte van het venster aan
    local newHeight = window.ButtonContainer.AbsoluteContentSize.Y + 40  -- Extra space for padding
    window.MainFrame.Size = UDim2.new(0, 266, 0, newHeight)

    return Button
end

return UILibrary

