//
//  ObjectSelectionButtons.swift
//  ShowBoard
//
//  Created by Sean Kelly on 03/08/2023.
//

import SwiftUI

struct ObjectSelectionButton: View {
    
    var action: () -> Void
    let imageType: ImageType
    let textDescription: String
    let disabled: Bool
    let cornerRadius: CGFloat
    
    @State private var isPressing: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    
                    if let imageName = getImageName() {
                        switch imageType {
                        case .system:
                            Image(systemName: imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(radius: 2, y:2)
                                .scaleEffect(0.7)
                                .frame(width: 40, height: 40)
                            
                        case .asset:
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(radius: 2, y:2)
                                .frame(width: 40, height: 40)
                        }
                    }
                }
                
                Text(textDescription)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.top, -2)
                    .frame(width: 50)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }
        }
        .blendMode(disabled ? .luminosity : .normal)
        .opacity(disabled ? 0.3 : 1)
        .buttonModifier(isPressing: isPressing, disabled: disabled, cornerRadius: cornerRadius)
        .onTapGesture {
            isPressing.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressing.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    action()
                }
            }
        }
        .disabled(disabled)
    }
    
    private func getImageName() -> String? {
        switch imageType {
        case .system(let name):
            return name
        case .asset(let name):
            return name
        }
    }
}

struct ImportImageButton: View {
    
    let systemImage: String
    let buttontext: String
    let disabled: Bool
    let cornerRadius: CGFloat
    @State private var isPressing: Bool = false
    @Binding var buttonAction: Bool
    @Binding var showLayerElementView: Bool
    @Binding var importedImage: UIImage?
    var action: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                if let image = importedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 2, y:2)
                        .scaleEffect(0.8)
                        .frame(width: 40, height: 40)
                    
                } else {
                    Image(systemName: systemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 2, y:2)
                        .scaleEffect(0.7)
                        .frame(width: 40, height: 40)
                }
                
                Text(buttontext)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.top, -2)
                    .frame(width: 60)
                    .lineLimit(1)
            }
        }
        .buttonModifier(isPressing: isPressing, disabled: disabled, cornerRadius: cornerRadius)
        .onTapGesture {
            isPressing.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressing.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showLayerElementView = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        buttonAction.toggle()
                        action()
                    }
                }
            }
        }
    }
}

extension View {
    func buttonModifier(isPressing: Bool, disabled: Bool, cornerRadius: CGFloat) -> some View {
        self.frame(width: 50, height: 60)
            .padding(10)
            .background(Color.white)
            .cornerRadius(cornerRadius)
            .if(!disabled) { view in
                view.shadow(color: Color.black.opacity(isPressing ? 0.3 : 0.2),
                            radius: isPressing ? 0.5 : 3,
                            x: 0,
                            y: isPressing ? 0 : 3)
            }
            .if(disabled) { view in
                view.shadow(color: Color.black.opacity(0.1),
                            radius: 3.0,
                            x: 0,
                            y: 2)
            }
            .tint(.black)
            .scaleEffect(isPressing ? 0.9 : 1)
            .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
    }
}
