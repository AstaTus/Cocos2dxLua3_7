local UnitDef = import(".UnitDef")

local BoarderNode = class("BoarderNode", function()
    display.newNode()
end)

BoarderNode.boarder_ = nil

--1:up 2:down 3:left 4:right
BoarderNode.side_ = UnitDef.TOP;

function BoarderNode:ctor(boarder, side)
    self.super.ctor()
    self.boarder_ = boarder
    self:initGraphics()
    self:initPhysicsBody(width, height)
end

function BoarderNode:initGraphics()
   
end

function BoarderNode:initPhysicsBody(width, height)
    local material = cc.PhysicsMaterial(self.boarder_.density_, 
        self.boarder_.restitution_, self.boarder_.friction_)

    local body = nil;
    if self.side_ == UnitDef.Top then
        body = cc.PhysicsBody:createEdgeSegment(cc.p(UnitDef.GAME_COLLISION_X, UnitDef.GAME_COLLISION_Y), 
            cc.p(UnitDef.GAME_COLLISION_X + UnitDef.GAME_COLLISION_WIDTH, UnitDef.GAME_COLLISION_Y), material)
    elseif self.side_ == UnitDef.BOTTOM then
        body = cc.PhysicsBody:createEdgeSegment(cc.p(UnitDef.GAME_COLLISION_X, UnitDef.GAME_COLLISION_Y + UnitDef.GAME_COLLISION_HEIGHT), 
            cc.p(UnitDef.GAME_COLLISION_X + UnitDef.GAME_COLLISION_WIDTH, UnitDef.GAME_COLLISION_Y + UnitDef.GAME_COLLISION_HEIGHT), material)
    elseif self.side_ == UnitDef.LEFT then
        body = cc.PhysicsBody:createEdgeSegment(cc.p(UnitDef.GAME_COLLISION_X, UnitDef.GAME_COLLISION_Y), 
            cc.p(UnitDef.GAME_COLLISION_X, UnitDef.GAME_COLLISION_Y + UnitDef.GAME_COLLISION_HEIGHT), material)
    elseif self.side_ == UnitDef.RIGHT then
        body = cc.PhysicsBody:createEdgeSegment(cc.p(UnitDef.GAME_COLLISION_X + UnitDef.GAME_COLLISION_WIDTH, UnitDef.GAME_COLLISION_Y), 
            cc.p(UnitDef.GAME_COLLISION_X + UnitDef.GAME_COLLISION_WIDTH, UnitDef.GAME_COLLISION_Y + UnitDef.GAME_COLLISION_HEIGHT), material)
    end

    body:setRotationEnable(false)

    body:setCategoryBitmask(UnitDef.BULLET_CATEGORY_MASK)
    body:setContactTestBitmask(UnitDef.BULLET_CONTACT_TEST_MASK)
    body:setCollisionBitmask(UnitDef.BULLET_COLLISION_MASK)
    self:setTag(UnitDef.BOARDER_TAG)

    self:setPhysicsBody(body)
    self:getPhysicsBody():setGravityEnable(false)
end


return BoarderNode