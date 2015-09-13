local LanscapeLayerData = import(".LanscapeLayerData")
local LanscapeData = import(".LandscapeData")
local LandscapeDef = import(".LandscapeDef")
local XMLFile = require("utils.XMLFile")
local XMLNode = require("utils.XMLNode")
local LandscapeParser = class("LandscapeParser")

function LandscapeParser:ctor()
    
end

function LandscapeParser:parse(path)
    local lanscapeData = LanscapeData.new()
    local xml = XMLFile.new()
    xml:loadFile(path)

    lanscapeData.name_ = xml.lanscape["@name"]
    lanscapeData.width_ = xml.lanscape["@width"]
    lanscapeData.height_ = xml.lanscape["@height"]

    local layerData = nil
    for i, node in ipairs(xml.lanscape.layer) do
        layerData = LanscapeLayerData.new()
        layerData.type_ = node["@type"]
        if layerData.type_ == LandscapeDef.TMX_TYPE then
            layerData.tmx_path_ = node.tmx["@path"]
        else
            for j, res in ipairs(node.pic) do
                layerData.pic_paths_[#layerData.pic_paths_ + 1] = res["@path"]
            end
        end
        
        lanscapeData.layer_datas_[#lanscapeData.layer_datas_ + 1] = layerData
    end
end

return LandscapeParser