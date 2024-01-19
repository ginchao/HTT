local plraid = game.Players.LocalPlayer
function Teleport(pos) 
	if not plraid.Character then 
		return
	end
	if not plraid.Character:FindFirstChild("HumanoidRootPart") then return end
	plraid.Character.HumanoidRootPart.CFrame = pos
end
function QuayNgang(pos,quaylen) 
	if quaylen then 
	    return CFrame.new(pos.Position)*CFrame.Angles(math.rad(90),0,0)
	end
    return CFrame.new(pos.Position)*CFrame.Angles(math.rad(-90),0,0)
end
local DiscordLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ginchao/Discord-Lib/main/Discord-Lib'))()  
local win = DiscordLib:Window("TestHub")
local serv = win:Server("DragonSea", "")
local drops = serv:Channel("Main")
local dis = nil
drops:Textbox("Khoảng Cách Aura","type",true,function(v)
dis = v
end)
drops:Toggle("Kill Aura [World]",false,function(t)
getgenv().aura= t
if dis == nil then
DiscordLib:Notification("Warning", "Ghi Số Khoảng Cách Aura Trước Khi Dùng", "Ok") 
else
while aura do wait(.1)
for i, v in pairs(game:GetService("Workspace").Npc:GetDescendants()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < math.random(dis) then
pcall(function()
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
v.Humanoid.WalkSpeed = 0
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius", math.huge)
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
for _ = 1,5 do
if v:FindFirstChild("HackerSo1TheGioi") then
local args = {
    [1] = 1,
    [2] = game:GetService("Players").LocalPlayer
}
v.HackerSo1TheGioi.RemoteEvent:FireServer(unpack(args))
else
local args = {
    [1] = 1,
    [2] = game:GetService("Players").LocalPlayer
}
v.Attack.RemoteEvent:FireServer(unpack(args))
end
end
end
end
end)
end
end)
drops:Toggle("Bật Không Delay Đấm Thường",false,function(h)
local UserInputService = game:GetService("UserInputService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
getgenv().cd = h
local tapCount = 0 

UserInputService.TouchTapInWorld:Connect(function(position, processedByUI)
if getgenv().cd then
    local touchPosition = position
    tapCount = tapCount + 1 
for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") then
if v:FindFirstChild("HackerSo1TheGioi") then
    v.HackerSo1TheGioi.RemoteEvent:FireServer(1, game.Players.LocalPlayer, tapCount)
else
v.Attack.RemoteEvent:FireServer(1, game.Players.LocalPlayer, tapCount)
end
end
end
end
end)
end)
drops:Button("Check Item Spawn",function()
local nut =  Instance.new("BindableFunction")
function item(it)
for i, v in pairs(game.Workspace.SpawnItemTime: GetDescendants()) do  
if v:IsA("Tool") and v:FindFirstChild("Handle") then
it = v
end
end
return it
end
function nut.OnInvoke(f)
if f == "Ok" and item() then
for i, v in pairs(game.Workspace.SpawnItemTime: GetDescendants()) do  
if v:IsA("Tool") and v:FindFirstChild("Handle") then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,1) wait()
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
else
print("emo")
end
end
end
end
if item() then
game.StarterGui:SetCore("SendNotification", { 
                 Title = "TestHub", 
                 Text = "Hiện Tại Server Có | "..item().Name.." | Nhặt Không?", 
                 Icon = "", 
                 Duration = 10,
        Callback = nut,
Button1 = "Ok",
Button2 = "No"
             })
else
game.StarterGui:SetCore("SendNotification", { 
                 Title = "TestHub", 
                 Text = "Hiện Tại Server Không Có Item Spawn", 
                 Icon = "", 
                 Duration = 2 })
end
end)
drops:Toggle("Grabtools | Nhặt Item Người Chơi Vứt",false, function(I) 
 getgenv().autograb = I 
 spawn(function() 
 while autograb==true do wait() 
 if not getgenv().autograb then break end 
 local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")         
 for _, child in ipairs(workspace:GetChildren()) do 
 if game.Players.LocalPlayer.Character and child:IsA("BackpackItem") and child:FindFirstChild("Handle") then 
 humanoid:EquipTool(child) 
 end 
 end 
 end 
 end) 
 end) 
local drops = serv:Channel("Raid")
local dis = nil
drops:Textbox("Distance aura","type",true,function(v)
dis = v
end)
drops:Toggle("Kill Aura [Raid]",false,function(t)
getgenv().aura= t
if dis == nil then
DiscordLib:Notification("Warning", "?", "Ok") 
else
while aura do wait(.1)
for i, v in pairs(game:GetService("Workspace").SpawnEnemy:GetDescendants()) do
if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude < math.random(dis) then
pcall(function()
v.Humanoid.Health = 0
v.HumanoidRootPart.CanCollide = false
v.Humanoid.WalkSpeed = 0
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius", math.huge)
end)
end
end
end
end
end)
drops:Button("Teleport To Raid",function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["5 Player"].Gate.Fade.WorldPivot
end)
drops:Seperator()
local wp= nil
local wpli= {}
for i, c in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if c:IsA("Tool") and c:FindFirstChild("HackerSo1TheGioi") then
table.insert(wpli,c.Name)
end
end
local rs = drops:Dropdown("Weapon",wpli,function(h)
wp = h
end)
drops:Button("Refresh",function()
rs:Clear()
for i, c in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if c:IsA("Tool") and c:FindFirstChild("HackerSo1TheGioi") then
rs:Add(c.Name)
end
end
end)
drops:Toggle("Auto [Raid]",false,function(c)
local plr= game.Players.LocalPlayer.Character
if wp == nil then
DiscordLib:Notification("Warning","Choose Weapon","Ok")
else
getgenv().raid = c
while raid do wait()
pcall(function()
for i, v in pairs(game.Workspace.SpawnEnemy:GetChildren()) do
if v:IsA("Folder") then
for i, h in pairs(v:GetChildren()) do
for i, g in pairs(v:GetChildren()) do
if h.Humanoid.Health > 0 then
h.HumanoidRootPart.CFrame = g.HumanoidRootPart.CFrame
h.Humanoid.WalkSpeed = 0
Teleport(QuayNgang(h.HumanoidRootPart.CFrame+Vector3.new(0,9,0)))
for i, c in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if c:IsA("Tool") and c.Name == wp then
for _ = 1,1 do
local args = {
    [1] = 1,
    [2] = game:GetService("Players").LocalPlayer
}
c.HackerSo1TheGioi.RemoteEvent:FireServer(unpack(args))
end
end
end
end
end
end
end
end
end)
end
end
end)
spawn(function()
while wait() do
if getgenv().raid then
game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(wp))
end
end
end)
















        local sldrs = serv:Channel("Walk Speed")   
