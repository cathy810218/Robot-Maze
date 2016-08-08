//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
      

        let myWallInfo = checkWalls(myRobot)

        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPath = myWallInfo.numberOfWalls == 2
        let isDeadEnd = myWallInfo.numberOfWalls == 3
        

        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
        } else if isTwoWayPath && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
        } else if isDeadEnd {
            if robotIsBlocked {
                myRobot.rotateRight()
            } else {
                myRobot.move()
            }
        }
        
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}