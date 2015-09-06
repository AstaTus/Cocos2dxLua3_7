local LandscapeManager = class("LandscapeManager")

LandscapeManager.singleton_ = nil
LandscapeManager.currLanscape_ = nil

function LandscapeManager:ctor()

end

function LandscapeManager:getSingleton()
    if LandscapeManager.singleton_ == nil then
        LandscapeManager.singleton_ = LandscapeManager.new()
    end
    
    return LandscapeManager.singleton_
end

function LandscapeManager:load()

end

function LandscapeManager:unload()

end
return LandscapeManager