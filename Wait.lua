local socket = require("path-to-module")

-- Wait function that pauses execution for a specified amount of time
-- @param time (number) The amount of time to wait in seconds
-- @param multiplier (number) Optional multiplier for the wait time. Default is 1.
-- @return (boolean) True if the wait time was successful, false otherwise.
local function Wait(time, multiplier)
  multiplier = multiplier or 1

  -- Ensure that the input is valid (non-negative number)
  if type(time) ~= "number" or time < 0 then
    error("Wait function expects a non-negative number as its argument.", 2)
  end

  local waitTime = time * multiplier

  -- If the specified wait time is less than 0.01 seconds, use a busy loop to wait
  if waitTime < 0.01 then
    local start = socket.gettime()
    while socket.gettime() - start < waitTime do end
    return true
  end

  -- If coroutine is running, use coroutine.yield() to wait
  if coroutine.running() then
    local start = socket.gettime()
    repeat
      local success, errorMsg = coroutine.resume(coroutine.running(), waitTime)
      if not success then
        error("Error during coroutine wait: " .. errorMsg, 2)
      end
    until socket.gettime() - start >= waitTime
  else
    -- If coroutine is not running, use os.time() to wait
    local start = os.time()
    repeat
      local now = os.time()
      if now < start then
        error("System clock went backwards during wait.", 2)
      end
    until now - start >= waitTime
  end

  return true
end
