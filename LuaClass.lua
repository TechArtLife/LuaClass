-- LuaClass.lua
-- 实现Lua中的类概念
function class(baseClass, body)
    local ret = body or {}

    if (baseClass ~= nil) then
        setmetatable(ret, ret)
        ret.__index = baseClass
        ret.base = baseClass
    end

    -- 使用__index元方法创建对象
    ret.new = function (self, constructionData, originalSubClass)
        local obj
        if (self.__index ~= nil) then
            if (originalSubClass ~= nil) then
                obj = self.__index:new(constructionData, originalSubClass)
            else
                obj = self.__index:new(constructionData, self)
            end
        else
            obj = constructionData or {}
        end

        setmetatable(obj, obj)

        -- 设置读取对象属性/方法时的查找表，也就是类
        obj.__index = self

        -- 复制操作运算符
        if (self.__operators ~= nil) then
            for key, value in pairs(self.__operators) do
                obj[key] = value
            end
        end

        return obj
    end

    ret.isInstance = function (self, otherClass)
        local cls = self.__index
        while cls do
            if cls == otherClass then
                return true
            end
            -- 递归查找
            cls = cls.base
        end

        return false
    end

    return ret
end
