local function Wait(Time)
    if type(Time) ~= "number" or Time < 0 then
        error("Wait function expects a non-negative number as its argument")
    end

    if Time < 0.01 then
        local Start = os.clock()
        while os.clock() - Start < Time do end
        return
    end

    if coroutine.running() then
        local Start = os.clock()
        repeat coroutine.yield() until os.clock() - Start >= Time
    else
        local Start = os.time()
        repeat until os.time() - Start >= Time
    end
end
