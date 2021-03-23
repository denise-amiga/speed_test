extends Node2D

var ar1 = []
var par1 = PoolIntArray()

func _ready() -> void:
	ar1.resize(1000)
	print(ar1.size())
#	print(ar1)
	par1.resize(1000)
	print(par1.size())
#	print(par1)
	var a1 = ar_set()
	var p1 = par_set1()
	var p2 = par_set2()
	print("List: "+str(a1))
	print("PollArray: (index) "+str(p1))
	print("PollArray: (set) "+str(p2))

func ar_set(times=400):
	var t1 = OS.get_ticks_usec()
	for i in times:
		for ii in ar1.size():
			ar1[ii] = 0
	return OS.get_ticks_usec()-t1

func par_set1(times=400):
	var t1 = OS.get_ticks_usec()
	for i in times:
		for ii in par1.size():
			par1[ii] = 0
	return OS.get_ticks_usec()-t1

func par_set2(times=400):
	var t1 = OS.get_ticks_usec()
	for i in times:
		for ii in par1.size():
			par1.set(ii,0)
	return OS.get_ticks_usec()-t1
