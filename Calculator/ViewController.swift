//
//  ViewController.swift
//  Calculator
//
//  Created by Jason Hsu on 2018/7/31.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum operatorType {
        case add
        case subtract
        case multiply
        case divide
    }
    
    
    var totalNumber: Double?
    var lastOperator: operatorType?
    var isTypingNumber : Bool = false
    var result: Double = 0
    
  
    @IBOutlet weak var messageLabel: UILabel!
    
    //數字鍵
    @IBAction func numberButtonClick(_ sender: UIButton) {
        //若是螢幕正在輸入數字，後面輸入的數字會繼續加入螢幕
        if isTypingNumber == true {
            messageLabel.text = messageLabel.text! + sender.currentTitle!
        } else {
            //顯示第一個輸入的數字
            messageLabel.text = sender.currentTitle!
            //開啟<螢幕正在輸入數字>
            isTypingNumber = true
        }
    }
    //正負號變換
    @IBAction func signChangedButtonClick(_ sender: Any) {
            messageLabel.text = String(Double(messageLabel.text!)! * -1)
    }
    //轉換百分比
    @IBAction func percentButtonClick(_ sender: Any) {
        messageLabel.text = String(Double(messageLabel.text!)! / 100)
    }
    //刪除最後的數字
    @IBAction func backButtonClick(_ sender: Any) {
        messageLabel.text = String((messageLabel.text?.dropLast())!)
    }
    //所有變數歸零
    @IBAction func clearButtonClick(_ sender: Any) {
        messageLabel.text = ""
        totalNumber = 0
         //輸入數字輸入停止
        isTypingNumber = false
    }
    //加法
    @IBAction func addButtonClick(_ sender: Any) {
        //若totalNumber不是nil，則會將螢幕的數字與之前的輸入的數字做加法計算
        if var totalNumber = totalNumber {
            totalNumber = totalNumber + Double(messageLabel.text!)!
        } else {
            //nil表示之前未有數值，直接為螢幕顯示之值
            totalNumber = Double(messageLabel.text!)!
        }
        //紀錄算法，最後由等號的條件判斷來計算值
        lastOperator = operatorType.add
         //輸入數字輸入停止
        isTypingNumber = false
        //格式%g，可以去掉Double小數點後的零
        messageLabel.text = String(format: "%g", totalNumber!)
    }
    //減法
    @IBAction func substractButtonClick(_ sender: Any) {
        if var totalNumber = totalNumber {
            //若totalNumber不是nil，則會將螢幕的數字與之前的輸入的數字做減法計算
            totalNumber = totalNumber - Double(messageLabel.text!)!
        } else {
            totalNumber = Double(messageLabel.text!)!
        }
        //紀錄算法，最後由等號的條件判斷來計算值
        lastOperator = operatorType.subtract
         //輸入數字輸入停止
        isTypingNumber = false
        //格式%g，可以去掉Double小數點後的零
        messageLabel.text = String(format: "%g", totalNumber!)
    }
    //乘法
    @IBAction func multiplyButtonClick(_ sender: Any) {
        //若totalNumber不是nil，則會將螢幕的數字與之前的輸入的數字做乘法計算
        if var totalNumber = totalNumber {
            totalNumber = totalNumber * Double(messageLabel.text!)!
        } else {
            totalNumber = Double(messageLabel.text!)!
        }
        //紀錄算法，最後由等號的條件判斷來計算值
        lastOperator = operatorType.multiply
        //輸入數字輸入停止
        isTypingNumber = false
        //格式%g，可以去掉Double小數點後的零
        messageLabel.text = String(format: "%g", totalNumber!)
    }
    //除法
    @IBAction func divideButtonClick(_ sender: Any) {
        //若totalNumber不是nil，則會將螢幕的數字與之前的輸入的數字做除法計算
        if var totalNumber = totalNumber {
            totalNumber = totalNumber / Double(messageLabel.text!)!
        } else {
            totalNumber = Double(messageLabel.text!)!
        }
        //紀錄算法，最後由等號的條件判斷來計算值
        lastOperator = operatorType.divide
         //輸入數字輸入停止
        isTypingNumber = false
        //格式%g，可以去掉Double小數點後的零
        messageLabel.text = String(format: "%g", totalNumber!)
    }
    //結果輸出
    @IBAction func equalToButtonClick(_ sender: Any) {
        //計算法的條件判斷
        if let finalOperator = lastOperator {
            //使用紀錄的最後一個計算法，來計算最後結果
            switch finalOperator {
            case .add:
                result = totalNumber! + Double(messageLabel.text!)!
            case .subtract:
                result = totalNumber! - Double(messageLabel.text!)!
            case .multiply:
                result = totalNumber! * Double(messageLabel.text!)!
            case .divide:
                result = totalNumber! / Double(messageLabel.text!)!
            }
        }
        //最後的數值輸出
        messageLabel.text = String(format: "%g", result)
        //將內存的值歸為nil，從新開始
        totalNumber = nil
        isTypingNumber = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

