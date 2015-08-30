local SceneSwitcher = class("SceneSwitcher")

SceneSwitcher.singleton_ = nil

function SceneSwitcher:ctor()
end

function SceneSwitcher:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = SceneSwitcher.new()
    end

    return self.singleton_
end


return SceneSwitcher