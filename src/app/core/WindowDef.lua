local WindowDef = {}

WindowDef.PANEL_TYPE = 1
WindowDef.FRAME_TYPE = 2

WindowDef.BOTTOM_LAYER = "bottom_layer"
WindowDef.MIDDLE_LAYER = "middle_layer"
WindowDef.TOP_LAYER = "top_layer"

--加载过程没有多线程  所以没有LOADING 状态和 UNLOADING状态
WindowDef.UNLOAD = 1
WindowDef.LOADED = 2

return WindowDef