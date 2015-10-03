local UnitDef = import(".UnitDef")
local BulletNode = class("BulletNode", function()
    display.newNode()
end)

BulletNode.bullet_ = nil

function BulletNode:ctor(bullet)
    self.super.ctor()
    self.bullet_ = bullet
    self:initPhysicsBody()
end


function BulletNode:initPhysicsBody()
local body = cc.PhysicsBody:createCircle(self:getContentSize().width / 2,
        MATERIAL_DEFAULT)
    body:setRotationEnable(false)

    body:setCategoryBitmask(UnitDef.BULLET_CATEGORY_MASK)
    body:setContactTestBitmask(UnitDef.BULLET_CONTACT_TEST_MASK)
    body:setCollisionBitmask(UnitDef.BULLET_COLLISION_MASK)
    self:setTag(BIRD_TAG)

    self:setPhysicsBody(body)
    self:getPhysicsBody():setGravityEnable(false)  


    self:setPosition(x, y)

    local frames = display.newFrames("bird%d.png", 1, 9)
    local animation = display.newAnimation(frames, 0.5 / 9)
    animation:setDelayPerUnit(0.1)
    local animate = cc.Animate:create(animation)

    self:runAction(cc.RepeatForever:create(animate))
end

function BulletNode:onEnter()
end

function BulletNode:update(dt)
end

function

return BulletNode

