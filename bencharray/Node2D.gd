extends Node2D

var ar1 = []
var ar2 = []

func _ready() -> void:
	var resize1 = resize_a1()
	var resize2 = resize_a2()
	var fill1 = fill_a1()
	var fill2 = fill_a2()
	var read1 = read_a1()
	var read2 = read_a2()
	print("Resize 1D: "+str(resize1))
	print("Resize 2D: "+str(resize2))
	print("Resize: {0}%".format(["%5.2f" % ((resize2-resize1)/float(resize1)*100)]))
	print("Fill 1D: "+str(fill1))
	print("Fill 2D: "+str(fill2))
	print("Fill: {0}%".format(["%5.2f" % ((fill2-fill1)/float(fill1)*100)]))
	print("Read 1D: "+str(read1))
	print("Read 2D: "+str(read2))
	print("Read: {0}%".format(["%5.2f" % ((read2-read1)/float(read1)*100)]))
	var buff = ""
	for b in 5:
		for a in 5:
			buff += str(ar1[b*30+a])
	print(buff)
	print("---------")
	buff = ""
	for b in 5:
		for a in 5:
			buff += str(ar2[b][a])
	print(buff)

func resize_a1(limit=900, times=200):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		ar1.resize(limit)
	return OS.get_ticks_usec()-t1

func resize_a2(limit1=30, limit2=30, times=200):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		ar2.resize(limit1)
		for ii in limit1:
			ar2[ii] = []
			ar2[ii].resize(limit2)
	return OS.get_ticks_usec()-t1

func fill_a1(limit=900, times=200):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		for ii in limit:
			ar1[ii] = randi()%100
	return OS.get_ticks_usec()-t1

func fill_a2(limit1=30, limit2=30, times=200):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		for b in limit1:
			for a in limit2:
				ar2[b][a] = randi()%100
	return OS.get_ticks_usec()-t1

func read_a1(times=200):
	seed(1000)
	var t1 = OS.get_ticks_usec()
	for i in times:
		var z = 0
		z += ar1[0*30+0]
		z += ar1[1*30+1]
		z += ar1[2*30+2]
		z += ar1[3*30+3]
		z += ar1[4*30+4]
	return OS.get_ticks_usec()-t1

func read_a2(times=200):
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
