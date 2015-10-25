local GameScene = class("GameScene", function()
    return display.newScene("GameScene")
end)

local SceneDef = import(".SceneDef")
local UnitDef = import("app.units.UnitDef")

GameScene.mission_ = nil
GameScene.map_ = nil
GameScene.cubeCount_ = 0
GameScene.currentBullet_ = nil
GameScene.state_ = SceneDef.GAME_STATE_MISSION_START
GameScene.stationNode_ = nil



function GameScene:initMission()

end

function GameScene:onCleanup()

end

function GameScene:ctor(params)
    --self.super.ctor()

    --local mission_id = params[1]
    --self.mission_ = MissionDataPool:getSingleton():getMissionTemplete(mission_id)
    self:initMap()
end

function GameScene:initMap()
    --self.map_ = cc.TMXTiledMap:create(SceneDef.LANSCAPE_RES_PATH .. self.mission_.tileRes_)
	--	:addTo(self, -1)
    self.map_ = cc.TMXTiledMap:create(SceneDef.LANSCAPE_RES_PATH .. "lanscape0_0/lanscape0_0.tmx")
		:addTo(self, -1)

   self.map_:setPosition(SceneDef.GAME_AREA_X, SceneDef.GAME_AREA_Y)
   self:initBoard()
   self:initIcecube()
   self:initStation()
end

function GameScene:initStation()
    self.stationNode_ = StationNode.new()
    self.stationNode_:addTo(self.map_)
    self.stationNode_:setPosition(SceneDef.STATION_X, SceneDef.STATION_Y)

    --[[local  listenner = cc.EventListenerTouchOneByOne:create()
    listenner:setSwallowTouches(true)
    listenner:registerScriptHandler(self.onShootTouchBegain, cc.Handler.EVENT_TOUCH_BEGAN )

    listenner:registerScriptHandler(self.onShootTouchMoved, cc.Handler.EVENT_TOUCH_MOVED )
    listenner:registerScriptHandler(self.onShootTouchEnd, cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listenner, self)]]--

end

function GameScene:initBoard()
    for i, id in ipairs(self.mission_.boards_) do
        local boarder = BoarderNode.new(id, i)
        boarder:addTo(self.map_)
    end
end

function GameScene:initIcecube()
    local ices = self.map_:getObjectGroup("icecube"):getObjects()
    self.cubeCount_ = #ices
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

function GameScene:contactLogic(node)
    if node:getTag() == UnitDef.ICECUBE_TAG then
        if node:damage() == true then
            self.cubeCount_ = self.cubeCount_ - 1
        end
    elseif node:getTag() == UnitDef.BOARDER_TAG then
        
    elseif node:getTag() == UnitDef.BULLET_TAG then
        
    end

    if self.cubeCount_ == 0 then
        --胜利
    end
end

function GameScene:onContactBegin(contact)
    --local a = contact:getShapeA():getBody():getNode()
    --local b = contact:getShapeB():getBody():getNode()

    --self:contactLogic(a)
    --self:contactLogic(b)

    return true
end

function GameScene:onContactSeperate(contact)
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

function GameScene:initTouch()
    

end

function GameScene:onShootTouchBegain(touch, event)
    if (self._state ~= kPaddleStateUngrabbed) then 
        return false
    end

    if not self:containsTouchLocation(touch:getLocation().x, touch:getLocation().y) then
        return false
    end

    return true
end

function GameScene:onShootTouchMoved(touch, event)

end

function GameScene:onShootTouchEnd(touch, event)
end



function GameScene:onEnter()

--初始化



--显示关卡提示 不用window


end

function GameScene:onExist()

end

return GameScene