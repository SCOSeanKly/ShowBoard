//
//  TextCase.swift
//  ShowBoard
//
//  Created by Sean Kelly on 06/09/2023.
//

import SwiftUI

struct TextCasePicker: View {
    @Binding var selectedCase: TextCase

    let textCases: [TextCase] = [.uppercase, .lowercase, .capitalize, .none]

    var body: some View {
        
        HStack {
            
            Text("Font case:")
                .titleFont()
            
            Spacer()
            
            Picker("Text Case", selection: $selectedCase) {
                ForEach(textCases, id: \.self) { textCase in
                    Text(textCase.rawValue.capitalized)
                }
            }
            .pickerStyle(.menu)
            
            .scaleEffect(0.8)
        }
        .frame(height: 30)
        .padding(.horizontal)
    }
}

struct TextCaseTest: View {
    @State private var selectedCase = TextCase.uppercase

    var body: some View {
        VStack {
            Text("Hello, World!".applyTextCase(selectedCase))

            TextCasePicker(selectedCase: $selectedCase)
        }
    }
}

enum TextCase: String {
    case uppercase = "UPPERCASE"
    case lowercase = "lowercase"
    case capitalize = "Capitalize"
    case none = "None"
}

extension String {
    func applyTextCase(_ textCase: TextCase) -> String {
        switch textCase {
        case .uppercase:
            return self.uppercased()
        case .lowercase:
            return self.lowercased()
        case .capitalize:
            return self.capitalized
        case .none:
            return self
        }
    }
}

struct TextCaseTest_Previews: PreviewProvider {
    static var previews: some View {
        TextCaseTest()
    }
}

