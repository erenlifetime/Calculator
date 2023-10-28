

import Foundation
struct CalculatorLogic{
    private var number: Double?
    private var intermediateCalculation: (n1:Double, calcMethod:String)?
//    init(number: Double) {
//        self.number = number
//    }
    
    // bu kod design pattern için işe yarar bir koddur.
    mutating func setNumber(_ number:Double){
        self.number = number
    }
    mutating func calculate(symbol:String) ->Double?{
        if let n = number{
            if symbol == "+/-"{
                return n * -1
            }else if symbol == "AC"{
                return 0
            } else if symbol == "%"{
                return n * 0.01
            }else if symbol == "="{
               return performTwoCalculation(n2:n)
            }else{
            intermediateCalculation = (n1:n,calcMethod:symbol)
            }
        }
        return nil
    }
    func performTwoCalculation(n2:Double)->Double?{
        if let n1 = intermediateCalculation?.n1,let oparation = intermediateCalculation?.calcMethod{
            
            switch oparation {
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "÷":
                return n1/n2
            case "×":
                return n1 * n2
            default:
                fatalError("Operation Hiçbir Negatif Durumla Karşılaşmadı")
            }
        }
        return nil
    }
}
