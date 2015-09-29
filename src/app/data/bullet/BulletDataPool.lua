local BulletDataPool = class("BulletDataPool")

BulletDataPool.singleton_ = nil
BulletDataPool.bullets_ = {}

function BulletDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = BulletDataPool.new()
    end

    return self.singleton_
end

function BulletDataPool:addBulletTemplete(templete)
    self.bullets_[templete.id_] = templete

end

function BulletDataPool:getBulletTemplete(templete)
    return self.bullets_[templete.id_]
end

return BulletDataPool