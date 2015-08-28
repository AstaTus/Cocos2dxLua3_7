local BaseWindow = class("BaseWindow")

BaseWindow.root_ = nil
BaseWindow.sheet_ = nil

function BaseWindow:ctor(sheet, winType, layer)
    self.sheet_ = sheet
end

--在load之后调用
function BaseWindow:init()

end

function BaseWindow:show()
    if self.root_ ~= nil and self.sheet_ ~= nil and self.root_.getParent() ~= self.sheet_ then
        self.sheet_.addChild(self.root_)
    end
end

function BaseWindow:hide()
    if self.root_ ~= nil and self.sheet_ ~= nil and self.root_.getParent() == self.sheet_ then
        self.root_.removeSelf()
    end
end

function BaseWindow:update(type, params)
end



function BaseWindow:load()
    self.root_ = cc.CSLoader:createNode(self.__cname, "window/"..self.__cname)
    self:init()
end

function BaseWindow:unload()
end

function BaseWindow:seekNodeByName(root, name)
    if root == nil then
		return nil
    end

	if root:getName() == name then
		return root
    end

	local nodes = root:getChildren();
	for node in nodes do
        local result = self:seekFromRootByName(node, name);
		if result ~= nil then
            return result
        end
	end

	return nil    
end

return BaseWindow