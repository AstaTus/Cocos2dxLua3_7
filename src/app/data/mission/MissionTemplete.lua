local MissionTemplete = class("MissionTemplete")

MissionTemplete.chapterId_ = 0
MissionTemplete.missionId_ = 0
MissionTemplete.tileRes_ = 0
MissionTemplete.bullets_ = nil
MissionTemplete.conditions_ = nil
--up down left right
MissionTemplete.boards_ = nil

function MissionTemplete:ctor()

end

return MissionTemplete