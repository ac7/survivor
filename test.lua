
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

