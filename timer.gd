extends Node
var total_time_in_secs : int = 0


func _on_timer_timeout():
	total_time_in_secs += 1
	var m = int(total_time_in_secs / 60.0)
	var s = total_time_in_secs - m * 60
	%timerLabel.text = '%02d:%02d' % [m, s]
