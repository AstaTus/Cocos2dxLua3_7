local WindowDef = require("app.core.WindowDef")
local BaseWindow = require("app.core.BaseWindow")
local LoginWindow = class("LoginWindow", BaseWindow)
LoginWindow.login_btn_ = nil


function LoginWindow:ctor(sheet)
    self.super.ctor(self, sheet, 0, WindowDef.TOP_LAYER, false)
end

function LoginWindow:init()
    self.login_btn_ = self:seekNodeByName(self.root_, "Button_1_2_6_10")

    local function loginBtnCallback(sender, eventType)
        if eventType == ccui.TouchEventType.ended then
            --display.showWithScene()
           SceneSwitcher:getSingleton():switch(SceneEnum.GameScene, nil)
            print("login btn is click")
        end
    end
    self.login_btn_:addTouchEventListener(loginBtnCallback)
end



function LoginWindow:update(type, params)
end


return LoginWindow