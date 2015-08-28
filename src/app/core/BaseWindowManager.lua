local BaseWindowManager = class("BaseWindowManager")

BaseWindowManager.singleton_ = nil
BaseWindowManager.group_ = nil
BaseWindowManager.window_classes_ = {}
BaseWindowManager.window_instances_ = {}


function BaseWindowManager:ctor()

end


function BaseWindowManager:show(name)

end

function BaseWindowManager:hide(name)

end

function BaseWindowManager:loadWindows(group, interval_callback, over_callback)

end

function BaseWindowManager:unloadWindows(group, interval_callback, over_callback)

end

function BaseWindowManager:getCurrentGroup()
    return self.group_
end

function BaseWindowManager:registerWindow(class_name)
    if self.window_classes_[class_name] == nil then
        self.window_classes_[class_name] = class_name
    end
end

return BaseWindowManager