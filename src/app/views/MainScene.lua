
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
   WindowManager:getSingleton():show(WindowEnum.LoginWindow)

end

return MainScene
