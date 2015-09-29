local BoardDataPool = class("BoardDataPool")

BoardDataPool.singleton_ = nil

function BoardDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = BoardDataPool.new()
    end

    return self.singleton_
end

function BoardDataPool:addBoardTemplete(templete)
    self.icecubes_[templete.id_] = templete
end

function BoardDataPool:getBoardTemplete(templete)
    return self.icecubes_[templete.id_]
end


return BoardDataPool