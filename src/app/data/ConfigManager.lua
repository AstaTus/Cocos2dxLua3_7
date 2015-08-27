local ConfigManager = class("ConfigManager")

ConfigManager.singleton_ = nil
ConfigManager.parse_callbacks_ = nil


function ConfigManager:ctor()
    self:initParseCallbacks()
end

function ConfigManager:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = ConfigManager.new()
    end

    return self.singleton_
end

function ConfigManager:getConfigSize()
    return #self.parse_callbacks_
end

function ConfigManager:parseConfig(index)
    self.parse_callbacks_[index]()
end

function ConfigManager:initParseCallbacks()
    self.parse_callbacks_[#self.parse_callbacks_ + 1] = function() self:parseWindowConfig() end
end

function ConfigManager:parseWindowConfig()
end

return ConfigManager