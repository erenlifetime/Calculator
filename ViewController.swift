
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    private var keepGoingType:Bool = true
    private var displayValue:Double{
        get{
            guard var number = Double(displayLabel.text!)else {
                fatalError("Display değişkenim Double a Convert edilemedi.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
@IBAction func calcButtonPressed(_ sender: UIButton) { // calcMethod == calcButtonPr..
        keepGoingType = true
    calculator.setNumber(displayValue)
    
    if let calcMethod = sender.currentTitle{
        guard let result = calculator.calculate(symbol: calcMethod) else{
            fatalError("Hesap makinesinin cevabı nil dir")
        }
        displayValue = result
    }
}
@IBAction func numButtonPressed(_ sender: UIButton) { // numValue == numButtonPressed
// Hangi rakama basarsam basayım tek sayı da kalmayıp sayı eklemeye devam eder.
        if let numValue = sender.currentTitle{
            if keepGoingType{
                displayLabel.text = numValue
                keepGoingType = false
            }else{
// . Buttonum'a tıkladığmda sürekli . ekler durmaz fakat bu kod ile düzenlenir. (.)
            if numValue == "."{
                guard let currentDisplayValue = Double(displayLabel.text!)else{
                        fatalError("DisplayLabel değişkenim Double'a Dönüştürülemedi.")
                    }
                let isInt = floor(currentDisplayValue) == currentDisplayValue
                if isInt{
                    return
                }
            }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

