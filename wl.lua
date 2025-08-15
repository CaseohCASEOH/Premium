local blur = Instance.new("BlurEffect", game:GetService("Lighting"))
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local dark = Instance.new("Frame", gui)
local back = Instance.new("Frame", dark)
local corner = Instance.new("UICorner", back)
local text = Instance.new("TextLabel", back)
blur.Size = 0

gui.ClipToDeviceSafeArea, gui.IgnoreGuiInset, gui.ResetOnSpawn, gui.DisplayOrder = false, true, false, math.huge
dark.Size, dark.BackgroundColor3, dark.BackgroundTransparency = UDim2.fromScale(1,1), Color3.new(0,0,0), 1
back.Size, back.Position, back.BackgroundColor3, back.BackgroundTransparency = UDim2.new(0,300,0,70), UDim2.new(0.5,-150,0.5,-35), Color3.fromRGB(25,25,25), 1
text.Size, text.BackgroundTransparency, text.TextScaled, text.Font, text.TextTransparency, text.TextColor3, text.Text = UDim2.fromScale(1,1), 1, true, Enum.Font.GothamBold, 1, Color3.fromRGB(255,80,80), "Verifying"

game:GetService("TweenService"):Create(blur, TweenInfo.new(2), {Size=24}):Play()
game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(2), {FieldOfView=50}):Play()
game:GetService("TweenService"):Create(dark, TweenInfo.new(2.5), {BackgroundTransparency=0.2}):Play()
game:GetService("TweenService"):Create(back, TweenInfo.new(2.5), {BackgroundTransparency=0.3}):Play()
game:GetService("TweenService"):Create(text, TweenInfo.new(2.5), {TextTransparency=0}):Play()

local run = true
task.spawn(function()
	while run do
		local t = tick()*2
		text.TextColor3 = Color3.fromRGB((math.sin(t)*0.5+0.5)*255,0,(math.cos(t)*0.5+0.5)*255)
		task.wait(0)
	end
end)

task.wait(5+math.random(0,2))
run = false

local f,d="wl.key",(gethwid():gsub(".",function(c)return("%02x"):format(c:byte())end))
if not isfile(f) then writefile(f,d)
elseif readfile(f)~=d then game.Players.LocalPlayer:Kick("Error 243") writefile(f,d) end
if not({["65373932636264616534386639636138373637323034346638633434336434656435646533623835316430313935303032616235643133656466353434396366"]=true})[readfile(f)] then game.Players.LocalPlayer:Kick("Error 233") end
local wl = { [f] = true }

if not wl[f] then
	text.Text = "Unverified"
	game:GetService("TweenService"):Create(text, TweenInfo.new(1.5), {TextColor3=Color3.fromRGB(255,120,120)}):Play()
	task.wait(2)
	game.Players.LocalPlayer:Kick("Pay Premium At Discord.gg/hnq9AGVMwq")
	return
end

text.Text = "Verified"
game:GetService("TweenService"):Create(text, TweenInfo.new(1.5), {TextColor3=Color3.fromRGB(100,200,255)}):Play()
task.wait(2)
game:GetService("TweenService"):Create(dark, TweenInfo.new(2.5), {BackgroundTransparency=1}):Play()
game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(2.5), {FieldOfView=70}):Play()
game:GetService("TweenService"):Create(blur, TweenInfo.new(2.5), {Size=0}):Play()
task.wait(2.5)
gui:Destroy()
blur:Destroy()
