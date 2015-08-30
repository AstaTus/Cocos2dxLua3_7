local BaseWindow = require("app.core.BaseWindow")

local LoginWindow = class("LoginWindow", BaseWindow)
LoginWindow.login_btn_ = nil


function LoginWindow:ctor()
    self.super.ctor(self)
end

function LoginWindow:init()
    self.login_btn_ = self:seekNodeByName(self.root_, "Button_1_2_6_10")
    self.login_btn_:addTouchEventListener(loginCallback)
end

local function LoginWindow:loginBtnCallback(sender, eventType)
    if eventType == ccui.TouchEventType.ended then
        --display.showWithScene()
        print("login btn is click")
    end
end

function LoginWindow:update(type, params)
end


return LoginWindow