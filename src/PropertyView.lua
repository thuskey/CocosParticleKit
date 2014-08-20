--
-- PropertyView.lua
-- 
-- luming
-- 2014年8月16日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'

--------------------------------------------------------------------------------
-- Constant
kDefaultPropertyViewSize = cc.size(400, 60)

--------------------------------------------------------------------------------
-- Declaration
PropertyView = class('PropertyView', function ()
	return cc.Layer:create()
end)

--------------------------------------------------------------------------------
-- Property
PropertyView.pKey = nil
PropertyView.pName = nil
PropertyView.pValue = nil
PropertyView.pValueChangedCallback = function (sender) D('PropertyView (%s) value changed to : %s', sender.pKey, sender.pValue) end

PropertyView.pNameLabel = nil
PropertyView.pValueLabel = nil
PropertyView.pValueLayout = nil

--------------------------------------------------------------------------------
-- Function
function PropertyView:setPKey(key)
    self.pKey = key
end

function PropertyView:setPName(name)
    self.pName = name
    self.pNameLabel:setString(name)
end

function PropertyView:setPValue(value)
    self.pValue = value
    self.pValueLabel:setString(value)
end

function PropertyView:setPValueChangedCallback(callback)
	self.pValueChangedCallback = callback
end

function PropertyView:setupUI(size)
    size = size or kDefaultPropertyViewSize
    self:setContentSize(size)
    
    self.pNameLabel = cc.Label:create()
    self.pNameLabel:setAnchorPoint(0, 0.5)
    self.pNameLabel:setPosition(20, size.height * 0.5)
    self.pNameLabel:setSystemFontSize(20)
    self.pNameLabel:setSystemFontName('微软雅黑')
    self:addChild(self.pNameLabel)
    
    self.pValueLayout = ccui.Layout:create()
    self.pValueLayout:setBackGroundColorType(ccui.LayoutBackGroundColorType.solid)
    self.pValueLayout:setBackGroundColor(cc.c3b(100, 100, 100))
    self.pValueLayout:setAnchorPoint(1, 0.5)
    self.pValueLayout:setContentSize(80, 23)
    self.pValueLayout:setPosition(size.width - 20, size.height * 0.5)
    self:addChild(self.pValueLayout)
    
    self.pValueLabel = ccui.Text:create()
    self.pValueLabel:setTouchEnabled(false)
    self.pValueLabel:setAnchorPoint(1, 0.5)
    self.pValueLabel:setContentSize(80, 23)
    self.pValueLabel:setPosition(size.width - 20, size.height * 0.5)
    self:addChild(self.pValueLabel)
end

function PropertyView:init(size)
    self:setupUI(size)
end

function PropertyView:create(size)
	local instance = self.new()
	instance:init(size)
	return instance
end

return PropertyView