--[[
This is for development purposes. So you can abort the
initialisation of the programm in case of errors. Otherwise
the esp will constantly restart.
--]]
function startup()
    if abort == true then
        print('startup aborted')
        return
        end
    print('in startup')
    dofile('bootstrap.lua')
    end

abort = false
print("5 seconds till start, send abort=true to stop startup")
tmr.alarm(0,5000,0,startup)
