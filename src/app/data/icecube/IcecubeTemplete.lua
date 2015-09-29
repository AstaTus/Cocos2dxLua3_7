local IcecubeTemplete = class("IcecubeTemplete")


IcecubeTemplete.id_ = 0
--生命值
IcecubeTemplete.life_ = 0
--每个状态的图片
IcecubeTemplete.stageIconReses_ = nil
--每个状态的切换时的特效
IcecubeTemplete.stageEffReses_ = nil
--运动类型
IcecubeTemplete.actionType_ = 0
IcecubeTemplete.actionArg1_ = 0
IcecubeTemplete.actionArg2_ = 0

--隐形类型
IcecubeTemplete.visibleType_ = 0
IcecubeTemplete.visibleArg1_ = 0
IcecubeTemplete.visibleArg2_ = 0

function IcecubeTemplete:ctor()
end

return IcecubeTemplete