local GameScene = class("GameScene", function()
    return display.newScene("GameScene")
end)

GameScene.mission_ = nil
GameScene.map_ = nil
local SceneDef = import(".SceneDef")

function GameScene:initMission()

end

function GameScene:ctor(params)
    self.super.ctor()

    local mission_id = params[1]
    self.mission_ = MissionDataPool:getSingleton():getMissionTemplete(mission_id)

end

function GameScene:initMap()
    self.map_ = cc.TMXTiledMap:create(SceneDef.LANSCAPE_RES_PATH .. self.mission_.tileRes_)
		:align(display.BOTTOM_LEFT, display.left, display.bottom)
		:addTo(self, -1)

   self:initBoard()
   self:initIcecube()
end

function GameScene:initBoard()
    for i , id in ipairs(self.mission_.boards_) do
        local bt = BoarderDataPool:getSingleton():getBoardTemplete(id)
        if bt ~= nil then
            local board = BoarderNode.new(bt, i)
            board:addTo(self, -2)
        end
    end
end

function GameScene:initIcecube()

end

function GameScene:onEnter()

end

function GameScene:onExist()
end

return GameScene