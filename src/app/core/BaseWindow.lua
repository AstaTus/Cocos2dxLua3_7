local BaseWindow = class("BaseWindow")
BaseWindow.root_ = nil

function BaseWindow:ctor()

end

function BaseWindow:init()

end

function BaseWindow:show()

end

function BaseWindow:hide()
end



function BaseWindow:load()
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