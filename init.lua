shared = {
    resource = GetCurrentResourceName(),
    framework = GetConvar('mdevelopment:framework', 'esx')
}

if IsDuplicityVersion() then
    server = {}
else
    client = {
        interactionDistance = 5.0
    }
end

if not lib then
    return error('ox_lib was not found!')
end

settings = require 'data.config'

if lib.context == 'server' then
    local currentVersion = GetResourceMetadata(shared.resource, 'version', 0)
    if currentVersion == 'Development Build' then
        warn(("You are running a development build of the '%s' System. Please do not use this in production."):format(shared.resource))
    end
    return require 'server'
end

require 'client'