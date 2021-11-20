require("LuaClass")

------------------------------------------

Vec3 = class(nil, {
    x = 0,
    y = 0,
    z = 0
})

function Vec3:length()
    return math.sqrt((self.x * self.x) + (self.y * self.y) + (self.z * self.z))
end

vec3 = Vec3:new({x = 1, y = 2, z = 3})
print(vec3:length())

------------------------------------------
Vec4 = class(Vec3, {
    w = 4
})

function Vec4:length()
    return math.sqrt((self.x * self.x) + (self.y * self.y) + (self.z * self.z) + (self.w * self.w))
end

vec4 = Vec4:new({x = 1, y = 2, z = 3, w = 4})
print(vec4:length())

------------------------------------------
print(vec4:isInstance(Vec3))
