CocosParticleKit
================

Particle system designer, implement with cocos2dx 3.2 lua

###TODO:
- Open Plist File : The logic has been implementation, but dialog to open file need be implemented
- Save to Plist File : same as above ...
- Open Texture Image File : same as above ... damned
- Add Multi Emitter : ParticleSystem is not singleton, so extention will be easy

###Required:
- cocos2dx 3.2

###Usage:
- Download cocos2dx 3.2 and install any dependence
- Make a new Lua project, like:```cocos new ParticleKit -p org.cocos2d-x.ps -l lua```
- Copy the `res` and `src` into new project directory, replace the old file
- Run the new project, like:```cocos run -s ./ParticleKit -p mac```

####Tips:
- The project used by me is make from official cocos2dx 3.2 code, just fix a bug of glfw in GLView in platform/desktop folder to let key detection correctly.