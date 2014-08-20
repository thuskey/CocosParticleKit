--
-- ParticleSettingsView.lua
-- 
-- luming
-- 2014年8月14日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'SettingsView'

--------------------------------------------------------------------------------
-- Constant

kParticleSettingKeys = {
    'particleLifespan',
    'particleLifespanVariance',
    
    'startParticleSize',
    'startParticleSizeVariance',
    
    'finishParticleSize',
    'finishParticleSizeVariance',
    
    'rotationStart',
    'rotationStartVariance',
    
    'rotationEnd',
    'rotationEndVariance',
}

--------------------------------------------------------------------------------
-- Declaration
ParticleSettingsView = class('ParticleSettingsView', SettingsView)

--------------------------------------------------------------------------------
-- Property

--------------------------------------------------------------------------------
-- Function

function ParticleSettingsView:getSettingsCount()
    return #kParticleSettingKeys
end

function ParticleSettingsView:getSettingsKeys()
    return kParticleSettingKeys
end

return ParticleSettingsView