//
//  ViewController.swift
//  TicTacToe
//
//  Created by gauravds on 28/01/17.
//  Copyright © 2017 gauravds All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ticTacToe = TicTacToe()
    @IBOutlet var lblStatus: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateState()
    }

    @IBAction func buttonTapped(sender: UIButton) {
        if sender.title(for: .normal) != "-" {
            return
        }
        var btnTextValue: String
        var btnBoardValue: Int
        switch ticTacToe.checkStatus() {
        case .xTern:
            btnTextValue = "X"
            btnBoardValue = 1
        case .oTern:
            btnTextValue = "O"
            btnBoardValue = 2
        default:
            btnTextValue = "-"
            btnBoardValue = 0
        }
        ticTacToe.board[(sender.tag-1)/3][(sender.tag-1)%3] = btnBoardValue
        sender.setTitle(btnTextValue, for: .normal)
        updateState()
    }

    @IBAction func btnResetTapped(sender: UIButton) {
        ticTacToe.resetBoard()
        for i in 1...9 {
            let btn = self.view.viewWithTag(i) as! UIButton
            btn.setTitle("-", for: .normal)
        }
        updateState()
    }

    func updateState() {
        lblStatus.text = ticTacToe.checkStatus().rawValue
    }

}

