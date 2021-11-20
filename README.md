# LuaClass

Simple lua class impl in one lua file.

## Usage

1. Download `LuaClass.lua` file and put in your project.

2. Import `LuaClass` in front of your code.
    ```lua
    require("LuaClass")
    ```

3. Use function `YourClassName = class(baseClass, attrsDict)` to create a new class. Then define class member methods use `function YourClassName:memberMethod() end`.
    ```lua
    Vec3 = class(nil, {
        x = 0,
        y = 0,
        z = 0
    })

    function Vec3:length()
        return math.sqrt((self.x * self.x) + (self.y * self.y) + (self.z * self.z))
    end
    ```

4. Use function `YourClassName:new(attrsDict)` to create a class instance.
    ```lua
    vec3 = Vec3:new({x = 1, y = 2, z = 3})
    print(vec3:length())
    ```
