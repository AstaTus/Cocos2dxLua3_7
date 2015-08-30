local BaseWindowManager = class("BaseWindowManager")

BaseWindowManager.singleton_ = nil
BaseWindowManager.group_ = nil
BaseWindowManager.window_classes_ = {}
BaseWindowManager.window_instances_ = {}

BaseWindowManager.scene_root_ = nil
BaseWindowManager.top_root_ = nil
BaseWindowManager.middle_root_ = nil
BaseWindowManager.bottom_root_ = nil

function BaseWindowManager:ctor()
    self.top_root_ = display.newNode()
    self.middle_root_ = display.newNode()
    self.bottom_root_ = display.newNode()
end

function BaseWindowManager:resetScene(scene_root)
    if self.scene_root_ ~= nil then
        if self.scene_root_ ~= scene_root then
            self.bottom_root_.removeSelf()
            self.middle_root_.removeSelf()
            self.top_root_.removeSelf()
        else
            return
        end
    end

    self.scene_root_ = scene_root
    self.scene_root_.addChild(self.bottom_root_)
    self.scene_root_.addChild(self.middle_root_)
    self.scene_root_.addChild(self.top_root_)
end


function BaseWindowManager:show(name)
    local win = self.window_instances_[name]
    if win ~= nil then
        win.show()
    end
end

function BaseWindowManager:hide(name)
    local win = self.window_instances_[name]
    if win  ~= nil then
        win.hide()
    end
end

function BaseWindowManager:loadWindows(group, interval_callback, over_callback)
    local windows = WindowDataPool:getSingleton():getGroupWindows(group)
    for i = 1, i < #windows do
        local templete = windows[i]
        if self.window_instances_[templete.name_]  == nil then
            if self.window_classes_[templete.name_] ~= nil then
                self.window_instances_[templete.name_] = self.window_classes_[templete.name_].new()
            else
                print("BaseWindowManager:loadWindows "..win.name_ .. " is not exist")
                error()
            end
        end

        self.window_instances_[templete.name_]:load()
    end
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