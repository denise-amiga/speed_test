#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jan 16 15:32:52 2021

@author: denise
"""

import sys
import random
import pygame as pg

class Box:
    def __init__(self):
        self.x = random.randint(0, 750)
        self.y = random.randint(0, 550)
        self.vx = random.randint(1, 10)
        self.vy = random.randint(1, 10)
        self.s = random.randint(1, 50)
        self.c = (self.s*4, self.s*4, self.s*4)
    def draw(self):
        pg.draw.rect(screen, self.c, (self.x,self.y,self.s,self.s))
    def update(self):
        self.x = self.x + (self.vx*(55-self.s)/100)
        if self.x>800-self.s or self.x<0: self.vx = -self.vx
        self.y = self.y + (self.vy*(55-self.s)/100)
        if self.y>600-self.s or self.y<0: self.vy = -self.vy

pg.init()
fpsClock = pg.time.Clock()

screen = pg.display.set_mode((800,600))

boxes = [Box() for _ in range(8000)]
while True:
    for event in pg.event.get():
        if event.type == pg.QUIT: pg.quit(), sys.exit()

    screen.fill((0,0,0))
    for n in boxes:
        n.draw()
        n.update()
    # pg.display.flip()
    pg.display.update()
    fpsClock.tick(60)
