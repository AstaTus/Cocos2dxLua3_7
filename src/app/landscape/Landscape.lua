local Landscape = class("Landscape", function()
    return display.newLayer()
end)

Landscape.data_ = nil

function Landscape:ctor()
end

return Landscape