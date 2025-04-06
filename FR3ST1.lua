-- Çığlık Sesi ve Korkunç Yüz için ID'ler
local soundID = "rbxassetid://163800183"  -- Çığlık sesi
local decalID = "rbxassetid://14836741393"  -- Korkunç yüz (Resim ID)

-- Oyuncu ve karakter bilgisi
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- GUI Paneli
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TrollPanel"
screenGui.Parent = playerGui  -- GUI'yi oyuncunun ekranına ekliyoruz

-- Panel Arka Planı
local panelBackground = Instance.new("Frame")
panelBackground.Size = UDim2.new(0, 400, 0, 300)
panelBackground.Position = UDim2.new(0.5, -200, 0.5, -150)
panelBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
panelBackground.BackgroundTransparency = 0.6
panelBackground.Parent = screenGui

-- Başlık
local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "FR3ST1HACK TROLL PANEL"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.TextSize = 30
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.TextAlign = Enum.TextXAlignment.Center
titleLabel.Parent = panelBackground

-- Çığlık Sesi Butonu
local screamButton = Instance.new("TextButton")
screamButton.Text = "Çığlık Sesi Çal"
screamButton.Size = UDim2.new(0, 150, 0, 50)
screamButton.Position = UDim2.new(0.5, -75, 0.2, 0)
screamButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
screamButton.TextSize = 20
screamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
screamButton.Parent = panelBackground

screamButton.MouseButton1Click:Connect(function()
    -- Çığlık sesini çal
    local sound = Instance.new("Sound")
    sound.SoundId = soundID
    sound.Parent = character:WaitForChild("Head")  -- Sesin kafa kısmında çalmasını sağla
    sound:Play()  -- Ses çal
end)

-- Korkunç Yüz Göster Butonu
local decalButton = Instance.new("TextButton")
decalButton.Text = "Korkunç Yüz Göster"
decalButton.Size = UDim2.new(0, 150, 0, 50)
decalButton.Position = UDim2.new(0.5, -75, 0.4, 0)
decalButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
decalButton.TextSize = 20
decalButton.TextColor3 = Color3.fromRGB(255, 255, 255)
decalButton.Parent = panelBackground

decalButton.MouseButton1Click:Connect(function()
    -- Korkunç yüz ekle
    local decal = Instance.new("Decal")
    decal.Texture = decalID
    decal.Parent = character:WaitForChild("Head")  -- Kafaya decal ekle
    wait(1)  -- 1 saniye sonra decal'ı kaldır
    decal:Destroy()
end)

-- Avatarınızı Ekranda Spamlamak Butonu
local spamButton = Instance.new("TextButton")
spamButton.Text = "Avatar Spamla"
spamButton.Size = UDim2.new(0, 150, 0, 50)
spamButton.Position = UDim2.new(0.5, -75, 0.6, 0)
spamButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
spamButton.TextSize = 20
spamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spamButton.Parent = panelBackground

spamButton.MouseButton1Click:Connect(function()
    -- Avatar spamla
    game:GetService("RunService").Heartbeat:Connect(function()
        -- Ekranda her oyuncuya bu görseli spamla
        local sticker = Instance.new("Decal")  -- Sticker oluştur
        sticker.Texture = decalID  -- Korkunç resim buraya ekleniyor
        sticker.Parent = game.Workspace  -- Bunu oyun dünyasına ekle
        sticker.Position = Vector3.new(math.random(-50, 50), math.random(50, 100), math.random(-50, 50))  -- Ekranın rastgele yerlerinde görünmesini sağlar
        wait(0.5)  -- Her yarım saniyede bir yeni sticker oluşturulur
    end)
end)

-- Chat Spam (FR3ST1 JOINED THE GAME) Butonu
local chatButton = Instance.new("TextButton")
chatButton.Text = "Chat Spam Başlat"
chatButton.Size = UDim2.new(0, 150, 0, 50)
chatButton.Position = UDim2.new(0.5, -75, 0.8, 0)
chatButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
chatButton.TextSize = 20
chatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
chatButton.Parent = panelBackground

chatButton.MouseButton1Click:Connect(function()
    -- Chat spam başlat
    while true do
        game:GetService("Chat"):Chat(player.Character, "FR3ST1 JOINED THE GAME")
        wait(2)  -- Her 2 saniyede bir mesaj gönderecek
    end
end)
