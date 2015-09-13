local LandscapeParser = import(".LandscapeParser")
local Landscape = import(".Landscape")
local LandscapeManager = class("LandscapeManager")

LandscapeManager.singleton_ = nil
LandscapeManager.currLanscape_ = nil
LandscapeManager.parser_ = nil
function LandscapeManager:ctor()
    self.parser_ = LandscapeParser.new()
end

function LandscapeManager:getSingleton()
    if LandscapeManager.singleton_ == nil then
        LandscapeManager.singleton_ = LandscapeManager.new()
    end
    
    return LandscapeManager.singleton_
end

function LandscapeManager:load(name)

    if self.currLanscape_ ~= nil then
        self:unload()
    end

    local landscapeData = self.parser_:parse("lanscape0_0.xml", "res\lanscape")
    self.currLanscape_ = Landscape.new()

end

function LandscapeManager:update(td, offset_x, offset_y)
    if self.currLanscape_ ~= nil then
        self.currLanscape_:update(td, offset_x, offset_y)
    end
end

function LandscapeManager:unload()
    if self.currLanscape_ ~= nil then
        self.currLanscape_:dispose()
        self.currLanscape_ = nil
    end
end
return LandscapeManager