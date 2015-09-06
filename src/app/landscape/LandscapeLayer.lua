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

    --必须有2张图片
    self.visble_pic_head_ = self.pics_.head_
    self.visble_pic_tail_ = self.pics_.head_.next_

    self.visble_pic_head_.value_:align(display.BOTTOM_LEFT, display.left, display.bottom)
            :addTo(self, -1)
    self.visble_pic_tail_.value_:align(display.BOTTOM_LEFT, self.visble_pic_head_:getContentSize().width + display.left, display.bottom)
            :addTo(self, -1)

end

function LandscapeLayer:update(td, offset_x, offset_y)
    if self.data_.type_ == LandscapeDef.TMX_TYPE then
        self:updateTmx(td, offset_x, offset_y)
    else
        self:updatePics(td, offset_x, offset_y)
    end
end

function LandscapeLayer:updateTmx(td, offset_x, offset_y)
    self.tmx_:setPositionX(self.tmx_:getPositionX() + offset_x)
    self.tmx_:setPositionY(self.tmx_:getPositionY() + offset_y)
end

function LandscapeLayer:updatePics(td, offset_x, offset_y)
    
    --先移动位置
    local itr = self.visble_pic_head_
    local pic = nil

    while itr ~= nil and itr.prev_ ~= self.visble_pic_tail_ do
        pic = itr.value_
        pic:setPositionX(pic:getPositionX() + offset_x)
        pic:setPositionY(pic:getPositionY() + offset_y)
        itr = itr.next_
    end

   
    itr = self.visble_pic_head_
    pic = itr.value_
    local pic_left = pic:getPositionX()
    --左边要加
    while pic_left > 0 and itr.prev_ ~= nil do
        itr = itr.prev_
        pic = itr.value_
        self.visble_pic_head_ = itr
        pic:align(display.BOTTOM_LEFT, display.left + pic_left - pic:getContentSize().width, display.bottom)
            :addTo(self, -1)

        pic_left = pic:getPositionX()
    end

    itr = self.visble_pic_head_
    pic = itr.value_
    local pic_right = pic:getPositionX() + pic:getContentSize().width

    --左边要删
    while pic_right <= 0 and itr ~= self.visble_pic_tail_ do
        pic:removeSelf()
 
        itr = itr.next_
        pic = itr.value_
        self.visble_pic_head_ = itr
        pic_right = pic:getPositionX() + pic:getContentSize().width
    end

    itr = self.visble_pic_tail_
    pic = itr.value_
    pic_right = pic:getPositionX() + pic:getContentSize().width
    --右边要加
    while pic_right < display.width and itr ~= nil do
        itr = itr.next_
        pic = itr.value_
        self.visble_pic_tail_ = itr
        pic:align(display.BOTTOM_LEFT, display.left + pic_right, display.bottom)
            :addTo(self, -1)
        pic_right = pic:getPositionX() + pic:getContentSize().width
    end

    --右边要删
    itr = self.visble_pic_tail_
    pic = itr.value_
    pic_left = pic:getPositionX()
    while pic_left > display.width and itr ~= self.visble_pic_head_ do
        pic:removeSelf()

        itr = itr.prev_
        pic = itr.value_
        self.visble_pic_tail_ = itr

        pic_left = pic:getPositionX()
    end
end

return LandscapeLayer