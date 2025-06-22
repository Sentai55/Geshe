--[[ GUI Setup ]]
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Name = "TeleportGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 150, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 20
ToggleButton.Text = "Start Teleport"

--[[ Teleport Logic ]]
local positions = {
    Vector3.new(-4, -3, -186),
    Vector3.new(7, 2, -20)
}

local teleporting = false
local player = game.Players.LocalPlayer
local hrp = nil

local function teleportLoop()
    while teleporting do
        for _, pos in ipairs(positions) do
            if not teleporting then return end
            if hrp then
                hrp.CFrame = CFrame.new(pos)
            end
            wait(0.01)
        end
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    teleporting = not teleporting
    ToggleButton.Text = teleporting and "Stop Teleport" or "Start Teleport"

    if teleporting then
        local char = player.Character or player.CharacterAdded:Wait()
        hrp = char:WaitForChild("HumanoidRootPart")
        teleportLoop()
    end
end)
