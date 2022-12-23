extends Control

var matrix=[]

func _ready():
	randomize()
	for i in range(get_children().size()):
		matrix.append([])
		for j in range(get_children().size()):
			matrix[i].append(randf()*2-1)
		set_null_random_el_in_array(matrix[i],3)
	
	
	

func change_stats(num_of_changed, change):
	for i in range(get_children().size()):
		if(num_of_changed==i):
			continue
		get_children()[i].not_changed_by_me=true
		var total_change = matrix[num_of_changed][i]*change
		get_children()[i].remains+=total_change-int(total_change)
		get_children()[i].value+=int(total_change)+int(get_children()[i].remains)
		get_children()[i].remains-=int(get_children()[i].remains)
		get_children()[i].not_changed_by_me=false


func set_null_random_el_in_array(arr,amount_of_nulls):
	var k = 0
	while k<amount_of_nulls:
		var el = randi()%arr.size()
		if arr[el]!=0:
			arr[el]=0
			k+=1
