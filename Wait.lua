local function Wait(Time)
  assert(type(Time) == "number" and Time >= 0, "Invalid wait time")

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
    repeat
    until os.time() - Start >= Time
  end
end
