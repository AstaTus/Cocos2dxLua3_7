local BoarderDataPool = class("BoarderDataPool")

BoarderDataPool.singleton_ = nil

function BoarderDataPool:getSingleton()
    if self.singleton_ == nil then
        self.singleton_ = BoardDataPool.new()
    end

    return self.singleton_
end

function BoarderDataPool:addBoarderTemplete(templete)
    self.icecubes_[templete.id_] = templete
end

function BoarderDataPool:getBoarderTemplete(templete)
    return self.icecubes_[templete.id_]
end


return BoarderDataPool