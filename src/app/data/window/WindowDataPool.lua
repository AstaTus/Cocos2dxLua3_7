local WindowDataPool = class("WindowDataPool")

WindowDataPool.singleton_ = nil
WindowDataPool.groups_ = {}
WindowDataPool.windows_ = {}
function WindowDataPool:ctor()
    
end

function WindowDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = WindowDataPool.new()
    end

    return self.singleton_
end

function WindowDataPool:getGroupWindows(id)
    if self.groups_[id] ~= nil then
        return self.groups_[id]        
    end

    return nil
end

function WindowDataPool:addWindowTemplete(templete)
    self.windows_[templete.id_] = templete

    self.groups_[templete.group_] = self.groups_[templete.group_] or {}
    local group = self.groups_[templete.group_]
    group[#group + 1] = templete
end

return WindowDataPool