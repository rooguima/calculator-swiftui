//
//  ContentView.swift
//  calculator
//
//  Created by Rodrigo Guimarães on 22/03/20.
//  Copyright © 2020 Rodrigo Guimarães. All rights reserved.
//

import SwiftUI


enum CalculatorButtonItem :String {
    
    case divide, multiply, minus, plus, equal
    case clear, flip, percent
    case dot
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    
    var title: String {
        switch self {
            case .zero: return "0"
            case .one:  return "1"
            case .two:  return "2"
            case .three:  return "3"
            case .four:  return "4"
            case .five:  return "5"
            case .six:  return "6"
            case .seven:  return "7"
            case .eight:  return "8"
            case .nine:  return "9"
            case .divide:  return "÷"
            case .multiply:  return "x"
            case .minus:  return "-"
            case .plus:  return "+"
            case .equal:  return "="
            case .dot:  return "."
            case .clear:  return "AC"
            case .flip:  return "+/-"
            case .percent:  return "%"
        }
    }
    
    var background: Color {
        switch self {
        case .divide, .multiply, .minus, .plus, .equal:
                return Color(.orange)
        case .clear, .flip, .percent:
                return Color(.gray)
            default:
                return Color(.darkGray)
        }
    }
}


struct ContentView: View {
    
    let buttons : [[CalculatorButtonItem]] = [
        [.clear, .flip, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .zero, .dot, .equal],
    ]
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 12){
                HStack {
                    Spacer()
                    Text("0")
                        .font(.system(size: 64))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }
                
                ForEach(buttons, id: \.self){ row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self){ button in
                            Text(button.title)
                            .font(.system(size: 32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .foregroundColor(.white)
                                .background(button.background)
                                .cornerRadius(self.buttonWidth())
                        }
                    }
                }
            }
        }
    }
    
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
