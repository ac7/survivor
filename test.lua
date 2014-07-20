
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
				error(k .. " FAIL: ", msg)
			else
				print(k .. "\tOK")
			end
		end
	end
	print("Testing: " .. count .. " tests passed.")
end

