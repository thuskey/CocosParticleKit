--
-- Ext.lua
-- 
-- luming
-- 2014年8月11日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'LogUtil'

Ext = {}


---------------------------
-- @function [parent=#Ext] nodeSetClickHandler 
-- @param node
-- @param handler function (sender, touch, event) end or nil to prevent touch event
function Ext.nodeSetClickHandler(node, handler)

    local eventDispatcher = node:getEventDispatcher()

    if node.touchListener then
        eventDispatcher:removeEventListener(node.touchListener)
        node.touchListener = nil
    end

    if handler and (type(handler) ~= 'function') then
        E('Handler should be a function')
        return
    end


    local function onTouchBegan(touch, event)
        local point = node:convertTouchToNodeSpace(touch)
        local size = node:getContentSize()
        D('Touch Began node(%s) point(%f, %f) size(%f, %f)', node.__cname, point.x, point.y, size.width, size.height)
        local rect = cc.rect(0, 0, size.width, size.height)
        return cc.rectContainsPoint(rect, point)
    end

    local function onTouchEnded(touch, event)
        local location = touch:getLocation()
        D("Ended %s point %0.2f, %0.2f", node.__cname, location.x, location.y)
        if handler and type(handler) == 'function' then
            handler(node, touch, event)
        end
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)

    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, node)
    node.touchListener = listener
end

function Ext.resetRandomSeed()
    math.randomseed(tostring(os.time()):reverse():sub(1, 6))
end

function Ext.divideTableIntoKeysAndValues(aTable)
    local keys = {}
    local vals = {}
    
    for key, var in pairs(aTable) do
    	table.insert(keys, key)
    	table.insert(vals, var)
    end
    
    return keys, vals
end

function Ext.reverseTable(t)
	if not t then
        E('WTF, if you could reverse a nil, you should do it')
        return nil
    end
    if type(t) ~= 'table' then
        E('WTF, check out what you given to me, non-table!!!Demon!!!')
        return nil
    end
    local c = #t
    for i = 1, math.floor(c * 0.5) do
        local v = t[i]
        t[i] = t[c - i + 1]
        t[c - i + 1] = v
    end
    return t
end

function Ext.reverseCopyTable(t)
	if not t then
        E('WTF, if you could reverse a nil, you should do it')
        return nil
    end
    if type(t) ~= 'table' then
        E('WTF, check out what you given to me, non-table!!!Demon!!!')
        return nil
    end
    local copy = {}
    local c = #t
    for i, v in ipairs(t) do
        copy[c - i + 1] = v
    end
    return copy
end

function Ext.alignLeftTo(n1, n2)
	local x2 = n2:getPositionX()
	local a1 = n1:getAnchorPointInPoints()
	local a2 = n2:getAnchorPointInPoints()
	local i1 = n1:isIgnoreAnchorPointForPosition()
	local i2 = n2:isIgnoreAnchorPointForPosition()
	
	local x1 = x2
	if not i2 then x1 = x1 - a2.x end
	if not i1 then x1 = x1 + a1.x end
	n1:setPositionX(x1)
end

function Ext.seekChildByName(node, name)
    if not node or not name then
        return nil
    end
    if node:getName() == name then
        return node
    end
    local children = node:getChildren()
    for _, child in ipairs(children) do
        local res = Ext.seekChildByName(child, name)
        if res then
            return res
        end
    end
    return nil
end

return Ext