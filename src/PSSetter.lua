--
-- PSSetter.lua
-- Particle System Setter
-- luming
-- 2014年8月20日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

--------------------------------------------------------------------------------
-- Constant

local modname = ...
local P = {}
_G[modname] = P

local cc = _G.cc
local D  = _G.D

setfenv(1, P)

-- get dirty
local function d(dict, key)
    return dict[key].dirty
end

-- get value
local function v(dict, key)
    D('updateFromDict    %s : %s', key, dict[key].value)
    dict[key].dirty = false
    return dict[key].value
end

-- get color
local function c(dict, key)
    local rk = key .. 'Red'
    local gk = key .. 'Green'
    local bk = key .. 'Blue'
    local ak = key .. 'Alpha'
    return cc.c4f(v(dict, rk), v(dict, gk), v(dict, bk), v(dict, ak))
end

-- get point
local function p(dict, key)
    local xk = key .. 'x'
    local yk = key .. 'y'
    return cc.p(v(dict, xk), v(dict, yk))
end

-- set value
local function sv(self, dict, func, key)
    if d(dict, key) then
        self[func](self, v(dict, key))
    end
end
    
-- set color
local function sc(self, dict, func, key)
    if d(dict, key .. 'Red') or d(dict, key .. 'Green') or d(dict, key .. 'Blue') or d(dict, key .. 'Alpha') then
        self[func](self, c(dict, key))
    end
end
    
-- set point
local function sp(self, dict, func, key)
    if d(dict, key .. 'x') or d(dict, key .. 'y') then
        self[func](self, p(dict, key))
    end
end

-- create setter
local function create(func, arg)
    return {
        setter  = func,
        argment = arg,
    }
end

Normal = {
    maxParticles = create(sv, 'setTotalParticles'),
    duration = create(sv, 'setDuration'),

    angle = create(sv, 'setAngle'),
    angleVariance = create(sv, 'setAngleVar'),

-- blendFuncSource and blendFuncDestination has same setter, should be process specially 

    startColor = create(sc, 'setStartColor'),
    startColorVariance = create(sc, 'setStartColorVar'),
    finishColor = create(sc, 'setEndColor'),
    finishColorVariance = create(sc, 'setEndColorVar'),

    startParticleSize = create(sv, 'setStartSize'),
    startParticleSizeVariance = create(sv, 'setStartSizeVar'),
    finishParticleSize = create(sv, 'setEndSize'),
    finishParticleSizeVariance = create(sv, 'setEndSizeVar'),

    sourcePosition = create(sp, 'setSourcePosition'),
    sourcePositionVariance = create(sp, 'setPosVar'),

    rotationStart = create(sv, 'setStartSpin'),
    rotationStartVariance = create(sv, 'setStartSpinVar'),
    rotationEnd = create(sv, 'setEndSpin'),
    rotationEndVariance = create(sv, 'setEndSpinVar'),

    emitterType = create(sv, 'setEmitterMode'),

    particleLifespan = create(sv, 'setLife'),
    particleLifespanVariance = create(sv, 'setLifeVar'),

-- texture setter is special, should process specially

    blendAdditive = create(sv, 'setBlendAdditive'),
    emissionRate = create(sv, 'setEmissionRate'),
}

Gravity = {
    gravity = create(sp, 'setGravity'),

    speed = create(sv, 'setSpeed'),
    speedVariance = create(sv, 'setSpeedVar'),

    radialAcceleration = create(sv, 'setRadialAccel'),
    radialAccelVariance = create(sv, 'setRadialAccelVar'),

    tangentialAcceleration = create(sv, 'setTangentialAccel'),
    tangentialAccelVariance = create(sv, 'setTangentialAccelVar'),
}

Radius = {
    maxRadius = create(sv, 'setStartRadius'),
    maxRadiusVariance = create(sv, 'setStartRadiusVar'),
    minRadius = create(sv, 'setEndRadius'),
    minRadiusVariance = create(sv, 'setEndRadiusVar'),

    rotatePerSecond = create(sv, 'setRotatePerSecond'),
    rotatePerSecondVariance = create(sv, 'setRotatePerSecondVar'),
}

return P