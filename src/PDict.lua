--
-- PDict.lua
-- Property Dict
-- luming
-- 2014年8月18日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

--------------------------------------------------------------------------------
-- Constant
kPType = {
    integer = 1,
    real = 2,
    bool = 3,
    string = 4,
    data = 5,
}

--------------------------------------------------------------------------------
-- Declaration
PDict = {}

--------------------------------------------------------------------------------
-- Property
PDict.type = nil
PDict.name = nil
PDict.value = nil
PDict.vdesc = nil
PDict.default = nil
PDict.min = nil
PDict.max = nil
PDict.vlist = nil
PDict.dirty = nil

--------------------------------------------------------------------------------
-- Function
PDict.create = function (type, name, value, default, min, max, vdesc, vlist)
    local dict = {}
    dict.type = type
    dict.name = name
    dict.value = value
    dict.default = default
    dict.min = min
    dict.max = max
    dict.vdesc = vdesc
    dict.vlist = vlist
    dict.dirty = true
    return dict
end

return PDict