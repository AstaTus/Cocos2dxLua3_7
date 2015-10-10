local UnitManager = class("UnitManager")

UnitManager.singleton_ = nil

UnitManager.bullets_ = {}
UnitManager.boarders_ = {}
UnitManager.icecubes_ = {}

function UnitManager:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = UnitManager.new()
    end

    return self.singleton_
end

function UnitManager:ctor()

end

function UnitManager:createBullet(id, loc, dir)
    local templete = BulletDataPool:getSingleton():getBulletTemplete(id)
    local bullet = nil
    if templete ~= nil then
        bullet = BulletNode.new(templete)
        self.bullets_[#self.bullets_ + 1] = bullet
    end

    return bullet
end

function UnitManager:createBoarder(id, loc)
    local templete = BoarderDataPool:getSingleton():getBoardTemplete(id)
    local boarder = nil
    if templete ~= nil then
        boarder = BoarderNode.new(templete)
        self.boarders_[#self.boarders_ + 1] = boarder
    end

    return boarder
end

function UnitManager:createIcecube(id, loc)
    local templete = IcecubeDataPool:getSingleton():getIcecubeTemplete(id)
    local icecube = nil
    if templete ~= nil then
        icecube = IcecubeNode.new(templete)
        self.icecubes_[#self.icecubes_ + 1] = icecube
    end

    return icecube
end

function UnitManager:clearBullets()
    for i, b in ipairs(self.bullets_) do 
        b:removeSelf()
    end
end

function UnitManager:clearBoarders()
    for i, b in ipairs(self.boarders_) do 
        b:removeSelf()
    end
end

function UnitManager:clearIcecubes()
    for i, ice in ipairs(self.icecubes_) do 
        ice:removeSelf()
    end
end

function UnitManager:clear()
    self:clearBullets()
    self:clearBoarders()
    self:clearIcecubes()
end

function UnitManager:update(dt)


end


