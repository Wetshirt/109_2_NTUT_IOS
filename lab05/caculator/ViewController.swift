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
    var start : Bool = true
    
    var arr : String = ""
    
  
    @IBOutlet weak var process: UITextField!
    
    @IBOutlet weak var resultLabel: UITextField!
    @IBOutlet weak var messageLabel: UITextField!
    
    //數字鍵
    @IBAction func numberButtonClick(_ sender: UIButton) {
        
        arr.append(sender.currentTitle!)
        
        if start == true {
            process.text = sender.currentTitle
            start = false
        }
        else{
            process.text = process.text! + sender.currentTitle!
        }

    }
    
    //所有變數歸零
    @IBAction func clearButtonClick(_ sender: Any) {
        messageLabel.text = "0"
        process.text = "0"
        resultLabel.text = "0"
        start = true
        arr.removeAll()
        
    }
    //加法
    @IBAction func addButtonClick(_ sender: Any) {
        
        arr.append("+")
        process.text = process.text! + "+"
        
    }
    //減法
    @IBAction func substractButtonClick(_ sender: Any) {
        arr.append("-")
        process.text = process.text! + "-"
        
    }
    //乘法
    @IBAction func multiplyButtonClick(_ sender: Any) {
        arr.append("X")
        process.text = process.text! + "X"
        
    }
    //除法
    @IBAction func divideButtonClick(_ sender: Any) {
        arr.append("/")
        process.text = process.text! + "/"
        
    }
    //結果輸出
    @IBAction func equalToButtonClick(_ sender: Any) {
        
        process.text = process.text! + "="
        resultLabel.text = "\(calculate(arr))"
        
        
        print( calculate(arr) )
        
        print(arr)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func calculate(_ s: String) -> Int {
        var num = 0
        var sign = "+"
        var strArr = Array(s)
        var stack = [Int]()
        var res = 0

        for i in 0..<strArr.count {
            if strArr[i] >= "0" && strArr[i] <= "9" {
                num = num * 10 + Int(String(strArr[i]))!
            }

            if ((strArr[i] < "0" || strArr[i] > "9") && strArr[i] != " ") || i == strArr.count - 1 {
                if sign == "+" {
                    stack.append(num)
                } else if sign == "-" {
                    stack.append(-num)
                } else if sign == "X" {
                    stack.append(stack.removeLast() * num)
                } else if sign == "/" {
                    stack.append(stack.removeLast() / num)
                }

                sign = String(strArr[i])
                num = 0
            }
        }


        for i in stack {
            res += i
        }

        return res
    }
}
