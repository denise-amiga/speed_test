SuperStrict

Local amount:Int = 8000
Local boxes:Box[amount]

Type Box
	Field x:Float,y:Float
	Field vx:Float,vy:Float
	Field s:Float
	Field cr:Int,cg:Int,cb:Int

	Method New()
		x = Rnd(750)
		y = Rnd(550)
		vx = Rnd(1,10)
		vy = Rnd(1,10)
		s = Rnd(1,50)
	EndMethod
	
	Method Draw()
		SetColor(Int(4*s),Int(4*s),Int(4*s))
		DrawRect(x,y,s,s)
	EndMethod

	Method Update()
		x = x + (vx*(55-s)/100)
		If x>800-s Or x<0 vx=-vx
		y = y + (vy*(55-s)/100)
		If y>600-s Or y<0 vy=-vy
	EndMethod 
EndType

For Local i:Int = 0 Until amount
	Local n:Box=New Box
	boxes[i] = n
Next

Print(amount)
Graphics(800,600)

While Not (KeyHit( KEY_ESCAPE ) Or AppTerminate())

	Cls
	For Local n:Box=EachIn boxes
		n.draw()
		n.update()
	Next
	Flip

Wend
