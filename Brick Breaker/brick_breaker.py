from itertools import chain
import sys
import inspect
import os
import vpython as vs

#Define Control
def control(evt):
        s = evt.key
        if s == 'left':
                paddle.v=vs.vector(-3,0,0)
        if s == 'right':
                paddle.v=vs.vector(3,0,0)
vs.scene.bind('keydown', control)

'''
#Define Pause
def pause():
    while True:
        ev = vs.scene.waitfor('mousedown mouseup')
        if ev.event == 'mouseup':
                restart_program()

#Define Restart
def restart_program():
        os.execl(sys.executable, os.path.abspath(__file__), *sys.argv)
'''

#Variables
t=0.
dt=0.1
flag=0
g=vs.vector(0,-0.49,0)
boxes=0
bonus=0
a=0.1

#Individual Flags
b1=0
b2=0
b3=0
b3=0
b4=0
b5=0
b6=0
b7=0
b8=0
b9=0
b10=0
b11=0
b12=0
b13=0
b14=0
b15=0
b16=0
b17=0
b18=0
b19=0
b20=0
b21=0
b22=0
b23=0
b23=0
b24=0
b25=0
b26=0
b27=0
b28=0
b29=0
b30=0
b31=0
b32=0
b33=0
b34=0
b35=0
b36=0
b37=0
b38=0
b39=0
b40=0
b41=0
b42=0
b43=0
b44=0

#View Setup
vs.scene.range=25
vs.scene.center=vs.vector(0,0,0)
vs.scene.userzoom=False
vs.scene.userspin=False

#Objects
paddle=vs.box(pos=vs.vector(0,-20,0), length=7, height=1, width=0.1, texture=vs.textures.wood)
ball=vs.sphere(pos=vs.vector(0,-19.4,0),radius=0.5, color=vs.color.yellow)
vs.text(text=('Ultimate Brick Breaker'), color=vs.vector(0.7,0.1,0.1), pos=vs.vector(-11.8,22.8,0),height=2)
vs.text(text=('Controls - Left and Right Arrow Keys'), color=vs.vector(0.7,0.1,0.1), pos=vs.vector(-18.5,-24.2,0),height=2)
#border=extrusion(pos=vector(0,0,0), shape=shapes.rectangle(width=50, height=50,thickness=0.05),color=vector(0.1,0.1,0.2))

#Bricks
box = {}
for x in chain(range(-20,-19), range(-16,-15), range(-12, -11), range(-8,-7), range(-4, -3), range(0,1), range(4,5), range(8,9), range(12,13), range(16,17), range(20, 21)):
        for y in chain(range(8,9), range(12,13), range(16,17), range(20,21)):
                z = 0
                box[(x, y)]= vs.box(pos=vs.vector(x, y, z), length=4, height=4, width=0.1, color=vs.color.blue, texture=vs.textures.rock)

#Initial Velocities
paddle.v=vs.vector(3,0,0)
ball.v=vs.vector(0.7,5,0)

