local BaseWindow = require("app.core.BaseWindow")

local LoginWindow = class("LoginWindow", BaseWindow)
LoginWindow.login_btn_ = nil


function LoginWindow:ctor()
    self.super.ctor()
end

function LoginWindow:init()
    self.login_btn_ = self:seekNodeByName(self.node, "Button_1_2_6_10")
    self.login_btn_:addTouchEventListener(loginCallback)
end

local function loginBtnCallback(sender, eventType)
    if eventType == ccui.TouchEventType.ended then
        --display.showWithScene()
        print("login btn is click")
    end
end

function LoginWindow:update(type, params)
end


return LoginWindow