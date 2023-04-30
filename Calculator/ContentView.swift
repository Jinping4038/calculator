//
//  ContentView.swift
//  Calculator
//
//  Created by king on 4/25/23.
//

import SwiftUI

struct ContentView: View {

    @State var number1: String = ""
    @State var number2: String = ""
    @State var operatorClicked: String = ""
    var containerWidth:CGFloat = UIScreen.main.bounds.width - 32.0
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text(getDisplay())
                    .foregroundColor(.gray)
            }
            .padding()
            HStack() {
                Button(action: {clear()}) {Text("AC").frame(maxWidth: .infinity)}.frame(width: containerWidth * 0.22)
                Button(action: {flipSign()}) {Text("+/-").frame(maxWidth: .infinity)}.frame(width: containerWidth * 0.22)
                Button(action: {onOperatorClicked(oper: "%")}) {Text("%").frame(maxWidth: .infinity)}.frame(width: containerWidth * 0.22)
                Button(action: {
                    onOperatorClicked(oper: "/")
                }) {Text("/").frame(maxWidth: .infinity)}.frame(width: containerWidth * 0.22)
            }
            
            HStack {
                Button(action: {addDigit(digit: "7")}) {Text("7")}
                Button(action: {addDigit(digit: "8")}) {Text("8")}
                Button(action: {addDigit(digit: "9")}) {Text("9")}
                Button(action: {
                    onOperatorClicked(oper: "*")
                }) {Text("*")}
            }
            
            HStack {
                Button(action: {addDigit(digit: "4")}) {Text("4")}
                Button(action: {addDigit(digit: "5")}) {Text("5")}
                Button(action: {addDigit(digit: "6")}) {Text("6")}
                Button(action: {
                    onOperatorClicked(oper: "-")
                }) {Text("-")}
            }
            
            HStack {
                Button(action: {addDigit(digit: "1")}) {Text("1")}
                Button(action: {addDigit(digit: "2")}) {Text("2")}
                Button(action: {addDigit(digit: "3")}) {Text("3")}
                Button(action: {
                    onOperatorClicked(oper: "+")
                }) {Text("+")}
            }
            
            HStack {
                Button(action: {addDigit(digit: "0")}) {Text("0")}
                Button(action: {doubleTypeDigit()}) {Text(".")}
                Button(action: {calculateResult()}) {Text("=")}
            }
        }
        .font(.largeTitle)
        .tint(.gray)
        .buttonStyle(.bordered)
//        .frame(width: 50, height: 100).padding()
    }
    
    func onOperatorClicked(oper: String) {
        if number2 != "" {
            calculateResult()
        }
        operatorClicked = oper
    }
    
    func doubleTypeDigit() {
        if operatorClicked != "" {
            number2 = number2 + "."
        } else {
            number1 = number1 + "."
        }
    }

    func getDisplay() -> String {
        if number1 == "" {
            return "0"
        }
        
        if number2 == "" {
            return number1
        }
        else {
            return number2
        }
    }
        
    func addDigit(digit: String) {
        if operatorClicked != "" {
            number2 += digit
        } else {
            number1 += digit
        }
    }
    
    func calculateResult() {
        let num1 = number1 == "" ? 0.0 : Double(number1)!
        let num2 = Double(number2)!
        var result = 0.0
        var isError = false
        switch operatorClicked {
            case "+" :
                result = num1 + num2
                break
            case "-" :
                result = num1 - num2
                break
            case "*" :
                result = num1 * num2
                break
            case "/" :
                result = num1 / num2
                break
            case "%" :
                if number1.contains(".") {
                    isError = true
                } else {
                    result = Double(Int(num1) % Int(num2))
                }
  
            default:
                break
        }
        if isError {
            number1 = "ERROR"
        } else if result == floor(result) {
            number1 = String(Int(result))
        } else {
            number1 = String(result)
        }
        number2 = ""
        operatorClicked = ""
    }
    
    func flipSign() {
        if operatorClicked != "" {
            if number2.first == "-" {
                number2.remove(at: number2.startIndex)
            } else {
                number2 = "-" + number2
            }
        } else {
            if number1.first == "-" {
                number1.remove(at: number1.startIndex)
            } else {
                number1 = "-" + number1
            }
        }
    }
    
    func clear() {
        operatorClicked = ""
        number1 = ""
        number2 = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

