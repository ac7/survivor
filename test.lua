
enableTesting = true

function runTests()
	local count = 0
	for k, v in pairs(_G) do
		local start, _ = string.find(k, "test")
		if start == 1 then
			count = count + 1
			assert(type(v) == "function", "Global variable prefixed with test is not a function.")
			local status, msg = pcall(v)
			if not status then
				error(("\n%s FAIL: %s"):format(k, msg))
			else
				print(("%-30s OK"):format(k))
			end
		end
	end
	print("Testing: All " .. count .. " tests passed.")
end