local spd = nil
    local sldr = sldrs:Slider("Speeds", 0, 1000, 0, function(v)    
_G.speed = v
local function SPDs()
if _G.speed then
pcall(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v    
end)
end
end
spd = game:GetService('RunService').RenderStepped:Connect(SPDs)
    end)    
    sldrs:Button("Speed 1000", function()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 150 or v.WalkSpeed == 70 or v.WalkSpeed == 500 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("1000")    
end
end
end
    end)    
    sldrs:Button("Speed 500", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 150 or v.WalkSpeed == 70 or v.WalkSpeed == 1000 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("500")    
end
end
end
    end)    
sldrs:Button("Speed 150", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 70 or v.WalkSpeed == 500 or v.WalkSpeed == 1000 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("150")    
end
end
end
    end)    
    sldrs:Button("Speed 70", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 30 or v.WalkSpeed == 150 or v.WalkSpeed == 500 or v.WalkSpeed == 1000 then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("70")    
end
end
end
    end)    
    sldrs:Button("Speed 30", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.WalkSpeed == 1000 or v.WalkSpeed == 150 or v.WalkSpeed == 70 or v.WalkSpeed == 500  then
DiscordLib: Notification("Warning","Please Clear Speed","Ok")
else
    sldr:Change("30")    
end
end
end
     end)    
