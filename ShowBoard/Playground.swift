//
//  Playground.swift
//  ShowBoard
//
//  Created by Szigeti József on 27.07.23.
//

import SwiftUI

struct Playground: View {
    
    @State var placedObjects: [LayerObject] = .init()
    @State var selection: UUID?
    
    
    func removeSelectedObject() {
        self.placedObjects.removeAll { $0.id == selection }
    }
    
    func addObject(_ object: LayerObject) {
        self.placedObjects.append(object)
    }
    
    
    var selectedObject: LayerObject? {
        self.placedObjects.first { $0.id == selection }
    }
    
    
    
    var body: some View {
        VStack {
            
                HStack {
                    Spacer()
                    Button(action: removeSelectedObject) {
                        Image(systemName: "trash")
                            .tint(.red)
                    }
                    
                    Menu("Add") {
                        Button("text", action:  { self.addObject(TextObject()) })
                        Button("shape", action: { self.addObject(CustomShapeObject()) })
                        Button("gauge", action: { self.addObject(CircleGaugeObject()) })
                        Button("map", action:   { self.addObject(MapObject()) })
                    }
                    .opacity(0.012)
                    .background { Image(systemName: "plus") }
                    
                }.padding()
            
            VStack {
                
                
                ForEach(self.placedObjects) { obj in
                    VStack {
                        switch obj.objectType {
                        case .text:         Text("DynamicTextView(text: obj as! TextObject)")
                        case .map:          Text("Insert map here")
                        case .circleGauge:  Text("Insert circle gauge here")
                        case .customShape:  Text("Custom shape")
                        default:            Text("Not implemented")
                        }
                    }
                    .fixedSize()
                    .border(selection == obj.id ? .red : .clear)
                    .simultaneousGesture(TapGesture()
                        .onEnded { self.selection = obj.id }
                    )
                }
                
                
                
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    Playground()
}
