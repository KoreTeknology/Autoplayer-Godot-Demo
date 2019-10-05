extends Area2D

#Playback system
#var module = Module.new()
#var buf:AudioStreamGeneratorPlayback  #Playback buffer
var isPlaying = true

var bufferdata
# = AudioServer.get_mix_rate() #PoolVector2Array , used for scopes
var mr = AudioServer.get_mix_rate()
var sampleControls = []  #References to sample info controls

#var asp = $AudioStreamPlayer.


func _ready():
	#buf = $AudioStreamPlayer.get_stream_playback()
	#module.playback_rate = $AudioStreamPlayer.stream.mix_rate
	pass
	#$Scope.bind(module)


#func _process(delta):
#	if isPlaying:
#		fill_buffer()


func _physics_process(delta):
	if bufferdata == null:  return
	var pts = []
	for i in range(0, bufferdata.size(), bufferdata.size() / 128):
		if i > 512:  break
		var p = bufferdata[i].x
		pts.append(Vector2(pts.size(), 64 + p*64))
	if !bufferdata.empty():  
		$Line2D.points = pts
	else:
		Line2D.points = [Vector2(0,64), Vector2(8*13,64)]

	
#func fill_buffer(var frames=-1):
#	var frames_to_fill = buf.get_frames_available()
#	if frames >=0:  frames_to_fill = frames
#	bufferdata = module.fill_buffer(frames_to_fill)
#
#	buf.push_buffer(bufferdata)
#
#	$PlaybackPosition.text = "Tick %s\n" % module.tick
#	$PlaybackPosition.text += "Row %s\nPattern %s" % [module.row, module.position]
#
#
#
#func _on_Play_toggled(button_pressed):
#	isPlaying = button_pressed
#	if isPlaying:
#		$Player.play()
#	else:
#		$Player.stop()
#
#func _on_Stop_pressed():
#	$Buttons/Play.pressed = false
#	_on_Play_toggled(false)
#	module.reset()
#
#	$Player.stop()
#	yield (get_tree(), "idle_frame")
#	buf.clear_buffer()
#
#
#
## ====================================================================== io
##Module data storage and retrival routines
#class Module:
#	var isReady = false
#	#Storage banks
#	var sampleBank = []
#	var patterns = []
##	var channels = [Channel.new(), Channel.new(), Channel.new(), Channel.new()]
#
#	signal row_changed(idx)
#	signal pattern_changed(order_pos, patterndata)
#
#
#	#Mod info
#	var title = ""
#	var positions_total = 0  #Total number of positions in orderlist
#	var unique_patterns = 0  #Total number of unique patterns
#	var orders = []  #Pattern order.  128 elements.
#
#
#	#Playback system
#	var waited = 0 #Number of frames processed this loop.
#	var frames = 0 #Playback offset in frames.
#	var playback_rate = 44100.0 setget set_playback_rate 
#
#	func set_playback_rate(val):
#		playback_rate = val
#		samples_per_tick = int(playback_rate * ticktime)
#
#
#	#Timer system
#	#Default speed is 6 ticks/row 125bpm. This corresponds to 384 ticks per pattern,
#	#and a tick is 1/50 of a second in most cases, presuming PAL vblank timing.
#	#Standard pattern is about 7.68s in PAL and 6.4s in NTSC.
#
#	# SampleRate = (CLOCK_SPEED / period)
#	const CLOCK_SPEED = 7093789.2   #m68k running at 7.09 MHz (PAL)
#
#
#	var speed = 6  #Ticks per row
#	var bpm = 125  #Beats per minute (kinda)
#	var ticktime =   0.02 / (bpm / 125.0)  #Adjust tick time by bpm.
#	var samples_per_tick = int(playback_rate * ticktime)
#
#
#
#	#Fills an audio buffer with the number of frames requested.
#	func fill_buffer(nFrames):
#		#Determine how many secs have elapsed in buffer time.
#		var elapsed_time = nFrames / playback_rate
#
##		if frames == 0:  #First tick.  Make sure there's data here
##			process_tick(0)
#
#
#		frames += nFrames
#
#		#Now that potential ticks are processed, get samples.
#		var arr = []  #PoolVector2Array of final output buffer
#
#		while nFrames > 0:
#			var framedata = Vector2.ZERO
##			for i in channels.size():
##				if channels[i].muted:  continue
##				var next_sample= channels[i].nextSample(playback_rate)
##				next_sample /= channels.size()  #Lower the volume to mix.
##				#Mix the 4 channels together.
##				framedata += next_sample 
#			arr.append(framedata)
#			nFrames -=1
#			waited +=1
#
#			#Have we filled enough frames for the clock to tick over?
##			if waited >= samples_per_tick:
##				waited -= samples_per_tick
##				process_tick()  #Process next tick.
#
#		#Frames and ticks processed.  Return buffer.
#		return arr
