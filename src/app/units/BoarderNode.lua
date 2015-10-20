local UnitDef = import(".UnitDef")

local BoarderNode = class("BoarderNode", function()
    display.newNode()
end)

BoarderNode.boarder_ = nil
--1:up 2:down 3:left 4:right
BoarderNode.side_ = 0
function BoarderNode:ctor(boarder, side)
    self.super.ctor()
    self.boarder_ = boarder
    self.side_ = side
    self:initGraphics()
    self:initPhysicsBody()
end

function BoarderNode:initGraphics()
    self.physicsSpr_ = display.newSprite(self.boarder_.res_ .. self.side_)
    if self.physicsSpr_ ~= nil then
        self:addChild(self.physicsSpr_)
    else
        error("BoarderNode:initGraphics res error")
    end
end

function BoarderNode:initPhysicsBody()
    local material = cc.PhysicsMaterial(self.boarder_.density_, 
        self.boarder_.restitution_, self.boarder_.friction_)

    local body = cc.PhysicsBody:createCircle(self.physicsSpr_:getContentSize().width / 2,
        material)
    body:setRotationEnable(false)

    body:setCategoryBitmask(UnitDef.BULLET_CATEGORY_MASK)
    body:setContactTestBitmask(UnitDef.BULLET_CONTACT_TEST_MASK)
    body:setCollisionBitmask(UnitDef.BULLET_COLLISION_MASK)
    self:setTag(UnitDef.BOARDER_TAG)

    self:setPhysicsBody(body)
    self:getPhysicsBody():setGravityEnable(false)
end


return BoarderNode