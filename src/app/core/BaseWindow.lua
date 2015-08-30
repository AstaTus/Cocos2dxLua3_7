local WindowDef = import(".WindowDef")

local BaseWindow = class("BaseWindow")

BaseWindow.root_ = nil
BaseWindow.sheet_ = nil
BaseWindow.is_forever_exist_ = false --���ᱻж��
BaseWindow.load_state_ = WindowDef.UNLOAD

function BaseWindow:ctor(sheet, winType, layer, forever)
    self.sheet_ = sheet
    self.is_forever_exist_ = forever
end

--��load֮�����
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
    self.root_ = cc.CSLoader:createNode("window/"..self.__cname .."/"..self.__cname ..".csb")
    self:init()
    BaseWindow.load_state_ = WindowDef.LOADED
end

function BaseWindow:unload()
    BaseWindow.load_state_ = WindowDef.UNLOAD
end

function BaseWindow:seekNodeByName(node, name)
    if node == nil then
		return nil
    end

	if node:getName() == name then
		return node
    end

	local nodes = root:getChildren();
	for n in nodes do
        local result = self:seekFromRootByName(n, name);
		if result ~= nil then
            return result
        end
	end

	return nil    
end

return BaseWindow