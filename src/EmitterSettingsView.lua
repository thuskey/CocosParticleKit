--
-- EmitterSettingsView.lua
-- 
-- luming
-- 2014年8月14日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'SettingsView'

--------------------------------------------------------------------------------
-- Constant

kEmitterSettingKeys = {
    'maxParticles',
    'duration',

    'angle',
    'angleVariance',

    'sourcePositionx',
    'sourcePositiony',
    'sourcePositionVariancex',
    'sourcePositionVariancey',

    'emissionRate',
    'emitterType',
}

kEmitterGravitySettingKeys = {
    'gravityx',
    'gravityy',

    'speed',
    'speedVariance',

    'radialAcceleration',
    'radialAccelVariance',

    'tangentialAcceleration',
    'tangentialAccelVariance',
}

kEmitterRadiusSettingKeys = {
    'maxRadius',
    'maxRadiusVariance',
    'minRadius',
    'minRadiusVariance',

    'rotatePerSecond',
    'rotatePerSecondVariance',
}

--------------------------------------------------------------------------------
-- Declaration
EmitterSettingsView = class('EmitterSettingsView', SettingsView)

--------------------------------------------------------------------------------
-- Property
EmitterSettingsView.gravityView = nil
EmitterSettingsView.radiusView = nil

--------------------------------------------------------------------------------
-- Function

function EmitterSettingsView:onPropertyValueChanged(propertyView)
    self.super.onPropertyValueChanged(self, propertyView)
    if 'emitterType' == propertyView.pKey then
        self:setEmitterMode(propertyView.pValue)
    end
end

function EmitterSettingsView:getSettingsCount()
    return #kEmitterSettingKeys
end

function EmitterSettingsView:getSettingsKeys()
    return kEmitterSettingKeys
end

function EmitterSettingsView:setParticleSystem(ps)
    self.super.setParticleSystem(self, ps)
    self:setupPropertyView(self.gravityView, kEmitterGravitySettingKeys)
    self:setupPropertyView(self.radiusView, kEmitterRadiusSettingKeys)
    self:setEmitterMode(ps.dict.emitterType.value)
end

function EmitterSettingsView:setEmitterMode(mode)
	if cc.PARTICLE_MODE_GRAVITY == mode then
		self.gravityView:setVisible(true)
		self.radiusView:setVisible(false)
	else
    	self.gravityView:setVisible(false)
	    self.radiusView:setVisible(true)
	end
end

function EmitterSettingsView:setupUI()
    local size = kDefaultPropertyViewSize
    local count_n = #kEmitterSettingKeys    -- normal settings count
    local count_s = math.max(#kEmitterGravitySettingKeys, #kEmitterRadiusSettingKeys)   -- sub settings max count
    
    self:setContentSize(size.width, size.height * (count_n + count_s))
    
    self.gravityView = cc.Layer:create()
    self.gravityView:setContentSize(cc.size(size.width, size.height * count_s))
    self:addChild(self.gravityView)

    self.radiusView = cc.Layer:create()
    self.radiusView:setContentSize(cc.size(size.width, size.height * count_s))
    self:addChild(self.radiusView)
end

return EmitterSettingsView