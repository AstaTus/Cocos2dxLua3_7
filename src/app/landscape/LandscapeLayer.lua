local LandscapeDef = import(".LandscapeDef")

local LandscapeLayer = class("LandscapeLayer", function()
    return display.newNode()
end)

LandscapeLayer.data_ = nil

LandscapeLayer.tmx_ = nil   --tmx资源
LandscapeLayer.pics_ = nil --pics资源
LandscapeLayer.visble_pic_head_ = nil
LandscapeLayer.visble_pic_tail_ = nil
function LandscapeLayer:ctor(data)
    self.data_ = data
end

function LandscapeLayer:init()
    
    if self.data_.type_ == LandscapeDef.TMX_TYPE then
        self:initTmx()
    else
        self:initPics()
    end
end

function LandscapeLayer:intTmx()
    self.tmx_ = cc.TMXTiledMap:create(self.data_.tmx_path_)
    self.tmx_:align(display.BOTTOM_LEFT, display.left, display.bottom)
            :addTo(self, -1)
end

function LandscapeLayer:initPics()
    self.pics_ = List.new()
    for _, path in ipairs(self.data_.pic_paths_) do
        self.pics_:pushBack(display.newSprite(path))
    end

    self.visble_pic_head_ = self.pics_[1]
    self.visble_pic_tail_ = self.pics_[2]


end

function LandscapeLayer:update(td, offset_x, offset_y)
    if self.data_.type_ == LandscapeDef.TMX_TYPE then
        self:updateTmx(td, offset_x, offset_y)
    else
        self:updatePics(td, offset_x, offset_y)
    end
end

function LandscapeLayer:updateTmx(td, offset_x, offset_y)
    self.tmx_.setPositionX(self.tmx_.getPositionX() + offset_x)
    self.tmx_.setPositionY(self.tmx_.getPositionY() + offset_y)
end

function LandscapeLayer:updatePics(td, offset_x, offset_y)
    self.tmx_.setPositionX(self.tmx_.getPositionX() + offset_x)
    self.tmx_.setPositionY(self.tmx_.getPositionY() + offset_y)
end

return LandscapeLayer