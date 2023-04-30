//
//  ButtonView.swift
//  Calculator
//
//  Created by king on 4/29/23.
//

import SwiftUI


struct ButtonView: View {
    
    var action: () -> ()
    var width: CGFloat
    var text: String
    
    var body: some View {
        Button(action: action) {
            Text(text)
            .frame(maxWidth: .infinity)
        }
        .frame(width: width)
    }
}



struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: {}, width: 100.0, text: "hi")
    }
}
