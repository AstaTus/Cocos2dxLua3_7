local MissionTemplete = class("MissionTemplete")

MissionTemplete.chapterId_ = 0
MissionTemplete.missionId_ = 0
MissionTemplete.tileRes_ = 0
MissionTemplete.bullets_ = {}
MissionTemplete.conditions_ = {}
--top bottom left right
MissionTemplete.boarders_ = {}

function MissionTemplete:ctor()

end

return MissionTemplete