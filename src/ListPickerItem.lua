--
-- ListPickerItem.lua
-- 
-- luming
-- 2014年8月17日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'

--------------------------------------------------------------------------------
-- Constant
kDefaultListPickerItemSize = cc.size(200, 23)

--------------------------------------------------------------------------------
-- Declaration
ListPickerItem = class('ListPickerItem', function ()
	return ccui.Layout:create()
end)

--------------------------------------------------------------------------------
-- Property
ListPickerItem.iKey = nil
ListPickerItem.iName = nil
ListPickerItem.iNameLabel = nil

--------------------------------------------------------------------------------
-- Function

function ListPickerItem:setIKey(key)
	self.iKey = key
end

function ListPickerItem:setIName(name)
	self.iName = name
	self.iNameLabel:setString(name)
end

function ListPickerItem:setupUI()
    local size = kDefaultListPickerItemSize
    self:setContentSize(size)
    
	self.iNameLabel = cc.Label:create()
	self.iNameLabel:setAnchorPoint(1, 0.5)
	self.iNameLabel:setPosition(size.width - 20, size.height * 0.5)
    self:addChild(self.iNameLabel)
end

function ListPickerItem:init()
	self:setupUI()
end

function ListPickerItem:create()
	local instance = ListPickerItem.new()
	instance:init()
	return instance
end

return ListPickerItem