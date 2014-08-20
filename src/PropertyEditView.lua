--
-- PropertyEditView.lua
-- 
-- luming
-- 2014年8月16日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'PropertyView'

--------------------------------------------------------------------------------
-- Constant

--------------------------------------------------------------------------------
-- Declaration
PropertyEditView = class('PropertyEditView', PropertyView)

--------------------------------------------------------------------------------
-- Property
PropertyEditView.pValueField = nil

--------------------------------------------------------------------------------
-- Function
function PropertyEditView:setPValue(value)
	self.super.setPValue(self, value)
    self.pValueField:setText(tostring(value))
end

function PropertyEditView:setupUI(size)
    self.super.setupUI(self, size)
    self.pValueLabel:setVisible(false)
	
	size = size or kDefaultPropertyViewSize
	
    self.pValueField = ccui.TextField:create('0', '微软雅黑', 20)
	self.pValueField:setContentSize(80, 23)
    self.pValueField:setAnchorPoint(cc.p(1, 0.5))
    self.pValueField:setPosition(cc.p(size.width - 20, size.height * 0.5))
    self.pValueField:setTouchEnabled(true)
    self.pValueField:setTouchSize(cc.size(80, 23))
    self.pValueField:setTouchAreaEnabled(true)
    self.pValueField:addEventListener(function (sender, eventType)
        if eventType == ccui.TextFiledEventType.attach_with_ime then
            self.pValueLayout:setBackGroundColor(cc.c3b(150, 150, 150))
        elseif eventType == ccui.TextFiledEventType.detach_with_ime then
            self.pValueChangedCallback(self)
            self.pValueLayout:setBackGroundColor(cc.c3b(100, 100, 100))
        elseif eventType == ccui.TextFiledEventType.insert_text then
            self.pValue = sender:getStringValue()
        elseif eventType == ccui.TextFiledEventType.delete_backward then
            self.pValue = sender:getStringValue()
        end
    end)
    self:addChild(self.pValueField)
end

return PropertyEditView