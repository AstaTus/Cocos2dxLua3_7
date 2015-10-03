local SceneSwitcher = class("SceneSwitcher")

SceneSwitcher.singleton_ = nil
SceneSwitcher.scenes_ = {}
function SceneSwitcher:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = SceneSwitcher.new()
    end

    return self.singleton_
end

function SceneSwitcher:ctor()

end

function SceneSwitcher:registerScene(name, class)
    if self.scenes_
end

function SceneSwitcher:switch(name, args)
    
end

return SceneSwitcher