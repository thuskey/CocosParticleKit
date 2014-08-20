--
-- PropertyPickView.lua
-- 
-- luming
-- 2014年8月17日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'Ext'
require 'PropertyView'
require 'ListPicker'

--------------------------------------------------------------------------------
-- Constant

--------------------------------------------------------------------------------
-- Declaration
PropertyPickView = class('PropertyPickView', PropertyView)

--------------------------------------------------------------------------------
-- Property
PropertyPickView.pValueDesc = nil
PropertyPickView.pValueList = nil
PropertyPickView.pValuePicker = nil

--------------------------------------------------------------------------------
-- Function

function PropertyPickView:setPValue(value)
	self.pValue = value
end

function PropertyPickView:setPValueDesc(desc)
	self.pValueDesc = desc
	self.pValueLabel:setString(desc)
end

function PropertyPickView:setPValueList(list)
    self.pValueList = list
end

function PropertyPickView:showValuePickerView(x, y)
    if self.pValuePicker then
    	self.pValuePicker:removeFromParent()
    end
    
    local parent = self:getParent()
    local pos = self:convertToWorldSpace(cc.p(x, y))
    pos = parent:convertToNodeSpace(pos)
    
    self.pValuePicker = ListPicker:create()
    self.pValuePicker:setAnchorPoint(cc.p(1, 1))
    self.pValuePicker:setPosition(pos)
    self.pValuePicker:setItems(self.pValueList)
    self.pValuePicker:setItemPickedCallback(function (sender, key)
        self:onPValuePickerPicked(key)
    end)
    self:getParent():addChild(self.pValuePicker, 100)
    D('show')
end

function PropertyPickView:hideValuePickerView()
    self.pValuePicker:removeFromParent()
    self.pValuePicker = nil
end

function PropertyPickView:onPValueLabelClicked()
    if self.pValuePicker then
        self:hideValuePickerView()
    else
        local x, y = self.pValueLabel:getPosition()
        local as = self.pValueLabel:getAnchorPointInPoints()
        local s = self.pValueLabel:getContentSize()
        if not self.pValueLabel:isIgnoreAnchorPointForPosition() then
            x = x - as.x
            y = y - as.y
        end
        self:showValuePickerView(x + s.width, y)
    end
end

function PropertyPickView:onPValuePickerPicked(key)
    if self.pValueList then
        self:setPValue(key)
        self:setPValueDesc(self.pValueList[key])
    end
    if self.pValueChangedCallback then
    	self.pValueChangedCallback(self)
    end
    self:hideValuePickerView()
end

function PropertyPickView:setupUI(size)
    self.super.setupUI(self, size)
    
    self.pValueLayout:setTouchEnabled(true)
    self.pValueLayout:addTouchEventListener(function (sender, event)
        if event == ccui.TouchEventType.ended then
            self:onPValueLabelClicked()
        end
    end)
end

return PropertyPickView