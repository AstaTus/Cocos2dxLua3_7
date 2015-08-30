WindowManager = import(".WindowManager")
WindowEnum = import(".WindowEnum")


local LoginWindow = import(".LoginWindow")
WindowManager:getSingleton():registerWindow(WindowEnum.LoginWindow, LoginWindow)