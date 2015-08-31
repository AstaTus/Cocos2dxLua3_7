local LandscapeManager = class("LandscapeManager")

LandscapeManager.singleton_ = nil


function LandscapeManager:ctor()

end

function LandscapeManager:getSingleton()
    if LandscapeManager.singleton_ == nil then
        LandscapeManager.singleton_ = LandscapeManager.new()
    end
    
    return LandscapeManager.singleton_
end

return LandscapeManager