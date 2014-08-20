--
-- MainWindow.lua
-- 
-- luming
-- 2014年8月14日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'LogUtil'
require 'Ext'
require 'EmitterSettingsView'
require 'ParticleSettingsView'
require 'ColorSettingsView'
require 'TextureSettingsView'
require 'PS'

--------------------------------------------------------------------------------
-- Constant

--------------------------------------------------------------------------------
-- Declaration
MainWindow = class('MainWindow', function ()
	return cc.Scene:create()
end)

--------------------------------------------------------------------------------
-- Property
MainWindow.menuBar = nil
MainWindow.statusBar = nil
MainWindow.resourcePanel = nil
MainWindow.particleView = nil
MainWindow.settingSwitcher = nil
MainWindow.settingScroller = nil

MainWindow.emitterSettingsView = nil
MainWindow.particleSettingsView = nil
MainWindow.colorSettingsView = nil
MainWindow.textureSettingsView = nil

MainWindow.selectedParticleSystem = nil
MainWindow.particleSystems = nil

--------------------------------------------------------------------------------
-- Function

function MainWindow:onSettingSwitcherSelected(sender)
    local selectedColor = self.settingSwitcher.selectedColor
    local deselectColor = self.settingSwitcher.deselectColor
    local visibleSize   = cc.size(0, 0)
    
    self.settingSwitcher.emitterSwitcher:setBackGroundColor(deselectColor)
    self.settingSwitcher.particleSwitcher:setBackGroundColor(deselectColor)
    self.settingSwitcher.colorSwitcher:setBackGroundColor(deselectColor)
    self.settingSwitcher.textureSwitcher:setBackGroundColor(deselectColor)
    
    self.emitterSettingsView:setVisible(false)
    self.particleSettingsView:setVisible(false)
    self.colorSettingsView:setVisible(false)
    self.textureSettingsView:setVisible(false)
    
    if sender == self.settingSwitcher.emitterSwitcher
    then
        self.settingSwitcher.emitterSwitcher:setBackGroundColor(selectedColor)
        self.emitterSettingsView:setVisible(true)
        visibleSize = self.emitterSettingsView:getContentSize()
    elseif sender == self.settingSwitcher.particleSwitcher
    then
        self.settingSwitcher.particleSwitcher:setBackGroundColor(selectedColor)
        self.particleSettingsView:setVisible(true)
        visibleSize = self.particleSettingsView:getContentSize()
    elseif sender == self.settingSwitcher.colorSwitcher
    then
        self.settingSwitcher.colorSwitcher:setBackGroundColor(selectedColor)
        self.colorSettingsView:setVisible(true)
        visibleSize = self.colorSettingsView:getContentSize()
    elseif sender == self.settingSwitcher.textureSwitcher
    then
        self.settingSwitcher.textureSwitcher:setBackGroundColor(selectedColor)
        self.textureSettingsView:setVisible(true)
        visibleSize = self.textureSettingsView:getContentSize()
    else
        W('unknow sender') 
        return
	end
	
	D('Visible Size %f, %f', visibleSize.width, visibleSize.height)
	
	self.settingScroller:setInnerContainerSize(visibleSize)
end

function MainWindow:setupUI()
    local rootnode = ccs.NodeReader:getInstance():createNode('res/ParticleKit_MainWindow.json')
    self:addChild(rootnode)
    
    local rootpanel = rootnode:getChildByName('Panel')
    
    self.menuBar = rootpanel:getChildByName('Panel_MenuBar')
    self.statusBar = rootpanel:getChildByName('Panel_StatusBar')
    self.resourcePanel = rootpanel:getChildByName('Panel_ResourcePanel')
    self.particleView = rootpanel:getChildByName('Panel_ParticleView')
    self.settingSwitcher = rootpanel:getChildByName('Panel_SettingSwitcherBar')
    self.settingScroller = rootpanel:getChildByName('ScrollView_SettingScroller')
    
    do
        self.menuBar.openButton = self.menuBar:getChildByName('Button_OpenPlist')
        self.menuBar.saveButton = self.menuBar:getChildByName('Button_SavePlist')
    end
    
    do
    	self.emitterSettingsView = EmitterSettingsView:create()
    	self.particleSettingsView = ParticleSettingsView:create()
    	self.colorSettingsView = ColorSettingsView:create()
    	self.textureSettingsView = TextureSettingsView:create()
    	
    	self.settingScroller:addChild(self.emitterSettingsView)
    	self.settingScroller:addChild(self.particleSettingsView)
        self.settingScroller:addChild(self.colorSettingsView)
        self.settingScroller:addChild(self.textureSettingsView)        
    end
    
    do
        self.settingSwitcher.selectedColor = cc.c3b(0x3A, 0x3E, 0x4D)
        self.settingSwitcher.deselectColor = cc.c3b(0x96, 0xC8, 0xFF)
        
        self.settingSwitcher.emitterSwitcher = self.settingSwitcher:getChildByName('Panel_EmitterSwitcher')
        self.settingSwitcher.particleSwitcher = self.settingSwitcher:getChildByName('Panel_ParticleSwitcher')
        self.settingSwitcher.colorSwitcher = self.settingSwitcher:getChildByName('Panel_ColorSwitcher')
        self.settingSwitcher.textureSwitcher = self.settingSwitcher:getChildByName('Panel_TextureSwitcher')
        
        self:onSettingSwitcherSelected(self.settingSwitcher.emitterSwitcher)
    end
end

function MainWindow:setupListener()

    -- TODO : Open Plist
	do
	end
	
	-- TODO : Save Plist
    do
    end
    
    
    -- TODO : 
    do
        local function switcherTouchHandler(sender, event)
        	if event == ccui.TouchEventType.ended then
        		self:onSettingSwitcherSelected(sender)
        	end
        end
        self.settingSwitcher.emitterSwitcher:addTouchEventListener(switcherTouchHandler)
        self.settingSwitcher.particleSwitcher:addTouchEventListener(switcherTouchHandler)
        self.settingSwitcher.colorSwitcher:addTouchEventListener(switcherTouchHandler)
        self.settingSwitcher.textureSwitcher:addTouchEventListener(switcherTouchHandler)
    end
    
    -- TODO : 
    do
        
    end
    
    -- TODO : 
    do
        
    end
    
    -- TODO : 
    do
        
    end
end

function MainWindow:setupParticleSystems()
    local csize = self.particleView:getContentSize()
    local ps = PS:create()
    ps:setAnchorPoint(0.5, 0.5)
    ps:setPosition(csize.width * 0.5, csize.height * 0.5)
	self.particleView:addChild(ps)
	
    self.particleSystems = {ps}
    self.selectedParticleSystem = ps
    
    self.emitterSettingsView:setParticleSystem(ps)
    self.particleSettingsView:setParticleSystem(ps)
    self.colorSettingsView:setParticleSystem(ps)
    self.textureSettingsView:setParticleSystem(ps)
end

function MainWindow:init()
	self:setupUI()
	self:setupListener()
	self:setupParticleSystems()
end

function MainWindow:create()
	local instance = MainWindow.new()
	instance:init()
	return instance
end

return MainWindow