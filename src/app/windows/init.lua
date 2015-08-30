WindowManager = require("WindowManager")
WindowEnum = require("WindowEnum")


local LoginWindow = require("LoginWindow")
WindowManager:getSingleton():registerWindow(WindowEnum.LoginWindow, LoginWindow)