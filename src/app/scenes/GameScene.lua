local GameScene = class("GameScene", function()
    return display.newScene("GameScene")
end)

GameScene.mission_ = nil
GameScene.map_ = nil
GameScene.gameNode_ = nil
local SceneDef = import(".SceneDef")
local UnitDef = require "app.units.SceneDef"

function GameScene:initMission()

end

function GameScene:onCleanup()

end

function GameScene:ctor(params)
    self.super.ctor()

    self.gameNode_ = display.newNode()
    self.gameNode_:setPosition()
    local mission_id = params[1]
    self.mission_ = MissionDataPool:getSingleton():getMissionTemplete(mission_id)

end

function GameScene:initMap()
    self.map_ = cc.TMXTiledMap:create(SceneDef.LANSCAPE_RES_PATH .. self.mission_.tileRes_)
		:addTo(self, -1)

   self.map_:setPosition(SceneDef.GAME_AREA_X, SceneDef.GAME_AREA_Y)
   self:initBoard()
   self:initIcecube()
end

function GameScene:initBoard()
    for i, id in ipairs(self.mission_.boards_) do
        local boarder = BoarderNode.new(id, i)
        boarder:addTo(self.map_)
    end
end

function GameScene:initIcecube()
    local ices = self.map_:getObjectGroup("icecube"):getObjects()
  
    for _, ice in ipairs(ices) do
        local x = ice["x"]
        local y = ice["y"]
        local id = ice["type"]
        local node = IcecubeNode.new(id)
        node:setPosition(x, y)
        self.map_:addChild(node)
    end
end


function GameScene:initCollision()
    local contactListener = cc.EventListenerPhysicsContact:create()
    contactListener:registerScriptHandler(self.onContactBegin, cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN)
    contactListener:registerScriptHandler(self.onContactSeperate, cc.Handler.EVENT_PHYSICS_CONTACT_SEPERATE)
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:addEventListenerWithFixedPriority(contactListener, 1)
end

local function GameScene:contactLogic(node)
    if node:getTag() == UnitDef.ICECUBE_TAG then
        node:damage()
    elseif node:getTag() == UnitDef.BOARDER_TAG then
        
    elseif node:getTag() == UnitDef.BULLET_TAG then
        
    end
end

local function GameScene:onContactBegin(contact)
    --local a = contact:getShapeA():getBody():getNode()
    --local b = contact:getShapeB():getBody():getNode()

    --self:contactLogic(a)
    --self:contactLogic(b)

    return true
end

local function GameScene:onContactSeperate(contact)
    local a = contact:getShapeA():getBody():getNode()
    local b = contact:getShapeB():getBody():getNode()

    self:contactLogic(a)
    self:contactLogic(b)
    --子弹速度为0 则销毁子弹
    --[[if self.player.blood <= 0 then 
        self.backgroundLayer:unscheduleUpdate()
        self.player:die()

        local over = display.newSprite("image/over.png")
            :pos(display.cx, display.cy)
            :addTo(self)

        cc.Director:getInstance():getEventDispatcher():removeAllEventListeners()
    end]]--
end

function GameScene:onEnter()

end

function GameScene:onExist()

end

return GameScene