local XMLNode = class("XMLNode")
XMLNode.___value = nil
XMLNode.___name = nil
XMLNode.___children = nil
XMLNode.___props = nil

function XMLNode:ctor(name)
    self.___value = nil
    self.___name = nil
    self.___children = nil
    self.___props = nil
end

function XMLNode:value() return self.___value end
function XMLNode:setValue(val) self.___value = val end
function XMLNode:name() return self.___name end
function XMLNode:setName(name) self.___name = name end
function XMLNode:children() return self.___children end
function XMLNode:numChildren() return #self.___children end
function XMLNode:addChild(child)
    if self[child:name()] ~= nil then
        if type(self[child:name()].name) == "function" then
            local tempTable = {}
            table.insert(tempTable, self[child:name()])
            self[child:name()] = tempTable
        end
        table.insert(self[child:name()], child)
    else
        self[child:name()] = child
    end
    table.insert(self.___children, child)
end

function XMLNode:properties() return self.___props end
function XMLNode:numProperties() return #self.___props end
function XMLNode:addProperty(name, value)
    local lName = "@" .. name
    if self[lName] ~= nil then
        if type(self[lName]) == "string" then
            local tempTable = {}
            table.insert(tempTable, self[lName])
            self[lName] = tempTable
        end
        table.insert(self[lName], value)
    else
        self[lName] = value
    end
    table.insert(self.___props, { name = name, value = self[name] })
end
