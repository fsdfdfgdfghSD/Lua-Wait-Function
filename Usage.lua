-- Few examples of how you can use the Wait() function

local WaitFunction = require("path-to-module")

-- >> First Example << --

print("Hello")
WaitFunction(1)
print("World!")

-- >> Second Example << --

local function MyFunction()
  print("Function started")
  WaitFunction(2)
  print("Function resumed")
  WaitFunction(3)
  print("Function finished")
end

print("Start")
MyFunction()
print("End")

-- >> Third Example << --

print("Click enter to continue!")

io.read() -- Detect if the user hits enter
WaitFunction(2)
print("Two seconds have passed!")

-- >> Fourth Example << --

function Countdown(Timer)
  for i = Timer, 1, -1 do
    print("Countdown: "..i)
    WaitFunction(1)
  end
  print("Blast off!")
end

Countdown(5)

-- >> Fifth Example << --

local i = 1

while i <= 10 do
  print("Loop iteration: ", i)
  Wait(0.5)
  i = i + 1
end
