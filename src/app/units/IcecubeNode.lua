local UnitDef = import(".UnitDef")

local IcecubeNode = class("IcecubeNode", function()
    display.newNode()
end)

IcecubeNode.icecube_ = nil

--包含多层
IcecubeNode.physicsSprs_ = nil
function IcecubeNode:ctor(id)
    self.super.ctor()
    self.icecube_ = IcecubeDataPool:getSingleton():getIcecubeTemplete(id)
    self:initGraphics()
    self:initPhysicsBody()
end

function IcecubeNode:initGraphics()
    local spr = nil
    for _, res in ipairs(self.icecube_.stageIconReses_) do
        spr = display.newSprite(res)
        if spr ~= nil then
            self.physicsSprs_[#self.physicsSprs_ + 1] = spr
            self:addChild(self.spr)
        else
            error("BulletNode:initGraphics res error")
        end
    end
end

function IcecubeNode:initPhysicsBody()
    local material = cc.PhysicsMaterial(self.icecube_.density_, 
                    self.icecube_.restitution_, self.icecube_.friction_)

    local body = cc.PhysicsBody:createBox(self.physicsSprs_[1]:getContentSize(), material)
    body:setRotationEnable(false)

    body:setCategoryBitmask(UnitDef.BULLET_CATEGORY_MASK)
    body:setContactTestBitmask(UnitDef.BULLET_CONTACT_TEST_MASK)
    body:setCollisionBitmask(UnitDef.BULLET_COLLISION_MASK)
    self:setTag(UnitDef.BULLET_TAG)

    self:setPhysicsBody(body)
    self:getPhysicsBody():setGravityEnable(false)
end

function IcecubeNode:damage()
    self.physicsSprs_[#self.physicsSprs_]:removeSelf();
    if #self.physicsSprs_ == 0 then
        self:die()
    end
end

function IcecubeNode:die()
    --播放死亡动画
    self:removeSelf()
end



return IcecubeNode
