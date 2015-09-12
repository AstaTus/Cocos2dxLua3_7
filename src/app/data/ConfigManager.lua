local DbcFile = import(".DbcFile")
local ConfigEnum = import(".ConfigEnum")


local ConfigManager = class("ConfigManager")

ConfigManager.singleton_ = nil
ConfigManager.parse_callbacks_ = nil
ConfigManager.config_datas_ = nil

function ConfigManager:ctor()
  
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
    local file = DbcFile.new()
	file.openFromTxt(self.config_datas_[ConfigEnum.LoginWindow])

    for i = 1, file.records_num_ do
        local templete = WindowTemplete.new()
        templete.id_ = file.take(i, 1)
        templete.group_ = file.take(i, 2)
        templete.name_ = file.take(i, 3)
    end		
end

function ConfigManager:loadScheme()
    local scheme_zip = cczip.ZipFile:new("res/config/scheme.pak", "")
    local data = scheme_zip:getFileData("window.txt")
    print(data)
end

return ConfigManager