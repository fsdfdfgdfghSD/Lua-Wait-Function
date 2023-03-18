-- Three examples of how you can use the Wait() function

local WaitFunction = require("path-to-module")

-- >> First Example << --

print("Hello")
WaitFunction(1) -- Wait a certain amount of time
print("World!")

-- >> Second Example << --

function MyCoroutine()
  print("Coroutine started")
  Wait(2)
  print("Coroutine resumed")
  Wait(3)
  print("Coroutine finished")
end

coroutine.wrap(MyCoroutine)()

-- >> Third Example << --

local function WaitForInputWithinTimeLimit()
  local Timeout = 5 -- wait for input for 5 seconds
  local Start = os.time()
  
  while os.time() - Start < Timeout do
    local Input = io.read()
    if Input then
      print("Input received:", Input)
      return
    end
    Wait(0.1) -- wait for a short time before checking again
  end
  
  print("Input not received within time limit")
end

WaitForInputWithinTimeLimit()
