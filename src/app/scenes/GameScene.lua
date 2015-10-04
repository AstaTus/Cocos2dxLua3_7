local GameScene = class("GameScene", function()
    return display.newScene("GameScene")
end)


GameScene.
function GameScene:ctor(params)
    super.ctor()
end

function GameScene:onEnter()

end

function GameScene:onExist()
end

return GameScene