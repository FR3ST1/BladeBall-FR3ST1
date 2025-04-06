-- FR3ST1 Blade Ball Paneli Başlangıç Sürümü
-- Otomatik spam, yürüyüş ve ses örneği içerir

local FR3ST1_GUI = Instance.new("ScreenGui", game.CoreGui)
FR3ST1_GUI.Name = "FR3ST1Panel"

local Frame = Instance.new("Frame", FR3ST1_GUI)
Frame.Size = UDim2.new(0, 220, 0, 180)
Frame.Position = UDim2.new(0, 30, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "FR3ST1 - Blade Ball"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

local WalkToggle = Instance.new("TextButton", Frame)
WalkToggle.Size = UDim2.new(0, 200, 0, 30)
WalkToggle.Position = UDim2.new(0, 10, 0, 40)
WalkToggle.Text = "AFK Yürüyüş: KAPALI"
WalkToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
WalkToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkToggle.Font = Enum.Font.Gotham
WalkToggle.TextSize = 14

local walking = false
WalkToggle.MouseButton1Click:Connect(function()
    walking = not walking
    WalkToggle.Text = "AFK Yürüyüş: " .. (walking and "AÇIK" or "KAPALI")
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if walking then
        game.Players.LocalPlayer.Character:TranslateBy(Vector3.new(0.1, 0, 0))
    end
end)

-- Diğer özellikler (otomatik spam, top kurtarma) daha sonra eklenecek olan 
