local UnitManager = class("UnitManager")

UnitManager.singleton_ = nil

function UnitManager:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = UnitManager.new()
    end

    return self.singleton_
end

function UnitManager:ctor()

end

function UnitManager:CreateBullet(id, loc, dir)
end

function UnitManager:CreateBoarder(id, loc)

end

function UnitManager:CreateIcecube(id, loc)

end

function UnitManager:clear()

end


function UnitManager:update(dt)
end


