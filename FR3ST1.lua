local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- GUI Oluştur
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "FR3ST1_GUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 240)
frame.Position = UDim2.new(0, 20, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "FR3ST1 TROLL PANEL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

local function createButton(text, posY, callback)
	local button = Instance.new("TextButton", frame)
	button.Size = UDim2.new(1, -20, 0, 40)
	button.Position = UDim2.new(0, 10, 0, posY)
	button.Text = text
	button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.SourceSans
	button.TextSize = 18
	button.MouseButton1Click:Connect(callback)
end

-- 1. Sticker Spam
local function spamStickers()
	local char = player.Character or player.CharacterAdded:Wait()
	for i = 1, 5 do
		local clone = char:Clone()
		clone.Parent = workspace
		for _, p in ipairs(clone:GetDescendants()) do
			if p:IsA("BasePart") then
				p.Anchored = true
				p.CanCollide = false
			end
		end
		local rayOrigin = char:FindFirstChild("Head").Position
		local rayDirection = Vector3.new(math.random(-50,50), math.random(-10,10), math.random(-50,50))
		local raycastParams = RaycastParams.new()
		raycastParams.FilterDescendantsInstances = {char}
		raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
		local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
		if result and result.Instance then
			clone:SetPrimaryPartCFrame(CFrame.new(result.Position + result.Normal * 0.5) * CFrame.Angles(0, math.rad(math.random(360)), 0))
		end
	end
end

-- 2. Jumpscare
local function jumpscare()
	local img = Instance.new("ImageLabel", gui)
	img.Size = UDim2.new(1, 0, 1, 0)
	img.Image = "rbxassetid://11254794387"
	img.BackgroundTransparency = 1

	local sound = Instance.new("Sound", Workspace)
	sound.SoundId = "rbxassetid://4590657391"
	sound.Volume = 10
	sound:Play()

	task.delay(3, function()
		img:Destroy()
	end)
end

-- 3. Map Düşür
local function crashMap()
	for _, part in ipairs(Workspace:GetDescendants()) do
		if part:IsA("BasePart") and part.Anchored and not part:IsDescendantOf(player.Character) then
			part.Anchored = false
		end
	end
end

-- 4. Fake Ban Mesajı
local function fakeBan()
	local banGui = Instance.new("TextLabel", gui)
	banGui.Size = UDim2.new(0.6, 0, 0.3, 0)
	banGui.Position = UDim2.new(0.2, 0, 0.35, 0)
	banGui.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	banGui.Text = "You have been banned by Tubers_93"
	banGui.TextColor3 = Color3.new(1, 1, 1)
	banGui.TextSize = 24
	banGui.Font = Enum.Font.SourceSansBold
	wait(4)
	banGui:Destroy()
end

-- Butonları GUI’ye ekle
createButton("Sticker Spam", 40, spamStickers)
createButton("Jumpscare", 90, jumpscare)
createButton("Map Düşür", 140, crashMap)
createButton("Fake Ban", 190, fakeBan)
