--
-- SettingsView.lua
-- 
-- luming
-- 2014年8月19日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'PropertyEditView'
require 'PropertyPickView'
require 'PS'

--------------------------------------------------------------------------------
-- Constant

--------------------------------------------------------------------------------
-- Declaration
SettingsView = class('SettingsView', function ()
	return cc.Layer:create()
end)

--------------------------------------------------------------------------------
-- Property
SettingsView.particleSystem = nil

--------------------------------------------------------------------------------
-- Function

function SettingsView:onPropertyValueChanged(propertyView)
    local key = propertyView.pKey
    local value = propertyView.pValue
    D('PropertyView (%s) value changed to : %s', key, value)
    self.particleSystem.dict[key].value = value
    self.particleSystem.dict[key].dirty = true
    self.particleSystem:updateFromDict()
end

function SettingsView:getSettingsCount()
	return 0
end

function SettingsView:getSettingsKeys()
	return {}
end

function SettingsView:setParticleSystem(ps)
    self.particleSystem = ps
    self:setupPropertyView(self, self:getSettingsKeys())
end

function SettingsView:setupPropertyView(parent, keys)
    local size = kDefaultPropertyViewSize
    local csize = parent:getContentSize()
    local pos = cc.p(0, csize.height)
    local psdict = self.particleSystem.dict

    for _, key in ipairs(keys) do
        pos.y = pos.y - size.height
        local pdict = psdict[key]
        local view = nil

        if pdict.vlist then
            view = PropertyPickView:create()
            view:setPValueList(pdict.vlist)
            view:setPValueDesc(pdict.vdesc)
        else
            view = PropertyEditView:create()
        end
        view:setPKey(key)
        view:setPName(pdict.name)
        view:setPValue(pdict.value)

        view:setPValueChangedCallback(function (sender) self:onPropertyValueChanged(sender) end)
        view:setPosition(pos)
        parent:addChild(view)
    end
end

function SettingsView:setupUI()
    local size = kDefaultPropertyViewSize
    local count = self:getSettingsCount()

    self:setContentSize(size.width, size.height * count)
end

function SettingsView:init()
	self:setupUI()
end

function SettingsView:create()
	local instance = self.new()
	instance:init()
	return instance
end

return SettingsView