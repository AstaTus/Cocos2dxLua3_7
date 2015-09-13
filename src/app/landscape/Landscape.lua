local LandscapeLayer = import(".LandscapeLayer")

local Landscape = class("Landscape", function()
    return display.newLayer()
end)

Landscape.data_ = nil
Landscape.layers_ = nil
function Landscape:ctor(data)
    self.data_ = data
    self:init()
end

function Landscape:dispose()
end

function Landscape:init()
    self.layers_ = {}
    for i, layer_data in ipairs(self.data_.layer_datas_) do
        local layer = LandscapeLayer.new(layer_data)
        layer:init()
        self:addChild(layer)

    end
end

return Landscape