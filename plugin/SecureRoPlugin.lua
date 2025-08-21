--!strict
local Selection = game:GetService("Selection")
local Loader = require(game:GetService("ReplicatedStorage"):WaitForChild("SecureRo"))
local ScanService = Loader:Get("ScanService")

local function scanSelectedScripts()
    for _, instance in ipairs(Selection:Get()) do
        if instance:IsA("LuaSourceContainer") then
            local result = ScanService:ScanScript(instance)
            if result.error then
                warn("Scan failed: " .. result.error)
            elseif #result.issues > 0 then
                print("Issues found in " .. instance:GetFullName())
                for _, issue in ipairs(result.issues) do
                    print("Line " .. issue.line .. ": " .. issue.message)
                end
            else
                print("No issues found in " .. instance:GetFullName())
            end
        end
    end
end

local toolbar = plugin:CreateToolbar("SecureRo")
local button = toolbar:CreateButton("Scan", "Scan selected scripts", "")
button.Click:Connect(scanSelectedScripts)