#Game
while(flag==0):
        vs.rate(5./dt)
        t=t+dt
        #Paddle Physics
        paddle.pos=paddle.pos+paddle.v*dt

        #Ball Physics
        ball.v=ball.v+g*dt
        ball.pos=ball.pos+ball.v*dt

        #Paddle Boundaries
        if (paddle.pos.x>19): #Right boundary
                paddle.v.x=0
        if (paddle.pos.x<-19): #Left Boundary
                paddle.v.x=0
                
        #Ball Boundaries
        if (ball.pos.x>22): #Right boundary
                if (ball.v.y<0):
                        ball.v=vs.vector(-1*(ball.v.x+0.2),ball.v.y-1,0) #Negative Velocity
                if (ball.v.y>0):
                        ball.v=vs.vector(-1*(ball.v.x+0.2),ball.v.y+1,0) #Positive Velocity
        if (ball.pos.x<-22): #Left Boundary
                if (ball.v.y<0):
                        ball.v=vs.vector(-1*(ball.v.x-0.2),ball.v.y-1,0) #Negative Velocity
                if (ball.v.y>0):
                        ball.v=vs.vector(-1*(ball.v.x-0.2),ball.v.y+1,0) #Positive Velocity
        if (ball.pos.y>22): #Top Boundary
                ball.v=vs.vector(ball.v.x,-ball.v.y,0)
                
        #Bounce
        if ((ball.pos.y<-19.2) and (paddle.pos.x-3.6<ball.pos.x<paddle.pos.x+3.6)):
                ball.v=vs.vector(ball.v.x+0.1*paddle.v.x,-0.99*ball.v.y,0)

        #Lose
        if (ball.pos.y<-20):
                print("You Lose!")
                print("Your score is:", boxes, "brick(s).")
                leaderboard=open('leaderboard.txt','a')
                name = input("Enter your name (max 10): ")[:10]
                s = '|     %s:        |   %s   |      %s       | \n' % (name, boxes, int(bonus))
                leaderboard.write(s)
                leaderboard=open('leaderboard.txt','r')
                print(leaderboard.read())
                #print("Click to play again.")
                #pause()
                sys.exit()

        #Win
        if (boxes==44):
                print("Congratulations! You Win!")
                print("See how long you can keep going for bonus points!")
                flag=1

        #Remove Bricks (enough nests to house every bird in North America)
        if (6<ball.pos.y<10): #Bottom row
                if (-22<ball.pos.x<-18 and b1==0):
                        x=-20
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b1=1
                        boxes=boxes+1
                if (-18<ball.pos.x<-14 and b2==0):
                        x=-16
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b2=1
                        boxes=boxes+1
                if (-14<ball.pos.x<-10 and b3==0):
                        x=-12
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b3=1
                        boxes=boxes+1
                if (-10<ball.pos.x<-6 and b4==0):
                        x=-8
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b4=1
                        boxes=boxes+1
                if (-6<ball.pos.x<-2 and b5==0):
                        x=-4
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b5=1
                        boxes=boxes+1
                if (-2<ball.pos.x<2 and b6==0):
                        x=0
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b6=1
                        boxes=boxes+1
                if (2<ball.pos.x<6 and b7==0):
                        x=4
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b7=1
                        boxes=boxes+1
                if (6<ball.pos.x<10 and b8==0):
                        x=8
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b8=1
                        boxes=boxes+1
                if (10<ball.pos.x<14 and b9==0):
                        x=12
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b9=1
                        boxes=boxes+1
                if (14<ball.pos.x<18 and b10==0):
                        x=16
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b10=1
                        boxes=boxes+1
                if (18<ball.pos.x<22 and b11==0):
                        x=20
                        y=8
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b11=1
                        boxes=boxes+1
        if (10<ball.pos.y<14): #3rd Row from top
                if (-22<ball.pos.x<-18 and b12==0):
                        x=-20
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b12=1
                        boxes=boxes+1
                if (-18<ball.pos.x<-14 and b13==0):
                        x=-16
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b13=1
                        boxes=boxes+1
                if (-14<ball.pos.x<-10 and b14==0):
                        x=-12
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b14=1
                        boxes=boxes+1
                if (-10<ball.pos.x<-6 and b15==0):
                        x=-8
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b15=1
                        boxes=boxes+1
                if (-6<ball.pos.x<-2 and b16==0):
                        x=-4
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b16=1
                        boxes=boxes+1
                if (-2<ball.pos.x<2 and b17==0):
                        x=0
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b17=1
                        boxes=boxes+1
                if (2<ball.pos.x<6 and b18==0):
                        x=4
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b18=1
                        boxes=boxes+1
                if (6<ball.pos.x<10 and b19==0):
                        x=8
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b19=1
                        boxes=boxes+1
                if (10<ball.pos.x<14 and b20==0):
                        x=12
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b20=1
                        boxes=boxes+1
                if (14<ball.pos.x<18 and b21==0):
                        x=16
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b21=1
                        boxes=boxes+1
                if (18<ball.pos.x<22 and b22==0):
                        x=20
                        y=12
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b22=1
                        boxes=boxes+1
        if (14<ball.pos.y<18): #2nd row from top
                if (-22<ball.pos.x<-18 and b23==0):
                        x=-20
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b23=1
                        boxes=boxes+1
                if (-18<ball.pos.x<-14 and b24==0):
                        x=-16
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b24=1
                        boxes=boxes+1
                if (-14<ball.pos.x<-10 and b25==0):
                        x=-12
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b25=1
                        boxes=boxes+1
                if (-10<ball.pos.x<-6 and b26==0):
                        x=-8
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b26=1
                        boxes=boxes+1
                if (-6<ball.pos.x<-2 and b27==0):
                        x=-4
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b27=1
                        boxes=boxes+1
                if (-2<ball.pos.x<2 and b28==0):
                        x=0
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b28=1
                        boxes=boxes+1
                if (2<ball.pos.x<6 and b29==0):
                        x=4
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b29=1
                        boxes=boxes+1
                if (6<ball.pos.x<10 and b30==0):
                        x=8
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b30=1
                        boxes=boxes+1
                if (10<ball.pos.x<14 and b31==0):
                        x=12
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b31=1
                        boxes=boxes+1
                if (14<ball.pos.x<18 and b32==0):
                        x=16
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b32=1
                        boxes=boxes+1
                if (18<ball.pos.x<22 and b33==0):
                        x=20
                        y=16
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b33=1
                        boxes=boxes+1
        if (18<ball.pos.y<22): #Top row
                if (-22<ball.pos.x<-18 and b34==0):
                        x=-20
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b34=1
                        boxes=boxes+1
                if (-18<ball.pos.x<-14 and b35==0):
                        x=-16
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b35=1
                        boxes=boxes+1
                if (-14<ball.pos.x<-10 and b36==0):
                        x=-12
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b36=1
                        boxes=boxes+1
                if (-10<ball.pos.x<-6 and b37==0):
                        x=-8
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b37=1
                        boxes=boxes+1
                if (-6<ball.pos.x<-2 and b38==0):
                        x=-4
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b38=1
                        boxes=boxes+1
                if (-2<ball.pos.x<2 and b39==0):
                        x=0
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b39=1
                        boxes=boxes+1
                if (2<ball.pos.x<6 and b40==0):
                        x=4
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b40=1
                        boxes=boxes+1
                if (6<ball.pos.x<10 and b41==0):
                        x=8
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b41=1
                        boxes=boxes+1
                if (10<ball.pos.x<14 and b42==0):
                        x=12
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b42=1
                        boxes=boxes+1
                if (14<ball.pos.x<18 and b43==0):
                        x=16
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b43=1
                        boxes=boxes+1
                if (18<ball.pos.x<22 and b44==0):
                        x=20
                        y=20
                        box[(x, y)].visible=False
                        del box[(x, y)]
                        ball.v.y=-1*(ball.v.y-1)
                        b44=1
                        boxes=boxes+1
