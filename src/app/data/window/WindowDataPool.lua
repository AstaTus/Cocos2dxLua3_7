local WindowDataPool = class("WindowDataPool")

WindowDataPool.singleton_ = nil
WindowDataPool.groups_ = nil
WindowDataPool.windows_ = nil
function WindowDataPool:ctor()
    WindowDataPool.groups_ = {}
    WindowDataPool.windows_ = {}
end

function WindowDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = WindowDataPool.new()
    end

    return self.singleton_
end

function WindowDataPool:getGroupWindows(id)
    if self.groups_[templete.name] ~= nil then
        return self.groups_[templete.name]        
    end

    return nil
end

function WindowDataPool:addWindowTemplete(templete)
    self.windows_[templete.id_] = templete

    self.groups_[templete.group_] = self.groups_[templete.group_] or {}
    local group = self.groups_[templete.group_]
    group[#group + 1] = templete.name_
end

return WindowDataPool