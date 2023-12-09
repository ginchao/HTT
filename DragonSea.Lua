
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window("TestHub")
local serv = win:Server("DragonSea", "")
local drops = serv:Channel("Main")
local dis = nil
drops:Textbox("Distance aura","type",true,function(v)
dis = v
end)
drops:Toggle("Kill Aura For Raid",false,function(t)
getgenv().aura= t
if dis == nil then
DiscordLib:Notification("Warning", "Choose Player to Teleport Player", "Ok") 
else
while aura do wait(.1)
for i, v in pairs(workspace:GetDescendants()) do
if v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name and v.Humanoid.Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < math.abs(dis) then
pcall(function()
repeat wait(.2)
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius", math.huge)
until v.Humanoid.Health <= 0 or auto == false
end)
end
end
end
end
end)
drops:Toggle("Fast Attack",false,function(v)
getgenv().fastattack = v
while fastattack do task.wait()
pcall(function()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
if game.PlaceId == 13373351184 then
local args = {
    [1] = 1,
    [2] = game:GetService("Players").LocalPlayer
}
v.HackerDepTreai.RemoteEvent:FireServer(unpack(args))
else
local args = {
    [1] = 1,
    [2] = game:GetService("Players").LocalPlayer
}
v.HackerSo1TheGioi.RemoteEvent:FireServer(unpack(args))
end
end
end
end)
end
end)