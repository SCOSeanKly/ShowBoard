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
                                .frame(width: 30, height: 30)
                                .scaleEffect(isPressing ? 0.8 : 1)
                                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                            
                        case .asset:
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .scaleEffect(isPressing ? 0.8 : 1)
                                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
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
                    .scaleEffect(isPressing ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: isPressing)
            }
        }
        .opacity(disabled ? 0.3 : 1)
        .buttonModifier(isPressing: isPressing, disabled: disabled)
        .onTapGesture {
            //MARK: Button Animation
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
    @State private var isPressing: Bool = false
    @Binding var buttonAction: Bool
    @Binding var showLayerElementView: Bool
    @Binding var importedImage: UIImage?
    
    var body: some View {
        ZStack {
            VStack {
                if let image = importedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .scaleEffect(isPressing ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                    
                    
                } else {
                    Image(systemName: systemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .scaleEffect(isPressing ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                    
                }
                
                Text(buttontext)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.top, -2)
                    .frame(width: 60)
                    .lineLimit(1)
                    .scaleEffect(isPressing ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: isPressing)
                
            }
        }
        .buttonModifier(isPressing: isPressing, disabled: disabled)
        .onTapGesture {
            isPressing.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressing.toggle()
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showLayerElementView = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        buttonAction.toggle()
                    }
                    
                }
                
            }
        }
    }
}

extension View {
    func buttonModifier(isPressing: Bool, disabled: Bool) -> some View {
        self.frame(width: 50, height: 60)
            .padding(10)
            .background(Color.white)
            .cornerRadius(12)
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
            .scaleEffect(isPressing ? 0.95 : 1)
            .animation(.easeIn(duration: 0.1), value: isPressing)
    }
}


struct ButtonsView: View {
    @Binding var placedObjects: [LayerObject]
    @Binding var selection: UUID?
    
    func removeSelectedObject() {
        self.placedObjects.removeAll { $0.id == selection }
    }
    
    func addObject(_ object: LayerObject) {
        self.placedObjects.append(object)
    }
    
    
    var body: some View {
        HStack {
            Button(action: removeSelectedObject) {
                Image(systemName: "trash")
                    .tint(.red)
            }
            Spacer()
            Button {
                self.addObject(TextObject())
            } label: {
                Text("Text")
            }
            
            Button {
                self.addObject(CustomShapeObject())
            } label: {
                Text("Shape")
            }
            
            Button {
                self.addObject(CircleGaugeObject())
            } label: {
                Text("Gauge")
            }
            
            Button {
                self.addObject(MapObject())
            } label: {
                Text("Map")
            }
        }
        .padding()
    }
}
