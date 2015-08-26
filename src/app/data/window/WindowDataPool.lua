local WindowDataPool = class("WindowDataPool")

WindowDataPool.singleton_ = nil
WindowDataPool.groups_ = nil

function WindowDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = WindowDataPool.new()
    end
end

return WindowDataPool