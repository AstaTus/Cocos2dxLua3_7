local UnitDef = import(".UnitDef")

--基类为node,之后所有效果都挂在该node上
local BulletNode = class("BulletNode", function()
    display.newNode()
end)

BulletNode.bullet_ = nil
BulletNode.physics_spr_ = nil
function BulletNode:ctor(bullet)
    self.super.ctor()
    self.bullet_ = bullet
    self:initGraphics()
    self:initPhysicsBody()
end

function BulletNode:initGraphics()
    self.physicsSpr_ = display.newSprite(self.bullet_.res_)
    if self.physicsSpr_ ~= nil then
        self:addChild(self.physicsSpr_)
    else
        error("BulletNode:initGraphics res error")
    end
end

function BulletNode:initPhysicsBody()
    
    local material = cc.PhysicsMaterial(self.bullet_.density_, 
                    self.bullet_.restitution_, self.bullet_.friction_)

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

function BulletNode:onEnter()
end

function BulletNode:update(dt)
end


return BulletNode

