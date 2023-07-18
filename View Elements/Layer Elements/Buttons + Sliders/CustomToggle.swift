//
//  CustomToggle.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI

struct CustomToggle: View {
    let titleText: String
    let bindingValue: Binding<Bool>
  
    
    var body: some View {
        
        HStack {
            
            Text(titleText)
            
            Spacer()
            
            ZStack {
                Capsule()
                    .frame(width: 40, height: 24)
                    .foregroundColor(Color(bindingValue.wrappedValue ? .systemGreen : .systemGray))
                ZStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Image(systemName: bindingValue.wrappedValue ? "" : "xmark")
                        .font(.footnote)
                       
                }
                .shadow(color: .black.opacity(0.14), radius: 2, x: 0, y: 1)
                .offset(x: bindingValue.wrappedValue ? 9 : -9)
                .scaleEffect(bindingValue.wrappedValue ? 1.0 : 1.0)
                .animation(.interpolatingSpring(stiffness: 300, damping: 20))
            }
            .onTapGesture {
                bindingValue.wrappedValue.toggle()
            }
        }
    }
}


