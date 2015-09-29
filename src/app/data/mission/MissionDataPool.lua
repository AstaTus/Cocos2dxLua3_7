local MissionDataPool = class("MissionDataPool")

MissionDataPool.singleton_ = nil
MissionDataPool.missions_ = {}

function MissionDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = MissionDataPool.new()
    end

    return self.singleton_
end

function MissionDataPool:ctor()

end

function MissionDataPool:addMissiontTemplete(templete)
    self.missions_[templete.id_] = templete
end

function MissionDataPool:getMissionTemplete(id)
    return self.missions_[id]
end

return MissionDataPool
