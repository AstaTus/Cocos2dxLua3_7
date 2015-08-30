local DbcData = import(".DbcData")
local DbcFile = class("DbcFile")

DbcFile.FORGET = 2
DbcFile.records_num_ = 0
DbcFile.fields_num_ = 0
DbcFile.size_ = 0
DbcFile.records_ = 0
DbcFile.datas_ = nil
DbcFile.pdata_ = nil
DbcFile.data_ = nil

function DbcFile:ctor()
    records_ = {}
	records_num_ = 0;
	fields_num_ = 0;
end


function DbcFile:openFromTxt(scheme)
	self.pdata_ = scheme;
	for i = 1, #self.pdata_ do
		if self.pdata_[i] == "\n" then
			self.records_num_ = self.records_num_ + 1;
		end

        if (self.pdata_[i] == "\n" or self.pdata_[i] == "\t") and self.records_num_ >= self.FORGET then
            self.records_[#self.records_ + 1] = i + 1
	    end
	end

	for j = 1, #self.pdata_ do
		if self.pdata_[j] == "\t" then
			self.fields_num_ = self.fields_num_ + 1
		elseif self.pdata_[j] == "\n" then
			break;
        end
	end
			
	self.fields_num_ = self.fields_num_ + 1
	self.size_ = #self.pdata_
	self.records_num_ = self.records_num_ - FORGET;	
end

function DbcFile:take(line, column)

	local _nrecordsrum_ = 0;
	local nfieldsnum_ = 0;
	--m_pdata为null值处理
	if self.pdata_ == nil then
		print "Get error : pdata_ is null "
		return null;
	end
	
    local value
    local i = records_[line * fields_num_ + column]
    while self.pdata_[i] ~= "\t" and self.pdata_[i] ~= "\n" do
        if self.pdata_[i] ~= "\r" then
			value = value + self.pdata_[i]
        end
        i = i + 1
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