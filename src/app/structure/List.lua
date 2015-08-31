local ListElement = import(".ListElement")
local List = class("List")
List.head_ = nil
List.tail_ = nil

function List:pushBack(value)
    local element = ListElement.new()
    element.value_ = value

    if self.head_ == nil then
        self.head_ = element
        self.tail_ = self.head_
    else
        self.tail_.next_ = element
        element.prev_ = self.tail_
        self.tail_ = element
    end
end

function List:pushFornt(value)
    local element = ListElement.new()
    element.value_ = value

    if self.head_ == nil then
        self.head_ = element
        self.tail_ = self.head_
    else
        self.head_.prev_ = element
        element.next_ = self.head_
        self.head_ = element
    end
end

function List:insert(element, value)
    if element == self.head_ then
        self:pushBack(value)
    elseif element == self.tail_ then
         self:pushBack(value)
    else
        local new_element = ListElement.new()
        new_element.value_ = value
        new_element.next_ = element.next_
        element.next_ = new_element
        new_element.prev_ = element
    end
end

function List:remove(element)
    if element == self.head_ then
        self:popFront()
    elseif element == self.tail_ then
        self:popBack()
    else
        element.prev_.next_ = element.next_
        element.next_.prev_ = element.prev_
    end
end

function List:popFront()
    if self.head_ == nil then
        return nil
    end

    local front = self.head_
    self.head_ = self.head_.next_
    front.next_ = nil
    self.head_.prev_ = nil
    return front
end

function List:popBack()
    if self.tail_ == nil then    
        return nil
    end

    local back = self.tail_
    self.tail_ = back.prev_
    back.prev_ = nil
    self.tail_.next_ = nil
    return back
end

return List