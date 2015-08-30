local WindowDef = import(".WindowDef")

local BaseWindow = class("BaseWindow")

BaseWindow.root_ = nil
BaseWindow.parent_ = nil
BaseWindow.is_forever_exist_ = false --不会被卸载
BaseWindow.load_state_ = WindowDef.UNLOAD

function BaseWindow:ctor(sheet, winType, layer, forever)
    self.parent_ = sheet:getChildByName(layer)
    self.is_forever_exist_ = forever


end

--在load之后调用
function BaseWindow:init()
    
end

function BaseWindow:show()
    if self.root_ ~= nil and self.parent_ ~= nil and self.root_.getParent() ~= self.parent_ then
        self.parent_.addChild(self.root_)
    end
end

function BaseWindow:hide()
    if self.root_ ~= nil and self.parent_ ~= nil and self.root_.getParent() == self.parent_ then
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

	local nodes = node:getChildren()
	for _, n in pairs(nodes) do
        local result = self:seekNodeByName(n, name)
		if result ~= nil then
            return result
        end
	end

	return nil    
end

return BaseWindow