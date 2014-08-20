--
-- ListPicker.lua
-- 
-- luming
-- 2014年8月17日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'ListPickerItem'

--------------------------------------------------------------------------------
-- Constant

--------------------------------------------------------------------------------
-- Declaration
ListPicker = class('ListPicker', function ()
	return ccui.ListView:create()
end)

--------------------------------------------------------------------------------
-- Property
ListPicker.items = nil -- warnning : different from getItems 
ListPicker.itemPickedCallback = function (sender, key) end

--------------------------------------------------------------------------------
-- Function
function ListPicker:setItems(items)
	items = items or {}
	if items == self.items then
		return
	end
	self.items = items
	
	local index = 0
	for key, name in pairs(items) do
        local item = ListPickerItem:create()
        item:setIKey(key)
        item:setIName(name)
        item:setTouchEnabled(true)
        self:insertCustomItem(item, index)
        index = index + 1
	end
	
	-- update content size
	self:setContentSize(kDefaultListPickerItemSize.width, kDefaultListPickerItemSize.height * index)
end

function ListPicker:setItemPickedCallback(callback)
	self.itemPickedCallback = callback
end

function ListPicker:onItemPicked(index)
    if self.itemPickedCallback then
        local item = self:getItem(index)
        self.itemPickedCallback(self, item.iKey)
    end
end

function ListPicker:init()
    self:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid)
    self:setBackGroundColor(cc.c3b(150, 200, 255))
    self:setBackGroundColorOpacity(255)
    self:setDirection(ccui.ListViewDirection.vertical)
    self:setTouchEnabled(true)
    self:setItemsMargin(1)
    self:setBounceEnabled(true)
    self:addEventListener(function (sender, eventType)
        if eventType == ccui.ListViewEventType.ONSELECTEDITEM_START then
            self:onItemPicked(sender:getCurSelectedIndex())
        end
    end)
end

function ListPicker:create()
	local instance = ListPicker.new()
	instance:init()
	return instance
end

return ListPicker