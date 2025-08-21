local Loader = {}
Loader.__index = Loader

function Loader.new(root)
    assert(root, "Root instance required")
    return setmetatable({Root = root}, Loader)
end

function Loader:Get(moduleName)
    local module = self.Root:FindFirstChild(moduleName, true)
    assert(module, "Module not found: " .. moduleName)
    return require(module)
end

return Loader
