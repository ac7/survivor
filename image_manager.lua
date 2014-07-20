
local self = {images = {}}

function image(name)
	assert(type(name) == "string")
	if self.images[name] then
		return self.images[name]
	else
		self.images[name] = love.graphics.newImage("data/" .. name)
		return self:get(name)
	end
end

function imageRelease(name)
	assert(type(name) == "string")
	assert(self.images[name] ~= nil)
	self.images[name] = nil
end

