local GameScene = class("GameScene", function()
    return display.newScene("GameScene")
end)

GameScene.mission_ = nil
function GameScene:initMission()

end

function GameScene:ctor(params)
    self.super.ctor()

    local mission_id = params[1]
    self.mission_ = MissionDataPool:getSingleton():getMissionTemplete(mission_id)

end

function GameScene:initMap()
end

function GameScene:onEnter()

end

function GameScene:onExist()
end

return GameScene