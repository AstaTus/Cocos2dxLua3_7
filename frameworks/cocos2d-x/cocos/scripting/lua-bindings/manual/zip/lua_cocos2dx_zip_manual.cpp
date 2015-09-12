#include "lua_cocos2dx_zip_manual.hpp"
#include "ZipUtils.h"
#include "tolua_fix.h"
#include "LuaBasicConversions.h"


int lua_cocos2dx_zip_ZipFile_fileExists(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::ZipFile* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.ZipFile",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::ZipFile*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_zip_ZipFile_fileExists'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.ZipFile:fileExists");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_cocos2dx_zip_ZipFile_fileExists'", nullptr);
            return 0;
        }
        bool ret = cobj->fileExists(arg0);
        tolua_pushboolean(tolua_S,(bool)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cc.ZipFile:fileExists",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_zip_ZipFile_fileExists'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_zip_ZipFile_getFileData(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::ZipFile* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.ZipFile",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::ZipFile*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_zip_ZipFile_getFileData'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.ZipFile:getFileData");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_cocos2dx_zip_ZipFile_getFileData'", nullptr);
            return 0;
        }

		ssize_t size = 0;
        unsigned char* buffer = cobj->getFileData(arg0, &size);
		if (buffer && size)
		{
			lua_pushlstring(tolua_S, (char*)buffer, size);
		}
		else
		{
			luaL_error(tolua_S, "function 'lua_cocos2dx_zip_ZipFile_getFileData' arg0=%s, buffer=%d, size=%d", arg0.c_str(), buffer, &size);
			lua_pushnil(tolua_S);
		}

		if (buffer) 
			delete[] buffer;

        return 1;
    }

    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cc.ZipFile:getFileData",argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_zip_ZipFile_getFileData'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_zip_ZipFile_getFirstFilename(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::ZipFile* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.ZipFile",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::ZipFile*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_zip_ZipFile_getFirstFilename'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_cocos2dx_zip_ZipFile_getFirstFilename'", nullptr);
            return 0;
        }
        std::string ret = cobj->getFirstFilename();
        tolua_pushcppstring(tolua_S,ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cc.ZipFile:getFirstFilename",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_zip_ZipFile_getFirstFilename'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_zip_ZipFile_getNextFilename(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::ZipFile* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.ZipFile",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::ZipFile*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_zip_ZipFile_getNextFilename'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_cocos2dx_zip_ZipFile_getNextFilename'", nullptr);
            return 0;
        }
        std::string ret = cobj->getNextFilename();
        tolua_pushcppstring(tolua_S,ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cc.ZipFile:getNextFilename",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_zip_ZipFile_getNextFilename'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_zip_ZipFile_setFilter(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::ZipFile* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"cc.ZipFile",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (cocos2d::ZipFile*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_zip_ZipFile_setFilter'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        std::string arg0;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.ZipFile:setFilter");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_cocos2dx_zip_ZipFile_setFilter'", nullptr);
            return 0;
        }
        bool ret = cobj->setFilter(arg0);
        tolua_pushboolean(tolua_S,(bool)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cc.ZipFile:setFilter",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_zip_ZipFile_setFilter'.",&tolua_err);
#endif

    return 0;
}

int lua_cocos2dx_zip_ZipFile_constructor(lua_State* tolua_S)
{
    int argc = 0;
    cocos2d::ZipFile* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif



    argc = lua_gettop(tolua_S)-1;
    if (argc == 2) 
    {
        std::string arg0;
        std::string arg1;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "cc.ZipFile:ZipFile");

        ok &= luaval_to_std_string(tolua_S, 3,&arg1, "cc.ZipFile:ZipFile");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_cocos2dx_zip_ZipFile_constructor'", nullptr);
            return 0;
        }
        cobj = new cocos2d::ZipFile(arg0, arg1);
        tolua_pushusertype(tolua_S,(void*)cobj,"cc.ZipFile");
        tolua_register_gc(tolua_S,lua_gettop(tolua_S));
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "cc.ZipFile:ZipFile",argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_zip_ZipFile_constructor'.",&tolua_err);
#endif

    return 0;
}

static int lua_cocos2dx_zip_ZipFile_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (ZipFile)");
    return 0;
}

int lua_register_cocos2dx_zip_ZipFile(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"cc.ZipFile");
    tolua_cclass(tolua_S,"ZipFile","cc.ZipFile","",nullptr);

    tolua_beginmodule(tolua_S,"ZipFile");
        tolua_function(tolua_S,"new",lua_cocos2dx_zip_ZipFile_constructor);
        tolua_function(tolua_S,"fileExists",lua_cocos2dx_zip_ZipFile_fileExists);
        tolua_function(tolua_S,"getFileData",lua_cocos2dx_zip_ZipFile_getFileData);
        tolua_function(tolua_S,"getFirstFilename",lua_cocos2dx_zip_ZipFile_getFirstFilename);
        tolua_function(tolua_S,"getNextFilename",lua_cocos2dx_zip_ZipFile_getNextFilename);
        tolua_function(tolua_S,"setFilter",lua_cocos2dx_zip_ZipFile_setFilter);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(cocos2d::ZipFile).name();
    g_luaType[typeName] = "cc.ZipFile";
    g_typeCast["ZipFile"] = "cc.ZipFile";
    return 1;
}
TOLUA_API int register_all_cocos2dx_zip(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,"cczip",0);
	tolua_beginmodule(tolua_S,"cczip");

	lua_register_cocos2dx_zip_ZipFile(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

