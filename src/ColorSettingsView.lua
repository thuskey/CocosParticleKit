--
-- ColorSettingsView.lua
-- 
-- luming
-- 2014年8月14日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'SettingsView'

--------------------------------------------------------------------------------
-- Constant

kColorSettingKeys = {
    'blendFuncSource',
    'blendFuncDestination',
    'blendAdditive',
    
    'startColorRed',
    'startColorGreen',
    'startColorBlue',
    'startColorAlpha',
    
    'startColorVarianceRed',
    'startColorVarianceGreen',
    'startColorVarianceBlue',
    'startColorVarianceAlpha',
    
    'finishColorRed',
    'finishColorGreen',
    'finishColorBlue',
    'finishColorAlpha',
    
    'finishColorVarianceRed',
    'finishColorVarianceGreen',
    'finishColorVarianceBlue',
    'finishColorVarianceAlpha',
}

--------------------------------------------------------------------------------
-- Declaration
ColorSettingsView = class('ColorSettingsView', SettingsView)

--------------------------------------------------------------------------------
-- Property

--------------------------------------------------------------------------------
-- Function

function ColorSettingsView:getSettingsCount()
    return #kColorSettingKeys
end

function ColorSettingsView:getSettingsKeys()
    return kColorSettingKeys
end

return ColorSettingsView