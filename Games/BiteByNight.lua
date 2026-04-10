


local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local loop = LoopManager().new

AutoGen = Legit:CreateToggle({
    Name = "Auto Gen",
    Callback = function(state) 
       if state then
            loop:AddTask('AutoGen',function()
                
                local Gui = PlayerGui:FindFirstChild("Gen")
		
                if Gui then
					local eventPath = PlayerGui:FindFirstChild("Gen"):FindFirstChild("GeneratorMain"):FindFirstChild("Event")

                    wait(4)
		            local args = {	
    	            {
                     Wires = true,
                     Switches = true,
                     Lever = true
    	            }
	             }

                eventPath:FireServer(unpack(args))
               Gui:Destroy()
                end
            end)
        else
            loop:Destroy()
            loop = LoopManager.new()
       end
    end

})
