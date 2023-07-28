//
//  Playground.swift
//  ShowBoard
//
//  Created by Szigeti József on 27.07.23.
//
/*
import SwiftUI

struct Playground: View {
    
    @State private var placedObjects: [LayerObject] = []
    @State private var selection: UUID?
    
    
    var body: some View {
        VStack {
            
            ButtonsView(placedObjects: $placedObjects, selection: $selection)
            
            VStack {
                
                
                ForEach(self.placedObjects) { obj in
                    VStack {
                        switch obj.objectType {
                        case .text:         Text("DynamicTextView(text: obj as! TextObject)")
                        case .map:          Text("Insert map here")
                        case .circleGauge:  Text("Insert circle gauge here")
                        case .customShape:  Text("Custom shape")
                        }
                    }
                    .fixedSize()
                    .padding()
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

struct Playground_Previews: PreviewProvider {
    static var previews: some View {
        Playground()
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
 */
