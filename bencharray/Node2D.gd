extends Node2D

var ar1 = []
var ar2 = []

func _ready() -> void:
	print("Resize 1D: "+str(resize_a1()))
	print("Resize 2D: "+str(resize_a2()))
	print("Fill 1D: "+str(fill_a1()))
	print("Fill 2D: "+str(fill_a2()))
	print("Read 1D: "+str(read_a1()))
	print("Read 2D: "+str(read_a2()))
	var buff = ""
	for b in 5:
		for a in 5:
			buff += str(ar1[b*20+a])
	print(buff)
	print("---------")
	buff = ""
	for b in 5:
		for a in 5:
			buff += str(ar2[b][a])
	print(buff)

func resize_a1(limit=400, times=100):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		ar1.resize(limit)
	return OS.get_ticks_usec()-t1

func resize_a2(limit1=20, limit2=20, times=100):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		ar2.resize(limit1)
		for ii in limit1:
			ar2[ii] = []
			ar2[ii].resize(limit2)
	return OS.get_ticks_usec()-t1

func fill_a1(limit=400, times=100):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		for ii in limit:
			ar1[ii] = randi()%100
	return OS.get_ticks_usec()-t1

func fill_a2(limit1=20, limit2=20, times=100):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		for b in limit1:
			for a in limit2:
				ar2[b][a] = randi()%100
	return OS.get_ticks_usec()-t1

func read_a1(times=100):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		var z = 0
		z += ar1[0*20+0]
		z += ar1[1*20+1]
		z += ar1[2*20+2]
		z += ar1[3*20+3]
		z += ar1[4*20+4]
	return OS.get_ticks_usec()-t1

func read_a2(times=100):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		var z = 0
		z += ar2[0][0]
		z += ar2[1][1]
		z += ar2[2][2]
		z += ar2[3][3]
		z += ar2[4][4]
	return OS.get_ticks_usec()-t1
