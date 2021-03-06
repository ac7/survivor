
local images = {}

function image(name)
	assertIs("string", name)
	if images[name] then
		return images[name]
	else
		images[name] = love.graphics.newImage("data/" .. name)
		return images[name]
	end
end

function imageRelease(name)
	assertIs("string", name)
	assert(images[name] ~= nil)
	images[name] = nil
end

function testImageManager()
	local mockObject = {"good morning"}
	images["hello"] = mockObject
	assert(image("hello") == mockObject)

	-- assert that imageRelease actually removes the image
	imageRelease("hello")
	assert(images["hello"] == nil)
end

