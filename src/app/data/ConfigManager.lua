---关联所有的配置表
---类型分两种：1.开始时加载,并且一直存在,scheme配置表
             --2.过程中加载,用完之后需要卸载

local DbcFile = import(".DbcFile")
local ConfigEnum = import(".ConfigEnum")


local ConfigManager = class("ConfigManager")

ConfigManager.singleton_ = nil
ConfigManager.parse_callbacks_ = {}
ConfigManager.config_datas_ = {}

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
    self.parse_callbacks_[#self.parse_callbacks_ + 1] = function() self:parseMissionConfig() end
end

function ConfigManager:parseWindowConfig()
    local file = DbcFile.new()
	file:openFromTxt(self.config_datas_[ConfigEnum.WINDOW_CONFIG])

    for i = 1, file.records_num_ do
        local templete = WindowTemplete.new()
        templete.id_ = file:take(i, 1)
        templete.group_ = file:take(i, 2)
        templete.name_ = file:take(i, 3)
        WindowDataPool:getSingleton():addWindowTemplete(templete)
    end
end

function ConfigManager:parseMissionConfig()
    local file = DbcFile.new()
	file:openFromTxt(self.config_datas_[ConfigEnum.MISSION_CONFIG])

    for i = 1, file.records_num_ do
        local templete = MissionTemplete.new()
        templete.chapterId_ = file:take(i, 1)
        templete.missionId_ = file:take(i, 2)
        templete.map_ = file:take(i, 3)

        --bullet
        for j = 1, 10 do
            if file:take(i, 3 + j) ~= 0 then
                templete.bullets_[#templete.bullets_ + 1] = file:take(i, 3 + j)
            else
                break
            end
        end

        --condition
        for j = 1, 2 do
            if file:take(i, 13 + j) ~= 0 then
                templete.conditions_[#templete.conditions_ + 1] = file:take(i, 13 + j)
            else
                break
            end
        end

        --board
        for j = 1, 4 do
            templete.boarders_[#templete.boarders_ + 1] = file:take(i, 15 + j)
        end

        MissionDataPool:getSingleton().addMissiontTemplete(templete)
    end
end

function ConfigManager:parseIcecubeConfig()
end

function ConfigManager:parseConditionConfig()
end

function ConfigManager:parseBulletConfig()
end

function ConfigManager:parseBoardConfig()

end

function ConfigManager:loadScheme()
    local scheme_zip = cczip.ZipFile:new("res/config/scheme.pak", "")
    --可否遍历
    local file_name = scheme_zip:getFirstFilename()
    while file_name ~= "" do
        self.config_datas_[file_name] = scheme_zip:getFileData(file_name)
        file_name = scheme_zip:getNextFilename()
    end
    --self.config_datas_[ConfigEnum.WINDOW_CONFIG] = scheme_zip:getFileData(ConfigEnum.WINDOW_CONFIG)
    --self.config_datas_[ConfigEnum.MISSION_CONFIG] = scheme_zip:getFileData(ConfigEnum.MISSION_CONFIG)
    -- 之后放到scene里
    for i = 1, self:getConfigSize() do
        self:parseConfig(i)
    end
end

return ConfigManager