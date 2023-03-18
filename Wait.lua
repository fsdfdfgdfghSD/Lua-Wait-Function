-- Wait function that pauses execution for a specified amount of time
-- @param Time (number) The amount of time to wait in seconds
local function Wait(Time)
  -- Ensure that the input is valid (non-negative number)
  if type(Time) ~= "number" or Time < 0 then
    error("Wait function expects a non-negative number as its argument is: "..tostring(Time), 2)
  end

  -- If the specified wait time is less than 0.01 seconds, use a busy loop to wait
  if Time < 0.01 then
    local Start = os.clock()
    while os.clock() - Start < Time do end
    return
  end

  -- If coroutine is running, use coroutine.yield() to wait
  if coroutine.running() then
    local Start = os.clock()
    repeat coroutine.yield() until os.clock() - Start >= Time
  else
    -- If coroutine is not running, use os.time() to wait
    local Start = os.time()
    repeat
    until os.time() - Start >= Time
  end
end