sldrs:Button("Clear Speed", function(v)    
  spd:Disconnect()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
    local jm = nil
    local sldr = sldrs:Slider("JumpPower", 0, 1000, 0, function(v)    
_G.jpm = v
local function JPMs()
if _G.jpm then
pcall(function()
game.Players.LocalPlayer.Character.Humanoid.JumpPower = v    
end)
end
end
jm = game:GetService('RunService').RenderStepped:Connect(JPMs)    
end)    
    sldrs:Button("Jump 1000", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 100 or v.JumpPower == 300 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("1000")    
end
end
end
    end)    
    sldrs:Button("Jump 500", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 100 or v.JumpPower == 300 or v.JumpPower == 1000  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("500")    
end
end
end
    end)    
    sldrs:Button("Jump 300", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 100 or v.JumpPower == 1000 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("300")    
end
end
end
    end)    
    sldrs:Button("Jump 100", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 70 or v.JumpPower == 1000 or v.JumpPower == 300 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("100")    
end
end
end
    end)    
    sldrs:Button("Jump 70", function()    
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Humanoid") then
if v.JumpPower == 1000 or v.JumpPower == 100 or v.JumpPower == 300 or v.JumpPower == 500  then
DiscordLib: Notification("Warning","Please Clear Jump","Ok")
else
    sldr:Change("70")    
end
end
end
    end)   
sldrs:Button("Clear Jump", function(v)    
  jm:Disconnect()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 40
end)

  local btns = serv:Channel("More Script")
   btns:Button("Fast Mode", function()   
   local ToDisable = {   
           Textures = true,   
           VisualEffects = true,   
           Parts = true,   
           Particles = true,   
           Sky = true   
   }   

   local ToEnable = {   
           FullBright = false   
   }   

   local Stuff = {}   

   for _, v in next, game:GetDescendants() do   
           if ToDisable.Parts then   
                   if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then   
                           v.Material = Enum.Material.SmoothPlastic   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.Particles then   
                   if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then   
                           v.Enabled = false   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.VisualEffects then   
                   if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then   
                           v.Enabled = false   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.Textures then   
                   if v:IsA("Decal") or v:IsA("Texture") then   
                           v.Texture = ""   
                           table.insert(Stuff, 1, v)   
                   end   
           end   

           if ToDisable.Sky then   
                   if v:IsA("Sky") then   
                           v.Parent = nil   
                           table.insert(Stuff, 1, v)   
                   end   
           end   
   end   

   game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")   

   for i, v in next, ToDisable do   
           print(tostring(i)..": "..tostring(v))   
   end   

   if ToEnable.FullBright then   
       local Lighting = game:GetService("Lighting")   

       Lighting.FogColor = Color3.fromRGB(255, 255, 255)   
       Lighting.FogEnd = math.huge   
       Lighting.FogStart = math.huge   
       Lighting.Ambient = Color3.fromRGB(255, 255, 255)   
       Lighting.Brightness = 5   
       Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)   
       Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)   
       Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)   
       Lighting.Outlines = true   
   end   
   end)  
  btns:Button("Rejoin", function()  
  local tps = game:GetService("TeleportService")  
                  local plr = game:GetService("Players").LocalPlayer  
                  tps:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)  
  end)  
   btns:Button("Reset Character ", function() 
 game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
 end) 
btns:Button("Change Server", function()
local httprequest = request or http_request or (http and http.request) or (fluxus.request and fluxus) or syn.request
PlaceId = game.PlaceId
if httprequest then
                local servers = {}
                local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", PlaceId)})
                local body = game:GetService("HttpService"):JSONDecode(req.Body)
                if body and body.data then
                        for i, v in next, body.data do
                                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                                        table.insert(servers, 1, v.id)
                                end
                        end
                end
                if #servers > 0 then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], game:GetService("Players").LocalPlayer)
                else
                        DiscordLib:Notification("Warning","Không Tìm Được Server, Hãy Thử Lại.","Ok")
end
                end
end) 
 btns:Label("Cre Hub:Grabiel Ynu") 
