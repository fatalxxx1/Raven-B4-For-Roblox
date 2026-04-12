local RunService = game:GetService("RunService")

local LoopManager = {}
LoopManager.__index = LoopManager

function LoopManager.new()
    return setmetatable({tasks = {}}, LoopManager)
end

function LoopManager:AddTask(id, callback, delay, priority)
    if self.tasks[id] then self:RemoveTask(id) end
    self.tasks[id] = {
        callback = callback,
        connection = RunService.Heartbeat:Connect(function(dt)
            pcall(callback, dt)
        end)
    }
end

function LoopManager:RemoveTask(id)
    if self.tasks[id] then
        self.tasks[id].connection:Disconnect()
        self.tasks[id] = nil
    end
end

function LoopManager:Destroy()
    for id in pairs(self.tasks) do self:RemoveTask(id) end
end



return {
    LoopManager = LoopManager,
}
