extends HBoxContainer


var audvol = AudioServer
var eq = audvol.get_bus_effect(AudioServer.get_bus_index("track"),2)
onready var slider = $HSlider
onready var slider2 = $HSlider2
onready var slider3 = $HSlider3
onready var slider4 = $HSlider4
onready var slider5 = $HSlider5
onready var slider6 = $HSlider6

func _on_HSlider_value_changed(value):
	eq.set("band_db/32_hz", value)
	print ("band_db/32_hz", value)
	
func _on_HSlider2_value_changed(value):
	eq.set("band_db/100_hz", value)
	print ("band_db/100_hz", value)

func _on_HSlider3_value_changed(value):
	eq.set("band_db/320_hz", value)
	print ("band_db/320_hz", value)

func _on_HSlider4_value_changed(value):
	eq.set("band_db/1000_hz", value)
	print ("band_db/1000_hz", value)

func _on_HSlider5_value_changed(value):
	eq.set("band_db/3200_hz", value)
	print ("band_db/3200_hz", value)

func _on_HSlider6_value_changed(value):
	eq.set("band_db/10000_hz", value)
	print ("band_db/10000_hz", value)


func _on_ResetEqButton_pressed():
	eq.set("band_db/32_hz", 0)
	slider.value = 0
	eq.set("band_db/100_hz", 0)
	slider2.value = 0
	eq.set("band_db/320_hz", 0)
	slider3.value = 0
	eq.set("band_db/1000_hz", 0)
	slider4.value = 0
	eq.set("band_db/3200_hz", 0)
	slider5.value = 0
	eq.set("band_db/10000_hz", 0)
	slider6.value = 0
	print ("EQ faders and values have been restore to setting > 0")

