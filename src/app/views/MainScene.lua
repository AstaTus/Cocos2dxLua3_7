
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    local win_temp = WindowTemplete.new()
    win_temp.id_ = 1
    win_temp.group_ = 1
    win_temp.name_ = WindowEnum.LoginWindow
    WindowDataPool:getSingleton():addWindowTemplete(win_temp)
    WindowManager:getSingleton():resetScene(self)
    WindowManager:getSingleton():loadWindows(1)
    WindowManager:getSingleton():show(WindowEnum.LoginWindow)

end

return MainScene
