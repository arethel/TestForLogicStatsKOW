extends HSlider

var lastvalue

func _ready():
	randomize()
	not_changed_by_me = true
	value=randi()%30
	lastvalue=value
	not_changed_by_me = false


	

var not_changed_by_me = false

var remains = 0

func _on_slider_value_changed(value):
	if !not_changed_by_me:
		get_parent().change_stats(int(name)-1,value-lastvalue)
	lastvalue=value
