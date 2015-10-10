local UnitDef = import(".UnitDef")

local IcecubeNode = class("IcecubeNode", function()
    display.newNode()
end)

IcecubeNode.icecube_ = nil
IcecubeNode.physics_spr_ = nil
function IcecubeNode:ctor(icecube)
    self.super.ctor()
    self.icecube_ = icecube
    self:initGraphics()
    self:initPhysicsBody()
end

function IcecubeNode:initGraphics()
    self.physicsSpr_ = display.newSprite(self.icecube_.res_)
    if self.physicsSpr_ ~= nil then
        self:addChild(self.physicsSpr_)
    else
        error("BulletNode:initGraphics res error")
    end
end

function IcecubeNode:initPhysicsBody()
    
    local material = cc.PhysicsMaterial(self.icecube_.density_, 
                    self.icecube_.restitution_, self.icecube_.friction_)

    local body = cc.PhysicsBody:createCircle(self.physicsSpr_:getContentSize().width / 2,
        material)
    body:setRotationEnable(false)

    body:setCategoryBitmask(UnitDef.BULLET_CATEGORY_MASK)
    body:setContactTestBitmask(UnitDef.BULLET_CONTACT_TEST_MASK)
    body:setCollisionBitmask(UnitDef.BULLET_COLLISION_MASK)
    self:setTag(UnitDef.BULLET_TAG)

    self:setPhysicsBody(body)
    self:getPhysicsBody():setGravityEnable(false)
end

return IcecubeNode
