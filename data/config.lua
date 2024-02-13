return {
    items = {
        wheelClamp = 'wheelclamp',
        wheelClampRemover = 'clampkey',
        welder = 'schweissgeraet'
    },
    permissions = {
        wheelClamp = {
            ['police'] = 3,
            ['fbi'] = 0
        },
        wheelClampRemover = {
            ['police'] = 3,
            ['fbi'] = 1
        }
    },
    durations = {
        wheelClamp = 5000,
        wheelClampRemoval = 5000,
        welder = 5000
    },
    factionNotifys = {
        wheelClamp = true,
        wheelClampRemoval = true
    }
}