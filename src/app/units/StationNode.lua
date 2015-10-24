local StationNode = class("StationNode", function()
    display.newNode()
end)

--发射台 2帧, res size(140, 108) loc(218, 820) anchor(70, 60)
StationNode.station_ = nil
StationNode.spr_ = nil
StationNode.readyAction_ = nil
StationNode.shootAction_ = nil
StationNode.state_ = UnitDef.STATION_READY

function StationNode:ctor(id)
    self.super.ctor()
    self.spr_ = display.newSprite("#station1.png")

    local frames = display.newFrames("station%d.png", 1, 2)
    local animation = display.newAnimation(frames, 0.2 / 2)
    animation:setDelayPerUnit(0.1)

    self.shootAction_ = cc.Animate:create(animation)
    self.readyAction_ = self.shootAction_:reverse()
   
end

--切换准备状态还是发射状态
function StationNode:changeState(state)
    if self.state_ ~= state then
        if state == UnitDef.STATION_READY then
            self.spr_:runAction(self.readyAction_)
        else
            self.spr_:runAction(self.shootAction_)
        end
        self.state_ = state
    end
end

function StationNode:onEnter()
end
return StationNode