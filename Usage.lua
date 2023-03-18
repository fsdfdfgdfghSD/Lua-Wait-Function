-- This script provides a few examples of how you can use the Wait() function.

-- First, we require the Wait module:
local WaitFunction = require("path-to-module")

-- >> First Example << --

-- In this example, we print "Hello", wait 1 second, then print "World!".

print("Hello")
WaitFunction(1) -- Wait for 1 second
print("World!")

-- >> Second Example << --

-- In this example, we define a function that prints some messages with waits in between,
-- then call that function and print additional messages.

local function MyFunction()
  print("Function started")
  WaitFunction(2) -- Wait for 2 seconds
  print("Function resumed")
  WaitFunction(3) -- Wait for 3 seconds
  print("Function finished")
end

print("Start")
MyFunction()
print("End")

-- >> Third Example << --

-- In this example, we prompt the user to press enter, then wait 2 seconds and print a message.

print("Click enter to continue!")
io.read() -- Wait for user to press enter
WaitFunction(2) -- Wait for 2 seconds
print("Two seconds have passed!")

-- >> Fourth Example << --

-- In this example, we define a countdown function that prints numbers with waits in between,
-- then call that function with a timer value of 5 seconds.

function Countdown(Timer)
  for i = Timer, 1, -1 do
    print("Countdown: "..i)
    WaitFunction(1) -- Wait for 1 second
  end
  print("Blast off!")
end

Countdown(5)

-- >> Fifth Example << --

-- In this example, we print a message in a loop with a wait in between each iteration.
-- The loop runs 10 times, waiting for 0.5 seconds between each iteration.

local i = 1

while i <= 10 do
  print("Loop iteration: ", i)
  WaitFunction(0.5) -- Wait for 0.5 seconds
  i = i + 1
end
