local IcecubeDataPool = class("IcecubeDataPool")

IcecubeDataPool.singleton_ = nil
IcecubeDataPool.icecubes_ = {}
function IcecubeDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = IcecubeDataPool.new()
    end

    return self.singleton_
end

function IcecubeDataPool:addIcecubeTemplete(templete)
    self.icecubes_[templete.id_] = templete

end

function IcecubeDataPool:getIcecubeTemplete(templete)
    return self.icecubes_[templete.id_]
end

return IcecubeDataPool