require "Cocos2d"
require "Cocos2dConstants"


--------------------------------------------------------------------------------
-- avoid memory leak
local function initCG()
    collectgarbage("collect")
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
end


--------------------------------------------------------------------------------
-- add resources and scripts folder into search path
local function initLibs()
    cc.FileUtils:getInstance():addSearchResolutionsOrder('src')
    cc.FileUtils:getInstance():addSearchResolutionsOrder('res')

    require 'extern'
    require 'LogUtil'
    require 'Ext'

    --support debug
    local targetPlatform = cc.Application:getInstance():getTargetPlatform()
    if (cc.PLATFORM_OS_IPHONE == targetPlatform) or (cc.PLATFORM_OS_IPAD == targetPlatform) or
        (cc.PLATFORM_OS_ANDROID == targetPlatform) or (cc.PLATFORM_OS_WINDOWS == targetPlatform) or
        (cc.PLATFORM_OS_MAC == targetPlatform) then
--    require('debugger')()
    end
end


--------------------------------------------------------------------------------
-- config opengl view
local function initGL()
    local targetPlatform = cc.Application:getInstance():getTargetPlatform()
    local resolution = nil
    if (cc.PLATFORM_OS_IPHONE == targetPlatform) or (cc.PLATFORM_OS_ANDROID == targetPlatform) then
        resolution = cc.ResolutionPolicy.NO_BORDER
    else
        resolution = cc.ResolutionPolicy.SHOW_ALL
    end

    local glView = cc.Director:getInstance():getOpenGLView()
    glView:setDesignResolutionSize(1280, 720, resolution)
end


--------------------------------------------------------------------------------
-- config cocos2dx settings
local function initCocos()
	cc.Director:getInstance():setAnimationInterval(1 / 30)
end

--------------------------------------------------------------------------------
-- config custom game scene
local function initScene()

    require 'MainWindow'

    local scene = MainWindow:create()

    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(scene)
    else
        cc.Director:getInstance():runWithScene(scene)
    end
end


--------------------------------------------------------------------------------
local function main()
    initCG()
    initLibs()
    initGL()
    initCocos()
    initScene()
end


--------------------------------------------------------------------------------
-- for CCLuaEngine traceback
local function main_trackback(msg)
    E("----------------------------------------")
    E("LUA ERROR: " .. tostring(msg))
    E(debug.traceback())
    E("----------------------------------------")
    return msg
end


--------------------------------------------------------------------------------
local status, msg = xpcall(main, main_trackback)
if not status then
    error(msg)
end
