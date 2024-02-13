📑Description
This script provides you with the ability to put on wheelclamps to vehicles.

💡Features
- Put and remove wheelclamps via items
- Limit the usage of those items via jobs and grades
- Weld the wheelclamp of the car (certain success chance)
- Saving and setting the state via DB
- No Framework required (qb and esx ready, may have to configure the bridge if using another one)

📋Installation
Respect the following start-order:
```
setr mdevelopment:framework "esx" # esx, qb
setr ox:locale de # md scripts use the ox_lib locale

ensure ox_lib
ensure md_wheelclamp
```

⚙️Requirements
- ox_lib
- oxmysql

🤖Exports
Server-Side:
- IsVehicleClamped(plate) | fun(plate: string): boolean
- SetVehicleClampState(plate, state) | fun(plate: string, state: boolean)
**Watch out:** Plate has to be trimmed (for example via string.strtrim(plate))

📊Resmon
Idle 0.00ms
Peak 0.00ms


⭐Creator
[Mirow](https://github.com/Mirrrrrow)

Made with ❤️ by m-dev.eu  Team