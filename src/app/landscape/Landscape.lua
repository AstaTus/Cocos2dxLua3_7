local Landscape = class("Landscape", function()
    return display.newLayer()
end)

Landscape.data_ = {}
Landscape.width_ = 0
Landscape.height_ = 0
Landscape.name_ = ""
function Landscape:ctor()
end

function Landscape:dispose()
end

return Landscape