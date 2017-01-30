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
        //var id = sender.tag
        let column = sender.tag%3
        let row = sender.tag/3
        if array[row][column] != 3 {
            let alert = UIAlertController(title: "Invalid Move", message: "You have made an invalid move please choose empty cell", preferredStyle: UIAlertControllerStyle.alert)
            let dismissAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default) {
                (result : UIAlertAction) -> Void in
                print("dismiss")
            }
            alert.addAction(dismissAction)
            self.present(alert, animated: true, completion: nil)
        }else{
            sender.setImage(#imageLiteral(resourceName: "zero"), for: UIControlState.normal)
            array[row][column] = 0
            print("initial array \(array)")
            //#MARK: check if game has finished
            let result = isGameFinished(array: array)
            let tuple = winMove(array: array, turn: 1)
            
            print(tuple.0,tuple.1)
            if result == true {
                print("how can use win?")
                let winner : String? = "zero"
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
                }
                alert.addAction(yesAction)
                self.present(alert, animated: true, completion: nil)
                //#MARK: goto end of func
            }else if tuple.0 != 3 {//#MARK: check for the possibility of computer winning
                if array[tuple.0][tuple.1] == 3{
                    array[tuple.0][tuple.1] = 1
                    switch tuple {
                    case (0,0):
                        btn0.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (0,1):
                        btn1.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (0,2):
                        btn2.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (1,0):
                        btn3.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (1,1):
                        btn4.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (1,2):
                        btn5.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (2,0):
                        btn6.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (2,1):
                        btn7.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    case (2,2):
                        btn8.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                    default:
                        print("error")
                    }
                    let alert = UIAlertController(title: "Cross Won", message: "do you want to restart", preferredStyle: UIAlertControllerStyle.alert)
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
                
                //#MARK: goto end of func
            }else{
                let tuple2 = winMove(array: array, turn: 0)
                if tuple2.0 != 3 {//#MARK: check for the possibility of users winning
                    if array[tuple2.0][tuple2.1] == 3 {
                        array[tuple2.0][tuple2.1] = 1
                        switch tuple2 {
                        case (0,0):
                            btn0.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (0,1):
                            btn1.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (0,2):
                            btn2.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (1,0):
                            btn3.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (1,1):
                            btn4.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (1,2):
                            btn5.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (2,0):
                            btn6.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (2,1):
                            btn7.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        case (2,2):
                            btn8.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                        default:
                            print("error")
                        }
                    }
                }else if array[1][1] == 3 {//#MARK: pick center cell
                    array[1][1] = 1
                    btn4.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[0][0] == 3 {//#MARK: pick corner cell
                    array[0][0] = 1
                    btn0.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[0][2] == 3{
                    print("here we go")
                    array[0][2] = 1
                    btn2.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[2][0] == 3{
                    array[2][0] = 1
                    btn6.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[2][2] == 3{
                    array[2][2] = 1
                    btn8.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[0][1] == 3{
                    array[0][1] = 1
                    btn1.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[1][0] == 3{
                    array[1][0] = 1
                    btn3.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[1][2] == 3{
                    array[1][2] = 1
                    btn5.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else if array[2][1] == 3{
                    array[2][1] = 1
                    btn7.setImage(#imageLiteral(resourceName: "cross"), for: UIControlState.normal)
                }else{
                    print("what cell untouched")
                }
                //#MARK: pi
               
            }
            print(array)
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
func winMove(array : [[Int]] , turn : Int) -> (Int,Int) {
    print("turn here is \(turn)")
    if array[0][0] == turn && array[1][0] == turn{
        return (2,0)
    }else if array[1][0] == turn && array[2][0] == turn{
        return (0,0)
    }else if array[0][0] == turn && array[2][0] == turn{
        return (1,0)
    }else if array[0][1] == turn && array[1][1] == turn{
        return (2,1)
    }else if array[0][1] == turn && array[2][1] == turn{
        return (1,1)
    }else if array[1][1] == turn && array[2][1] == turn{
        return (0,1)
    }else if array[0][2] == turn && array[1][2] == turn{
        return (2,2)
    }else if array[0][2] == turn && array[2][2] == turn{
        return (1,2)
    }else if array[1][2] == turn && array[2][2] == turn{
        return (0,2)
    }else if array[0][0] == turn && array[0][1] == turn{
        return (0,2)
    }else if array[0][1] == turn && array[0][2] == turn{
        return (0,0)
    }else if array[0][2] == turn && array[0][0] == turn{
        return (0,1)
    }else if array[1][0] == turn && array[1][1] == turn{
        return (1,2)
    }else if array[1][1] == turn && array[1][2] == turn{
        return (1,0)
    }else if array[1][2] == turn && array[1][0] == turn{
        return (1,1)
    }else if array[2][0] == turn && array[2][1] == turn{
        return (2,2)
    }else if array[2][1] == turn && array[2][2] == turn{
        return (2,0)
    }else if array[2][2] == turn && array[2][0] == turn{
        return (2,1)
    }else if array[0][0] == turn && array[1][1] == turn{
        return (2,2)
    }else if array[1][1] == turn && array[2][2] == turn{
        return (0,0)
    }else if array[2][2] == turn && array[0][0] == turn{
        return (1,1)
    }else if array[0][2] == turn && array[1][1] == turn{
        return (2,0)
    }else if array[1][1] == turn && array[2][0] == turn{
        return (0,2)
    }else if array[2][0] == turn && array[0][2] == turn{
        return (1,1)
    }
    return (3,3)
}
