local player = game.Players.LocalPlayer
local screenGui = script.Parent

-- Proteksi wait agar script tidak error jika UI telat loading
local toggleBtn = screenGui:WaitForChild("ToggleBtn", 10)
local menuFrame = screenGui:WaitForChild("MenuFrame", 10)

if not toggleBtn or not menuFrame then
    warn("Gagal menemukan ToggleBtn atau MenuFrame! Periksa nama/posisi UI Anda.")
    return
end

local TeleportLocations = {
    ["Fisherman Island"] = Vector3.new(-33, 10, 2770),
    ["Traveling Merchant"] = Vector3.new(-135, 2, 2764),
    ["Kohana"] = Vector3.new(-626, 16, 588),
    ["Kohana Lava"] = Vector3.new(-594, 59, 112),
    ["Esoteric Island"] = Vector3.new(1991, 6, 1390),
    ["Esoteric Depths"] = Vector3.new(3240, -1302, 1404),
    ["Tropical Grove"] = Vector3.new(-2132, 53, 3630),
    ["Coral Reef"] = Vector3.new(-3138, 4, 2132),
    ["Weather Machine"] = Vector3.new(-1517, 3, 1910),
    ["Sisyphus Statue"] = Vector3.new(-3657, -134, -963),
    ["Treasure Room"] = Vector3.new(-3604, -284, -1632),
    ["Ancient Jungle"] = Vector3.new(1463, 8, -358),
    ["Ancient Ruin"] = Vector3.new(6067, -586, 4714),
    ["Sacred Temple"] = Vector3.new(1476, -22, -632),
    ["Crater Island"] = Vector3.new(1070, 2, 5102),
    ["Pirate Cove"] = Vector3.new(3400, 4, 3458),
    ["Underground Cellar"] = Vector3.new(2135, -91, -700),
    ["Crystal Cove"] = Vector3.new(5729, -905, 15412),
}

menuFrame.Visible = false
toggleBtn.Text = "Open Teleport Menu"

toggleBtn.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
    if menuFrame.Visible then
        toggleBtn.Text = "Close Menu"
    else
        toggleBtn.Text = "Open Teleport Menu"
    end
end)

local function teleportTo(position)
    local character = player.Character or player.CharacterAdded:Wait()
    if character then
        -- Menggunakan PivotTo karena lebih stabil untuk LocalScript bawaan game/exploit
        character:PivotTo(CFrame.new(position + Vector3.new(0, 3, 0)))
    end
end

for locationName, coordinates in pairs(TeleportLocations) do
    local locationBtn = Instance.new("TextButton")
    locationBtn.Name = locationName
    locationBtn.Text = locationName
    locationBtn.Size = UDim2.new(1, 0, 0, 40)
    locationBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    locationBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    locationBtn.Font = Enum.Font.SourceSansBold
    locationBtn.TextSize = 16
    locationBtn.Parent = menuFrame
    
    locationBtn.MouseButton1Click:Connect(function()
        teleportTo(coordinates)
        menuFrame.Visible = false
        toggleBtn.Text = "Open Teleport Menu"
    end)
end
