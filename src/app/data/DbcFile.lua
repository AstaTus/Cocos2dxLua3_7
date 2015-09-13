local DbcData = import(".DbcData")
local DbcFile = class("DbcFile")

DbcFile.FORGET = 2  --类型行、注释行
DbcFile.records_num_ = 0
DbcFile.fields_num_ = 0
DbcFile.size_ = 0
DbcFile.records_ = 0
DbcFile.datas_ = nil
DbcFile.pdata_ = nil
DbcFile.data_ = nil

function DbcFile:ctor()
    self.records_ = {}
	self.records_num_ = 0
	self.fields_num_ = 0
    self.size_ = 0
end


function DbcFile:openFromTxt(scheme)
	self.pdata_ = scheme
    local c = ""
	for i = 1, #self.pdata_ do
        c = string.sub(self.pdata_, i, i)
		if c == "\n" then
			self.records_num_ = self.records_num_ + 1;
		end

        if (c == "\n" or c == "\t") and self.records_num_ >= self.FORGET then
            self.records_[#self.records_ + 1] = i + 1
	    end
	end

	for j = 1, #self.pdata_ do
        c = string.sub(self.pdata_, j, j)
		if c == "\t" then
			self.fields_num_ = self.fields_num_ + 1
		elseif c == "\n" then
			break;
        end
	end
			
	self.fields_num_ = self.fields_num_ + 1
	self.size_ = #self.pdata_
	self.records_num_ = self.records_num_ - self.FORGET;	
end

--line column从1开始,和lua保持一致
function DbcFile:take(line, column)

	--m_pdata为null值处理
	if self.pdata_ == nil then
		print "Get error : pdata_ is null "
		return null;
	end
	
    local value = ""
    local i = self.records_[(line - 1) * self.fields_num_ + column]
    local c = string.sub(self.pdata_, i, i)
    while c ~= "\t" and c ~= "\n" do
        if c ~= "\r" then
			value = value .. c
        end
        i = i + 1
        c = string.sub(self.pdata_, i, i)
    end
			
	return value;
end
		
function DbcFile:getRecordsNum()
	return self.records_num_
end

function DbcFile:getFieldsNum()
	return self.fields_num_
end


return DbcFile