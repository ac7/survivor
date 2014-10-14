
function testPlayTrack()
	local play = Play:new()

	-- Ensure the initial values are correct
	assertEq(nil, play.trackTarget)
	assertEq(0, play.cameraX)
	assertEq(0, play.cameraY)

	-- Make up a mock target and ensure we're tracking it.
	local mockTrackTarget = {x = 16, y = 32}
	play:track(mockTrackTarget)
	assertEq(mockTrackTarget, play.trackTarget)

	-- as far as we're concerned for this test, the `dt` parameter to
	-- `play:update` has no effect
	play:update(0xdeadbeef)

	assertEq(play.cameraX, 16 - screenWidth/2)
	assertEq(play.cameraY, 32 - screenHeight/2)

	mockTrackTarget.x = 64
	play:update(0xdeadbeef)
	assertEq(play.cameraX, 64 - screenWidth/2)
	assertEq(play.cameraY, 32 - screenHeight/2)

	-- make sure to unset the track object
	play:track(nil)
	play.cameraX, play.cameraY = 0, 0
end

