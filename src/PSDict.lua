--
-- PSDict.lua
-- 
-- luming
-- 2014年8月18日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'PDict'

PSDict = {
    maxParticles = PDict.create(
        kPType.integer, 
        'Maximum Particles', 
        300,
        0,
        0, 
        500
    ),
    --    configName = nil,
    duration = PDict.create(
        kPType.real, 
        'Duration',
        -1.00, 
        0.00, 
        -1.00, 
        1000.00
    ),

    angle = PDict.create(
        kPType.real, 
        'Angle',
        90.00, 
        0.00,  
        0.00, 
        360.00
    ),
    angleVariance = PDict.create(
        kPType.real, 
        'Angle Variance',
        360.00, 
        0.00, 
        0.00, 
        360.00
    ),

    blendFuncSource = PDict.create(
        kPType.integer, 
        'Blend Source',
        1, 
        1, 
        nil, 
        nil,
        'GL_ONE',
        {
            [0]      = 'GL_ZERO',
            [1]      = 'GL_ONE',
            [0x0300] = 'GL_SRC_COLOR',
            [0x0301] = 'GL_ONE_MINUS_SRC_COLOR',
            [0x0302] = 'GL_SRC_ALPHA',
            [0x0303] = 'GL_ONE_MINUS_SRC_ALPHA',
            [0x0304] = 'GL_DST_ALPHA',
            [0x0305] = 'GL_ONE_MINUS_DST_ALPHA',
            [0x0306] = 'GL_DST_COLOR',
            [0x0307] = 'GL_ONE_MINUS_DST_COLOR',
            [0x0308] = 'GL_SRC_ALPHA_SATURATE',
        }
    ),
    blendFuncDestination = PDict.create(
        kPType.integer, 
        'Blend Destination',
        0x0303, 
        0x0303, 
        nil, 
        nil,
        'GL_ONE_MINUS_SRC_ALPHA',
        {
            [0]      = 'GL_ZERO',
            [1]      = 'GL_ONE',
            [0x0300] = 'GL_SRC_COLOR',
            [0x0301] = 'GL_ONE_MINUS_SRC_COLOR',
            [0x0302] = 'GL_SRC_ALPHA',
            [0x0303] = 'GL_ONE_MINUS_SRC_ALPHA',
            [0x0304] = 'GL_DST_ALPHA',
            [0x0305] = 'GL_ONE_MINUS_DST_ALPHA',
            [0x0306] = 'GL_DST_COLOR',
            [0x0307] = 'GL_ONE_MINUS_DST_COLOR',
            [0x0308] = 'GL_SRC_ALPHA_SATURATE',
        }
    ),

    startColorRed = PDict.create(
        kPType.real, 
        'Start Color Red',
        0.50, 
        0.00,
        0.00, 
        1.00
    ),
    startColorGreen = PDict.create(
        kPType.real, 
        'Start Color Green',
        0.50, 
        0.00,
        0.00, 
        1.00
    ),
    startColorBlue = PDict.create(
        kPType.real, 
        'Start Color Blue',
        0.50, 
        0.00,
        0.00, 
        1.00
    ),
    startColorAlpha = PDict.create(
        kPType.real, 
        'Start Color Alpha',
        1.00, 
        1.00,
        0.00, 
        1.00
    ),

    startColorVarianceRed = PDict.create(
        kPType.real, 
        'Start Color Red Variance',
        0.50, 
        0.00,
        0.00, 
        1.00
    ),
    startColorVarianceGreen = PDict.create(
        kPType.real, 
        'Start Color Green Variance',
        0.50, 
        0.00,
        0.00, 
        1.00
    ),
    startColorVarianceBlue = PDict.create(
        kPType.real, 
        'Start Color Blue Variance',
        0.50, 
        0.00,
        0.00, 
        1.00
    ),
    startColorVarianceAlpha = PDict.create(
        kPType.real, 
        'Start Color Alpha Variance',
        1.00, 
        0.00,
        0.00, 
        1.00
    ),

    finishColorRed = PDict.create(
        kPType.real, 
        'End Color Red', 
        0.10, 
        0.00,
        0.00, 
        1.00
    ),
    finishColorGreen = PDict.create(
        kPType.real, 
        'End Color Green',
        0.10, 
        0.00,
        0.00, 
        1.00
    ),
    finishColorBlue = PDict.create(
        kPType.real, 
        'End Color Blue',
        0.10, 
        0.00,
        0.00, 
        1.00
    ),
    finishColorAlpha = PDict.create(
        kPType.real, 
        'End Color Alpha',
        0.20, 
        1.00,
        0.00, 
        1.00
    ),

    finishColorVarianceRed = PDict.create(
        kPType.real, 
        'End Color Red Variance',
        0.10, 
        0.00,
        0.00, 
        1.00
    ),
    finishColorVarianceGreen = PDict.create(
        kPType.real, 
        'End Color Green Variance',
        0.10, 
        0.00,
        0.00, 
        1.00
    ),
    finishColorVarianceBlue = PDict.create(
        kPType.real, 
        'End Color Blue Variance',
        0.10, 
        0.00,
        0.00, 
        1.00
    ),
    finishColorVarianceAlpha = PDict.create(
        kPType.real, 
        'End Color Alpha Variance',
        0.20, 
        0.00,
        0.00, 
        1.00
    ),

    startParticleSize = PDict.create(
        kPType.real, 
        'Start Size',
        30.00, 
        0.00, 
        0.00, 
        512.00
    ),
    startParticleSizeVariance = PDict.create(
        kPType.real, 
        'Start Size Variance',
        0.00,  
        0.00, 
        0.00, 
        512.00
    ),
    finishParticleSize = PDict.create(
        kPType.real, 
        'End Size',
        -1.00,  
        0.00, 
        -1.00, 
        512.00
    ),
    finishParticleSizeVariance = PDict.create(
        kPType.real, 
        'End Size Variance',
        0.00,  
        0.00, 
        0.00, 
        512.00
    ),

    sourcePositionx = PDict.create(
        kPType.real, 
        'Source Position X',
        160.00,  
        0.00, 
        0.00, 
        2048.00
    ),
    sourcePositiony = PDict.create(
        kPType.real, 
        'Source Position Y',
        240.00,  
        0.00, 
        0.00, 
        2048.00
    ),
    sourcePositionVariancex = PDict.create(
        kPType.real, 
        'Source Position Variance X',
        0.00,  
        0.00, 
        0.00, 
        2048.00
    ),
    sourcePositionVariancey = PDict.create(
        kPType.real, 
        'Source Position Variance Y',
        0.00,  
        0.00, 
        0.00, 
        2048.00
    ),

    rotationStart = PDict.create(
        kPType.real, 
        'Start Rotation',
        0.00,  
        0.00, 
        0.00, 
        360.00
    ),
    rotationStartVariance = PDict.create(
        kPType.real, 
        'Start Rotation Variance',
        0.00,  
        0.00, 
        0.00, 
        360.00
    ),
    rotationEnd = PDict.create(
        kPType.real, 
        'End Rotation',
        0.00,  
        0.00, 
        0.00, 
        360.00
    ),
    rotationEndVariance = PDict.create(
        kPType.real, 
        'End Rotation Variance',
        2000.00,  
        0.00, 
        0.00, 
        360.00
    ),

    emitterType = PDict.create(
        kPType.integer, 
        'Type',
        0,  
        0, 
        nil, 
        nil, 
        'Gravity', 
        {
            [0] = 'Gravity',
            [1] = 'Radius',
        }
    ),

    --------------------------
    -- Gravity
    gravityx = PDict.create(
        kPType.real, 
        'X Gravity',
        0.00, 
        0.00, 
        -2000.00, 
        2000.00
    ),
    gravityy = PDict.create(
        kPType.real, 
        'Y Gravity',
        0.00, 
        0.00, 
        -2000.00, 
        2000.00
    ),

    speed = PDict.create(
        kPType.real, 
        'Speed',
        160.00, 
        0.00, 
        0.00, 
        2000.00
    ),
    speedVariance = PDict.create(
        kPType.real, 
        'Speed Variance',
        20.00,  
        0.00, 
        0.00, 
        2000.00
    ),

    radialAcceleration = PDict.create(
        kPType.real, 
        'Radial Acceleration',
        -120.00,  
        0.00, 
        -2000.00, 
        2000.00
    ),
    radialAccelVariance = PDict.create(
        kPType.real, 
        'Radial Acceleration Variance',
        0.00,  
        0.00, 
        -2000.00, 
        2000.00
    ),

    tangentialAcceleration = PDict.create(
        kPType.real, 
        'Tangential Acceleration',
        30.00,  
        0.00, 
        -2000.00, 
        2000.00
    ),
    tangentialAccelVariance = PDict.create(
        kPType.real, 
        'Tangential Acceleration Variance',
        0.00,  
        0.00, 
        -2000.00, 
        2000.00
    ),

    --    rotationIsDir = '',
    --------------------------

    --------------------------
    -- Radius
    maxRadius = PDict.create(
        kPType.real, 
        'Maximum Radius',
        0.00,  
        0.00, 
        0.00, 
        1000.00
    ),
    maxRadiusVariance = PDict.create(
        kPType.real, 
        'Maximum Radius Variance',
        0.00,  
        0.00, 
        0.00, 
        1000.00
    ),
    minRadius = PDict.create(
        kPType.real, 
        'Minimum Radius',
        300.00, 
        0.00, 
        0.00, 
        1000.00
    ),
    minRadiusVariance = PDict.create(
        kPType.real, 
        'Minimum Radius Variance',
        0.00,  
        0.00, 
        0.00, 
        1000.00
    ),

    rotatePerSecond = PDict.create(
        kPType.real, 
        'Degrees Per Second',
        360.00, 
        0.00, 
        -1000.00, 
        1000.00
    ),
    rotatePerSecondVariance = PDict.create(
        kPType.real, 
        'Degrees Per Second Variance',
        0.00,  
        0.00, 
        -1000.00, 
        1000.00
    ),
    --------------------------

    particleLifespan = PDict.create(
        kPType.real, 
        'Lifespan',
        3.00,  
        0.00, 
        0.00, 
        10.00
    ),
    particleLifespanVariance = PDict.create(
        kPType.real, 
        'Lifespan Variance',
        1.00,  
        0.00, 
        0.00, 
        10.00
    ),

    textureFileName = PDict.create(
        kPType.string, 
        'Texture File Name', 
        'DefaultParticleTexture.png',
        nil,
        nil,
        nil,
        nil,
        nil
    ),
    textureImageData = PDict.create(
        kPType.data, 
        'Texture Data', 
        'H4sIAAAAAAAAAwFmA5n8iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADLUlEQVRYCcXX51JbQRCEUeOc/f6v6ZzxHKFPLAoI84epmrp7985294QVxcXl5eWjh7Sn9yB/MWcej19sXQb87/iP8f+yiztWAOmzcYL5k/F9AX9m7/fWf83zTmLOVeD5AHECWieiKpR95D8nlhPcepbH7TYBL+dI/mrWRCRkrQIBZY9Q5vzb+PdxQj2P2ikBCPnrxb0TRMQpAYiRIa9lVcregR0TgATZm/G3W7cmxn5VaA6qQNkjEkNAMbPcDOpBJfYF6DMByJC/H3+3XSfC97IziATov8FD8HUcDmzZs+bETSF0Z+cEICeCE0TYOQFlHznSZoTQkwIc5PW+FqwC7NUGVagCXTvlXzNHXnXE5LsrulYAYFduX4Ts11b4LlaWlbXBWzNH2GxojzN4jgogJgENYreganyYGELsq1YCAOp9CZX5eivEwy9mltcvPvqwirBHSGKIQE6Eitg35forO5mxSo5cDJyVHIf3TRVSIxNgiUgIUO5Abel2qII4hLJnSk5M7XC2rMPGU5s2APO++11PiKBVUECEyAq5athHyvS6TO2vhOHB72/ILK+VtHnb0+EEAkeiLZGV2UpyG94cvRbgh+KcGyzenZb5l3FPbbBfzDks3zcmE9aBCIBF1FCt16meO98M6L3BEpeohIUHP65ZXvXJM2IH8oCAATZYiJWc+a7swJF/HvddnHjnuLgwE4RvY1XAAVMuwAHvHPA61cUDNnD6DUws8k/j2kJEZ8NahdjbWIBeVvJIgSISh4yJ8931SgBwpMhVwtPZKiIeaSJmeWWrgMolENh6pSKXrTjftcKU66m9ziViFSI+AWJ3tgoQADTwrtdKLvvinE2AfcAylTXyj9tn1UiE8ztbBdhUIiD2u9ez3PS5LP0QJe6UgKpgJhpOuPBv2DEBMubAmbI3H0BqDYEJcBOAy06mqpCI/xIw5zYViFx/gZc98IZyX0DtITIR+4M4n27afgX6CgB52dffsq9FawWqkipUCWLyWR7aKQEiHVwFuHbrX7batApNRO3wPOj77O3swf8zuquAneJZaEPZ14KqcOOKrYdOre8j4BTWvfZl8qD2D7ghcomuE8XXAAAAAElFTkSuQmCCksg8PmYDAAA=',
        nil,
        nil,
        nil,
        nil,
        nil
    ),
    blendAdditive = PDict.create(
        kPType.bool, 
        'Blend Additive', 
        false, 
        false, 
        nil, 
        nil, 
        'False', 
        {
            [true] = 'True',
            [false] = 'False',
        }
    ),
    emissionRate = PDict.create(
        kPType.real,
        'Emission Rate', 
        100, 
        100, 
        0, 
        1000
    ),

--    yCoordFlipped = '',
}

return PSDict