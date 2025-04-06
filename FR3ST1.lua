-- FNaF Çığlık Sesi (Jumpscare)
local soundID = "rbxassetid://163800183"  -- Çığlık sesi ID'si
local decalID = "rbxassetid://14836741393"  -- Korkunç yüz ID'si

-- GUI paneli oluşturuluyor
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Panel GUI'si
        local playerGui = player:WaitForChild("PlayerGui")
        local screenGui = Instance.new("ScreenGui", playerGui)  -- Yeni bir GUI (ekran paneli) oluşturuyoruz
        screenGui.Name = "TrollPanel"

        -- Panel Arkaplanı
        local panelBackground = Instance.new("Frame", screenGui)
        panelBackground.Size = UDim2.new(0, 400, 0, 300)
        panelBackground.Position = UDim2.new(0.5, -200, 0.5, -150)
        panelBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        panelBackground.BackgroundTransparency = 0.5

        -- Başlık
        local titleLabel = Instance.new("TextLabel", panelBackground)
        titleLabel.Text = "FR3ST1 TROLL PANEL"
        titleLabel.Size = UDim2.new(1, 0, 0, 50)
        titleLabel.TextSize = 30
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.BackgroundTransparency = 1
        titleLabel.TextAlign = Enum.TextXAlignment.Center

        -- Çığlık Sesi Butonu
        local screamButton = Instance.new("TextButton", panelBackground)
        screamButton.Text = "Çığlık Sesi Çal"
        screamButton.Size = UDim2.new(0, 150, 0, 50)
        screamButton.Position = UDim2.new(0.5, -75, 0.3, 0)
        screamButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        screamButton.TextSize = 20
        screamButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        screamButton.MouseButton1Click:Connect(function()
            -- Çığlık sesini çal
            local sound = Instance.new("Sound")
            sound.SoundId = soundID
            sound.Parent = character:WaitForChild("Head")  -- Sesin kafa kısmında çalmasını sağla
            sound:Play()  -- Ses çal
        end)

        -- Korkunç Yüz Butonu
        local decalButton = Instance.new("TextButton", panelBackground)
        decalButton.Text = "Korkunç Yüz Göster"
        decalButton.Size = UDim2.new(0, 150, 0, 50)
        decalButton.Position = UDim2.new(0.5, -75, 0.5, 0)
        decalButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        decalButton.TextSize = 20
        decalButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        decalButton.MouseButton1Click:Connect(function()
            -- Korkunç yüz ekle
            local decal = Instance.new("Decal")
            decal.Texture = decalID
            decal.Parent = character:WaitForChild("Head")  -- Kafaya decal ekle
            wait(1)  -- 1 saniye sonra decal'ı kaldır
            decal:Destroy()
        end)

        -- Avatarınızı Ekra Geçici Olarak Spamlamak Butonu
        local spamButton = Instance.new("TextButton", panelBackground)
        spamButton.Text = "Avatar Spamla"
        spamButton.Size = UDim2.new(0, 150, 0, 50)
        spamButton.Position = UDim2.new(0.5, -75, 0.7, 0)
        spamButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        spamButton.TextSize = 20
        spamButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        spamButton.MouseButton1Click:Connect(function()
            -- Avatar spamla
            game:GetService("RunService").Heartbeat:Connect(function()
                -- Ekranda her oyuncuya bu görseli spamla
                for _, player in ipairs(game.Players:GetPlayers()) do
                    local sticker = Instance.new("Decal")  -- Sticker oluştur
                    sticker.Texture = decalID  -- Korkunç resim buraya ekleniyor
                    sticker.Parent = game.Workspace  -- Bunu oyun dünyasına ekle
                    sticker.Position = Vector3.new(math.random(-50, 50), math.random(50, 100), math.random(-50, 50))  -- Ekranın rastgele yerlerinde görünmesini sağlar
                    wait(0.5)  -- Her yarım saniyede bir yeni sticker oluşturulur
                end
            end)
        end)
    end)
end)
