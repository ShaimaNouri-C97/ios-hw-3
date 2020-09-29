//
//  ViewController.swift
//  hw3-2 xo
//
//  Created by Shaima Nouri on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var turnLabel: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
    }
    
    var buttons: [UIButton] = []
    
    @IBAction func click (_ sender: UIButton){
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            turnLabel.text! = "O's Turn"
            Winner(_p: "X")
        }
        else {
            sender.setTitle("O", for: .normal)
            turnLabel.text! = "X's Turn"
            Winner(_p: "O")
        }
    
        sender.isEnabled = false
        counter += 1
        print (counter)
    }

    func Winner(_p: String){
        let bTiles = buttons.map{$0.titleLabel!.text ?? ""}
        let r1 = (bTiles[0], bTiles[1], bTiles[2]) == (_p, _p, _p)
        let r2 = (bTiles[3], bTiles[4], bTiles[5]) == (_p, _p, _p)
        let r3 = (bTiles[6], bTiles[7], bTiles[8]) == (_p, _p, _p)
        let c1 = (bTiles[0], bTiles[3], bTiles[6]) == (_p, _p, _p)
        let c2 = (bTiles[1], bTiles[4], bTiles[7]) == (_p, _p, _p)
        let c3 = (bTiles[2], bTiles[5], bTiles[8]) == (_p, _p, _p)
        let d1 = (bTiles[0], bTiles[4], bTiles[8]) == (_p, _p, _p)
        let d2 = (bTiles[2], bTiles[4], bTiles[6]) == (_p, _p, _p)
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            AlertWinner (winner: _p)
        }

    }
    @IBAction func Restart (_ sender: Any){
        buttons.forEach { button in
            button.setTitle("", for: .normal)
            button.titleLabel!.text = ""
        }
        counter = 0

    }
    
    func AlertWinner(winner: String){
        let alertcontroller = UIAlertController (title: "\(winner) is the winner", message: "Click the restart icon to restart", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertcontroller.addAction(action)
        self.present(alertcontroller, animated: true, completion: nil)
        }
    }


