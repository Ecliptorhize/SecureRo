local HttpService = game:GetService("HttpService")

local ScanService = {}
ScanService.API_URL = "http://localhost:3000/scan"

function ScanService:ScanSource(source)
    local ok, response = pcall(function()
        return HttpService:PostAsync(self.API_URL, HttpService:JSONEncode({source = source}))
    end)
    if not ok then
        return {success = false, error = response}
    end
    return HttpService:JSONDecode(response)
end

function ScanService:ScanScript(scriptInstance)
    return self:ScanSource(scriptInstance.Source)
end

return ScanService