btns:Textbox("Bug Report", "Type!", true, function(t)
if t then
DiscordLib:Notification("Thông Báo","Tin Nhắn Đã Được Gửi.","Ok")
HttpService = game:GetService("HttpService") 
 Webhook_URL =  "https://discord.com/api/webhooks/1167083350499020841/Iu6pVDxhv8tUDaf-tR4gCt4W8e9YGYfXF46M52uLN4jQHcfvAUJEJIl8bnY4KKu0WTD0" 
 local ok = request or http_request or (http and http.request) or syn.request 
 ok( 
 { 
 Url = Webhook_URL, 
 Method = 'POST', 
 Headers = { 
 ['Content-Type'] = 'application/json' 
 }, 
 Body = HttpService:JSONEncode({ 
 ["content"] = "", 
 ["embeds"] = {{ 
 ["author"] = { 
 ["name"] = "", 
 ["icon"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=100&height=100&format=png" 
 }, 
 ["title"] = "🐛"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, 
 ["description"] = "{ ["..game.Players.LocalPlayer.DisplayName.."] | "..game.Players.LocalPlayer.Name.." } Vừa Báo Lỗi", 
 ["type"] = "rich", 
 ["color"] = tonumber(0xffffff), 
 ["fields"] = { 
 { 
 ["name"] = "Script Join:", 
 ["value"] = "game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')", 
 ["inline"] = true }, 
 { 
 ["name"] = "Người Dùng ID:", 
 ["value"] = game:GetService("Players").LocalPlayer.UserId, 
 ["inline"] = true }, 
 { 
["name"] = "Nội Dung:", 
 ["value"] = t, 
 ["inline"] = true },
 {
 ["name"] = "Số tuổi của Account:", 
 ["value"] = game:GetService("Players").LocalPlayer.AccountAge, 
 ["inline"] = true } 
 } 
 }} 
 }) 
 })
else
DiscordLib:Notification("Thông Báo","Tin Nhắn Chưa Được Gửi Hãy Thử Lại...","Ok..")
end
end)
  btns:Button("Viet Nam Piece", function()   loadstring(game:HttpGet('https://raw.githubusercontent.com/ginchao/Viet-Nam-Piece/main/Beta'))()    
    end)  
 btns:Button("AUT OLD UNIVERSE", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ginchao/OUT-OLD-UNIVERSE/main/UNIVERSE%20OLD" ,true))()  
  end)  
 btns:Button("Lucky Block Battleground", function() 
 loadstring(game:HttpGet('https://raw.githubusercontent.com/ginchao/LuckyBlockBattleground/main/HttVeg'))() 
 end) 
 btns:Button("Sakura Stand", function() 
 loadstring(game:HttpGet('https://raw.githubusercontent.com/ginchao/Sakura-Stand/main/ST'))()  
 end) 
  btns:Seperator()  
btns:Button("Hub ESP",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ginchao/ESP-COPY/main/TY%20FOR%20METHOD"))()
end)
    btns:Button("Infinite Yield", function()  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()  
    end)  
  btns:Button("Anti Afk", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ginchao/Anti-AFK/main/NO%20KICK" ,true))()  
  end)  
  btns:Button("Keyboard", function()  

                         loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()  
      end)           
  btns:Button("FlyV3", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() 
         end)  

  btns:Button("Shift Lock", function()  

          loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/ShiftLockx/main/Shiftlock-MiniNoobie",true))()  
  end) 

  btns:Button("DEX PC", function()  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))()  
  end)  
  btns:Button("DEXv4 PC", function()  
  loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()  
  end)  
  btns:Button("Remote Spy", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/Forked/M%3ASimpleSpy%20V3" ,true))()  
  end)  
  btns:Button("CCTV Camera", function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/CCTV%20Camera"))();  
  end)  
  btns:Button("Invisible X Teleport", function()  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./dbb6ce6f6cee4f7a5c9e20d7b88e83db2a93bf25/Invisible%20GUI'))()  
  end) 