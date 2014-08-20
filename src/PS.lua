--
-- PS.lua
-- 
-- luming
-- 2014年8月18日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'PSDict'
require 'PSSetter'

--------------------------------------------------------------------------------
-- Constant

--------------------------------------------------------------------------------
-- Declaration
PS = class('PS', function ()
	return cc.ParticleSystemQuad:createWithTotalParticles(300)
end)

--------------------------------------------------------------------------------
-- Property
PS.dict = nil
PS.plistFile = nil -- from c++

--------------------------------------------------------------------------------
-- Function

local function copyDict(dict)
    if type(dict) ~= 'table' then
        return dict
    end
    local t = {}
    for key, var in pairs(dict) do
        t[copyDict(key)] = copyDict(var)
    end
    return t
end

function PS:updateFromDict()
    local dict = self.dict
    
    if not self:getTexture() or self.dict.textureFileName.dirty or self.dict.textureImageData.dirty then
        self:setTexture(cc.Director:getInstance():getTextureCache():addImage(self.dict.textureFileName.value))
    end
    
    local function _update(settersDict)
        for key, sdict in pairs(settersDict) do
            sdict.setter(self, dict, sdict.argment, key)
        end
    end
    
    _update(PSSetter.Normal)
    
    if dict.emitterType.value == cc.PARTICLE_MODE_GRAVITY then
        _update(PSSetter.Gravity)
    else
        _update(PSSetter.Radius)
    end
    
    
    
    
--    local tfdict = dict.textureFileName
--    local tddict = dict.textureImageData
--    
--    if not self:getTexture() or tfdict.dirty or tddict.dirty then
--        local function get_dir_path(path)
--            if path then
--                return path:match('.*/') or ''
--            else
--                return ''
--            end
--        end
--        local function get_file_name(path)
--            if path then
--                return path:match('([^/]*)$') or ''
--            else
--                return ''
--            end
--        end
--
--        local path_t = tfdict.value
--
--        local dir_p = get_dir_path(self.plistFile)
--        local dir_t = get_dir_path(path_t)
--
--        local name_t = get_file_name(path_t)
--        name_t = dir_p .. dir_t .. name_t
--
--        local texture = nil
--        if string.len(name_t) > 0 then
--            texture = cc.Director:getInstance():getTextureCache():addImage(name_t)
--        end
--
--        if texture then
--            self:setTexture(texture)
--        else
--            local data = tddict.value
--            local datalen = string.len(data)
--            if datalen ~= 0 then
--            	local decodedata = Base64.decode(data)
--            	local image = cc.Image:new()
--            end
--        end
--        
--        tfdict.dirty = false
--        tddict.dirty = false
--    end
end

function PS:updateToDict(plistfile)
    local filepath = cc.FileUtils:getInstance():fullPathForFilename(plistfile)
    local plist = cc.FileUtils:getInstance():getValueMapFromFile(filepath)
    
    for key, val in pairs(self.dict) do
        local pval = plist[key] or val.default
        D('updateToDict    %s : %s', key, pval)
    	val.value = pval
    	if val.vlist then
    		val.vdesc = val.vlist[pval]
    	end
    end
end

function PS:init(plistfile)
    self.dict = copyDict(PSDict)
    self.plistFile = plistfile
    if plistfile then
    	self:updateToDict(plistfile)
    end
    self:updateFromDict()
end

function PS:create(plistfile)
	local instance = PS.new()
	instance:init(plistfile)
	return instance
end

return PS