#Bonus
while (boxes==44):
        rate(5./dt)
        t=t+dt
        bonus=bonus+a

        #Paddle Physics
        if (paddle.v.x>0):
                paddle.v.x=paddle.v.x+0.1
        if (paddle.v.x<0):
                paddle.v.x=paddle.v.x-0.1
        paddle.pos=paddle.pos+paddle.v*dt

        #Ball Physics
        g.y=g.y*dt
        ball.v=ball.v+g*dt
        ball.pos=ball.pos+ball.v*dt

        #Paddle Boundaries
        if (paddle.pos.x>19): #Right boundary
                paddle.v.x=0
        if (paddle.pos.x<-19): #Left Boundary
                paddle.v.x=0

        #Ball Boundaries
        if (ball.pos.x>22): #Right boundary
                if (ball.v.y<0):
                        ball.v=vector(-1*(ball.v.x+0.5),ball.v.y-1.5,0) #Negative Velocity
                if (ball.v.y>0):
                        ball.v=vector(-1*(ball.v.x+0.5),ball.v.y+2,0) #Positive Velocity
        if (ball.pos.x<-22): #Left Boundary
                if (ball.v.y<0):
                        ball.v=vector(-1*(ball.v.x-0.5),ball.v.y-1.5,0) #Negative Velocity
                if (ball.v.y>0):
                        ball.v=vector(-1*(ball.v.x-0.5),ball.v.y+2,0) #Positive Velocity
        if (ball.pos.y>22): #Top Boundary
                ball.v=vector(ball.v.x,-ball.v.y,0)

        #Bounce
        if ((ball.pos.y<-19.2) and (paddle.pos.x-3.6<ball.pos.x<paddle.pos.x+3.6)):
                ball.v=vector(ball.v.x+paddle.v.x,-ball.v.y,0)

        #Win
        if (ball.pos.y<-20):
                print("Game Over!")
                print("Your score is:", boxes, "bricks", "+", int(bonus), "bonus points!")
                leaderboard=open('leaderboard.txt','a')
                name = input("Enter your name (max 10): ")[:10]
                s = '|     %s:        |   %s   |      %s       | \n' % (name, boxes, int(bonus))
                leaderboard.write(s)
                leaderboard=open('leaderboard.txt','r')
                print(leaderboard.read())
                #print("Click to play again.")
                #pause()
                sys.exit()
