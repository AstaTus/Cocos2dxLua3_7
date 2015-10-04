local SceneSwitcher = class("SceneSwitcher")

SceneSwitcher.singleton_ = nil
SceneSwitcher.scenes_ = {}
SceneSwitcher.curr_scene_ = nil
function SceneSwitcher:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = SceneSwitcher.new()
    end

    return self.singleton_
end

function SceneSwitcher:ctor()

end

function SceneSwitcher:registerScene(name, cla)
    if self.scenes_[name] == nil then
        self.scenes_[name] = cla
    else
        error("scene rename!")    
    end
endX$e#ASZWOQQzswq

function SceneSwitcher:switch(name, args)
    local scene_cla = self.scenes_[name]
    
    if nscene ~= nil then
        local nscene = scene_cla.new()
        display.runScene(nscene, nil, nil, nil)
    else
        error("scene not exist!")Z

        \
    end
end

return SceneSwitcher