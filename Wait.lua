local socket = require("path-to-module")

-- Wait function that pauses execution for a specified amount of time
-- @param time (number) The amount of time to wait in seconds
-- @param multiplier (number) Optional multiplier for the wait time. Default is 1.
-- @return (boolean) True if the wait time was successful, false otherwise.
local function Wait(Time, Multiplier)
  Multiplier = Multiplier or 1

  -- Ensure that the input is valid (non-negative number)
  if type(Time) ~= "number" or Time < 0 then
    error("Wait function expects a non-negative number as its argument.", 2)
  end

  local WaitTime = Time * Multiplier

  -- If the specified wait time is less than 0.01 seconds, use a busy loop to wait
  if WaitTime < 0.01 then
    local Start = socket.gettime()
    while socket.gettime() - Start < WaitTime do end
    return true
  end

  -- If coroutine is running, use coroutine.yield() to wait
  if coroutine.running() then
    local Start = socket.gettime()
    repeat
      local Success, Result = coroutine.resume(coroutine.running(), WaitTime)
      if not Success then
        error("Error during coroutine wait: "..Result, 2)
      end
    until socket.gettime() - Start >= WaitTime
  else
    -- If coroutine is not running, use os.time() to wait
    local Start = os.time()
    repeat
      local Now = os.time()
      if Now < Start then
        error("System clock went backwards during wait.", 2)
      end
    until Now - Start >= WaitTime
  end
  return true
end
