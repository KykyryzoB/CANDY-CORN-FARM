
if not game:IsLoaded() then
    game.Loaded:Wait()
end
if not game.Players.LocalPlayer.Character:FindFirstChild("entered") then
    repeat task.wait()
        workspace.Lobby.Teleport1.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    until game.Players.LocalPlayer.Character:FindFirstChild("entered")
end
for i,v in ipairs(workspace.CandyCorns:GetChildren()) do
    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game:GetService("VirtualInputManager"):SendKeyEvent(true,"W",false,x)
end
local serverList = {}
for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
	if v.playing and type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
		serverList[#serverList + 1] = v.id
	end
end
if #serverList > 0 then
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverList[math.random(1, #serverList)])
else
    error("No servers found")
end
