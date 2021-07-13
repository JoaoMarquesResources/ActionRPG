/// @description Essential Entity Setup
z = 0;
flash = 0;
lifted = 0;
thrown = 0;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
entityDropList = -1;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));