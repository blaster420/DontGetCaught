--Aim-Viewer
loadstring(game:HttpGet("https://raw.githubusercontent.com/blaster420/source/main/sourceveiwer.lua"))()
--Co-ordinates 
getgenv().VelocityChanger = false
getgenv().Velocity = Vector3.new(500,700,-500)
getgenv().KeyBind = "Z"
--Local
local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character   = LocalPlayer.Character
local RootPart    = Character:FindFirstChild("HumanoidRootPart")


local Heartbeat, RStepped, Stepped = RunService.Heartbeat, RunService.RenderStepped, RunService.Stepped

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
    Character = NewCharacter
end)

local RVelocity, YVelocity = nil, 0.1
--Notifacation Function
function sendnotifi(message)


    game.StarterGui:SetCore("SendNotification", {
        Title = 'CAUGHT GGS';
        Text = message;
        Duration = "1";
    })
    end
--Send Notifacation
    UIS.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode[KeyBind] then
            if VelocityChanger == false then
                sendnotifi("ANTI OFF")
            elseif VelocityChanger == true then
                sendnotifi("ANTI ON")
            end
        end
    end)
--Velocity
UIS.InputBegan:Connect(function(input)
if not (UIS:GetFocusedTextBox()) then
    if input.KeyCode == Enum.KeyCode[KeyBind] then
        if VelocityChanger then
            VelocityChanger = false
        else
            VelocityChanger = true
            task.spawn(function()
                    while VelocityChanger do
                        print("Running")
                        --// this a dumb check
                        if (not RootPart) or (not RootPart.Parent) or (not RootPart.Parent.Parent) then
                            repeat task.wait() RootPart = Character:FindFirstChild("HumanoidRootPart") until RootPart ~= nil
                        else
                            RVelocity = RootPart.Velocity

                            RootPart.Velocity = type(Velocity) == "vector" and Velocity or Velocity(RVelocity)

                            RStepped:wait()

                            RootPart.Velocity = RVelocity
                        end
                    Heartbeat:wait()
                end
            end)
        end
        end
    end
end)
--End