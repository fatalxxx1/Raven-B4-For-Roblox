


local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")




local loop = LoopManager().new
AutoGen = Legit:CreateToggle({
    Name = "Auto Gen",
	Animation = false,
    StartingState = true,
    Callback = function(state) 
       
       if state then
        loop:AddTask('sw')
       end
    end
})
