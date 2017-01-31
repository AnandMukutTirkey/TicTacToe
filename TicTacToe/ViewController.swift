//
//  ViewController.swift
//  TicTacToe
//
//  Created by Anand Mukut Tirkey on 29/01/17.
//  Copyright © 2017 Anand Mukut Tirkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var turn = 0;
    var turns = 0;
    var array:[[Int]] = [[3,3,3],[3,3,3],[3,3,3]]

    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myAction(_ sender: UIButton) {
        turns += 1
        let id = sender.tag
        let column = id%3
        let row = id/3
        if array[row][column] != 3 {
            let alert = UIAlertController(title: "Invalid Move", message: "You have made an invalid move please choose empty cell", preferredStyle: UIAlertControllerStyle.alert)
            let dismissAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("dismiss")
            }
            alert.addAction(dismissAction)
            self.present(alert, animated: true, completion: nil)
        }else{
            if turn == 0 {
                sender.setImage(#imageLiteral(resourceName: "zero"), for: UIControlState.normal)
                array[row][column] = 0
                turn = 1
            }else if turn == 1{
                sender.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                array[row][column] = 1
                turn = 0
            }
            //#MARK: check if game has finished
            let result = isGameFinished(array: array)
            if result == true {
                let winner : String?
                if turn == 0{
                    winner = "cross"
                }else{
                    winner = "zero"
                }
                let alert = UIAlertController(title: winner! + "Won", message: "do you want to restart", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "YES", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    self.array = [[3,3,3],[3,3,3],[3,3,3]]
                    self.btn1.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn2.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn3.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn4.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn5.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn6.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn7.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn8.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn0.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.turn = 0
                }
                alert.addAction(yesAction)
                self.present(alert, animated: true, completion: nil)
            }
            if turns == 9 && result == false{
                let alert = UIAlertController(title: "Draw", message: "do you want to restart", preferredStyle: UIAlertControllerStyle.alert)
                let yesAction = UIAlertAction(title: "YES", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    self.array = [[3,3,3],[3,3,3],[3,3,3]]
                    self.btn1.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn2.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn3.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn4.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn5.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn6.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn7.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn8.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.btn0.setImage(#imageLiteral(resourceName: "blank"), for: UIControlState.normal)
                    self.turn = 0
                }
                alert.addAction(yesAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

func isGameFinished(array : [[Int]]) -> Bool {
    var turn = 1;
    if array[0][0] == turn && array[1][0] == turn && array[2][0] == turn{
        return true
    }else if(array[0][1] == turn && array[1][1] == turn && array[2][1] == turn){
        return true
    }else if(array[0][2] == turn && array[1][2] == turn && array[2][2] == turn){
        return true
    }else if(array[0][0] == turn && array[0][1] == turn && array[0][2] == turn){
        return true
    }else if(array[1][0] == turn && array[1][1] == turn && array[1][2] == turn){
        return true
    }else if(array[2][0] == turn && array[2][1] == turn && array[2][2] == turn){
        return true
    }else if(array[0][0] == turn && array[1][1] == turn && array[2][2] == turn){
        return true
    }else if(array[0][2] == turn && array[1][1] == turn && array[2][0] == turn){
        return true
    }
    turn = 0;
    if array[0][0] == turn && array[1][0] == turn && array[2][0] == turn{
        return true
    }else if(array[0][1] == turn && array[1][1] == turn && array[2][1] == turn){
        return true
    }else if(array[0][2] == turn && array[1][2] == turn && array[2][2] == turn){
        return true
    }else if(array[0][0] == turn && array[0][1] == turn && array[0][2] == turn){
        return true
    }else if(array[1][0] == turn && array[1][1] == turn && array[1][2] == turn){
        return true
    }else if(array[2][0] == turn && array[2][1] == turn && array[2][2] == turn){
        return true
    }else if(array[0][0] == turn && array[1][1] == turn && array[2][2] == turn){
        return true
    }else if(array[0][2] == turn && array[1][1] == turn && array[2][0] == turn){
        return true
    }
    return false
}
