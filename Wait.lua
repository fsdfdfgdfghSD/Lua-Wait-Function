-- The Wait function allows for a specified amount of time to pass before continuing the execution of the program.
-- It takes in a single argument, Time, which is the amount of time to wait in seconds.

local function Wait(Time)
    -- The following code block checks if the Time argument is a number and is non-negative. If either of these conditions is not met, an error is thrown.
    if type(Time) ~= "number" or Time < 0 then
        error("Wait function expects a non-negative number as its argument")
    end

    -- If the specified time is less than 0.01 seconds, a busy-wait loop is used to wait for the time to pass.
    if Time < 0.01 then
        local Start = os.clock()
        while os.clock() - Start < Time do end
        return
    end

    -- If the coroutine is running, yield the coroutine until the specified time has passed.
    if coroutine.running() then
        local Start = os.clock()
        repeat coroutine.yield() until os.clock() - Start >= Time
    else
        -- Otherwise, wait for the specified time using a busy-wait loop.
        local Start = os.time()
        repeat until os.time() - Start >= Time
    end
end
