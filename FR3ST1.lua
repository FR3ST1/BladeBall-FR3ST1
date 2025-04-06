-- FNaF Çığlık Sesi (Jumpscare)
local soundID = "rbxassetid://163800183"  -- Çığlık sesi ID'si
local decalID = "rbxassetid://14836741393"  -- Korkunç yüz ID'si

-- Tüm oyunculara ses çalınması
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Çığlık sesini tüm oyuncularda çal
        local sound = Instance.new("Sound")
        sound.SoundId = soundID
        sound.Parent = character:WaitForChild("Head")  -- Sesin kafa kısmında çalmasını sağla
        sound:Play()  -- Ses çal
        
        -- Korkunç yüz (Decal) eklenmesi
        local decal = Instance.new("Decal")
        decal.Texture = decalID
        decal.Parent = character:WaitForChild("Head")  -- Kafaya decal ekle
        wait(1)  -- 1 saniye sonra decal'ı kaldır
        decal:Destroy()
    end)
end)

-- Avatarınızı ekranda spamlamak
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

-- Blokların düşmesi
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Düşme etkisini ekle
        local part = Instance.new("Part")  -- Yeni bir parça oluştur
        part.Size = Vector3.new(5, 1, 5)  -- Parçanın boyutlarını ayarla
        part.Position = Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))  -- Yüksekten düşmesini sağla
        part.Anchored = false  -- Parçanın düşmesini sağla
        part.Parent = game.Workspace
        wait(2)  -- 2 saniye sonra düşen blok
        part:Destroy()  -- Blok düştükten sonra yok olsun
    end)
end)

-- Oyuncuları uçurma
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)  -- Kuvveti ayarla
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Yukarıya doğru uçur
        bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
        wait(2)
        bodyVelocity:Destroy()  -- 2 saniye sonra uçurmayı durdur
    end)
end)

-- Chat Spam (Mesaj spam)
game:GetService("Chat"):Chat(game.Players.LocalPlayer.Character, "FR3ST1 JOINED THE GAME")  -- "FR3ST1" ismi buraya eklenmiş

-- FR3ST1 Paneli Görüntüleme (Tüm oyuncular için)
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Ekranda "FR3ST1" ismi herkes için gösterilecek
        local playerGui = player:WaitForChild("PlayerGui")
        local screenGui = Instance.new("ScreenGui", playerGui)  -- Yeni bir GUI (ekran paneli) oluşturuyoruz
        local textLabel = Instance.new("TextLabel")  -- TextLabel (yazı etiketi) oluştur
        textLabel.Parent = screenGui  -- GUI'ye ekle
        textLabel.Text = "FR3ST1"  -- Panelde görünen yazı
        textLabel.TextSize = 40  -- Yazı büyüklüğü
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Kırmızı renk
        textLabel.Position = UDim2.new(0.5, -50, 0.1, 0)  -- Ortada ve üst kısımda
        textLabel.Size = UDim2.new(0, 100, 0, 50)  -- Boyutlandırma
        textLabel.BackgroundTransparency = 1  -- Arka planı şeffaf yap
    end)
end)
