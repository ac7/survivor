
-- assertEq is a helper routine for comparing expected and recieved. Causes an
-- error if the values are not equal. The error will be one level higher on the
-- traceback stack so it will appear to occur on the line that you called
-- `assertEq()`
function assertEq(expected, recieved)
	if expected ~= recieved then
		error(("Expected %s, recieved %s"):format(expected, recieved), 2)
	end
end

-- assertApprox is a helper routine for comparing expected and recieved (which
-- must be numbers). Causes an error if the values are more than a small delta
-- different from each other. The error will be one level higher on the
-- traceback stack so it will appear to occur on the line that you called
-- `assertApprox()`
function assertApprox(expected, recieved)
	if expected - recieved > 0.005 then
		error(("Expected %s, recieved %s"):format(expected, recieved), 2)
	end
end

-- assertIs checks that the object's type is equal to the typeName (which should
-- be a string). Why would you use this over `assert(type(object) == typeName)`?
-- Because this function prints helpful information.
function assertIs(typeName, object)
	if type(object) ~= typeName then
		error(("Expected an object of type %s, recieved %s (of type %s)")
			:format(typeName, object, type(object)), 2)
	end
end

-- runTests goes through every function in the global namespace and runs the
-- functions that begin with `test`. The general idea was adopted from the test
-- framework in Golang (golang.org). These functions can use `assert` because any
-- thrown errors will be caught and printed.
function runTests()
	local count = 0
	local passed = 0
	print("Testing: Running test cases")
	for k, v in pairs(_G) do
		local start, _ = string.find(k, "test")
		if start == 1 then
			count = count + 1
			assert(type(v) == "function",
				"Global variable prefixed with 'test' is not a function.")

			local status, msg = pcall(v)
			if not status then
				print(("  %-50s FAIL\n\t%s"):format(k, msg))
			else
				print(("  %-50s ok"):format(k))
				passed = passed + 1
			end
		end
	end
	print("Testing: " .. passed .. "/" .. count .. " passed")
end

