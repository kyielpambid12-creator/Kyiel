-- MOVABLE KEY SYSTEM (High Quality)
-- Place this LocalScript inside StarterGui
-- Your Key: KyielXPublic

local KEY = "KyielXPublic"

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "MovableKeySystem"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 330, 0, 170)
frame.Position = UDim2.new(0.5, -165, 0.5, -85)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true  -- IMPORTANT for dragging
frame.Draggable = true  -- Allows movement with mouse
frame.Parent = gui

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 32)
title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.Text = "Key System"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = title

-- Key Box
local box = Instance.new("TextBox")
box.Size = UDim2.new(1, -30, 0, 40)
box.Position = UDim2.new(0, 15, 0, 50)
box.PlaceholderText = "Enter your key..."
box.ClearTextOnFocus = false
box.Text = ""
box.Font = Enum.Font.Gotham
box.TextSize = 18
box.Parent = frame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 10)
boxCorner.Parent = box

-- Submit Button
local submit = Instance.new("TextButton")
submit.Size = UDim2.new(1, -30, 0, 40)
submit.Position = UDim2.new(0, 15, 0, 100)
submit.Text = "Submit"
submit.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
submit.TextColor3 = Color3.new(1,1,1)
submit.Font = Enum.Font.GothamBold
submit.TextSize = 18
submit.Parent = frame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 10)
submitCorner.Parent = submit

-- Status Text
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 1, -22)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.new(1, 0.2, 0.2)
status.Font = Enum.Font.Gotham
status.TextSize = 16
status.Parent = frame


-- Submit Function
submit.MouseButton1Click:Connect(function()
    if box.Text == KEY then
        status.TextColor3 = Color3.fromRGB(0, 255, 100)
        status.Text = "Key Accepted!"

        -- Button animation
        TweenService:Create(submit, TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(80, 180, 80)}
        ):Play()

        wait(0.6)
        gui:Destroy()

        ------------------------------------------------------
        -- YOUR SCRIPT STARTS HERE (only if key is correct)
        ------------------------------------------------------

        print("Your script is unlocked!")

        -- Example loading script:
        -- 
      loadstring(game:HttpGet("https://raw.githubusercontent.com/kyielpambid12-creator/Kyiel/refs/heads/main/5.lua"))()

        ------------------------------------------------------
    else
        status.TextColor3 = Color3.new(1, 0.2, 0.2)
        status.Text = "Invalid Key!"
        
        -- Shake animation for wrong key
        for i = 1, 3 do
            frame.Position = frame.Position + UDim2.new(0, 8, 0, 0)
            wait(0.03)
            frame.Position = frame.Position + UDim2.new(0, -16, 0, 0)
            wait(0.03)
            frame.Position = frame.Position + UDim2.new(0, 8, 0, 0)
            wait(0.03)
        end
    end
end)