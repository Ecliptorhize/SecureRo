--!strict
local HttpService = game:GetService("HttpService")
local Selection = game:GetService("Selection")

local function scanSelectedScripts()
    for _, instance in ipairs(Selection:Get()) do
        if instance:IsA("LuaSourceContainer") then
            local code = instance.Source
            local payload = HttpService:JSONEncode({ code = code })
            local success, response = pcall(function()
                return HttpService:PostAsync(
                    "http://localhost:3000/scan",
                    payload,
                    Enum.HttpContentType.ApplicationJson,
                    false
                )
            end)
            if success then
                local data = HttpService:JSONDecode(response)
                if #data.issues > 0 then
                    print("Issues found in " .. instance:GetFullName())
                    for _, issue in ipairs(data.issues) do
                        print("Line " .. issue.line .. ": " .. issue.message)
                    end
                else
                    print("No issues found in " .. instance:GetFullName())
                end
            else
                warn("Scan failed: " .. response)
            end
        end
    end
end

local toolbar = plugin:CreateToolbar("SecureRo")
local button = toolbar:CreateButton("Scan", "Scan selected scripts", "")
button.Click:Connect(scanSelectedScripts)
