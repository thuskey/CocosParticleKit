--
-- TextureSettingsView.lua
-- 
-- luming
-- 2014年8月14日
-- Copyright (c) 2014, kevin_loo@live.cn All Rights Reserved.
--

require 'extern'
require 'SettingsView'

--------------------------------------------------------------------------------
-- Constant

--------------------------------------------------------------------------------
-- Declaration
TextureSettingsView = class('TextureSettingsView', SettingsView)

--------------------------------------------------------------------------------
-- Property

TextureSettingsView.imageView = nil
TextureSettingsView.button = nil

--------------------------------------------------------------------------------
-- Function

function TextureSettingsView:updateImageView(file)
	self.imageView:loadTexture(file, ccui.TextureResType.localType)
end

function TextureSettingsView:setParticleSystem(ps)
    self.super.setParticleSystem(self, ps)
    self:updateImageView(ps.dict.textureFileName.value)
end

function TextureSettingsView:setupUI()
    local rootnode = ccs.NodeReader:getInstance():createNode('res/ParticleKit_TextureSettingsView.json')
    self:addChild(rootnode)

    local rootpanel = rootnode:getChildByName('Panel')
    self:setContentSize(rootpanel:getContentSize())
    
    self.imageView = rootpanel:getChildByName('ImageView_Texture')
    self.button = rootpanel:getChildByName('Button_ChangeTexture')
end

function TextureSettingsView:setupListener()
--	ccui.Button
    self.button:setTouchEnabled(true)
    self.button:addTouchEventListener(function (sender, event)
        if event == ccui.TouchEventType.ended then
            D('change texture button clicked')
        end
    end)
end

function TextureSettingsView:init()
    self.super.init(self)
    self:setupListener()	
end

return TextureSettingsView