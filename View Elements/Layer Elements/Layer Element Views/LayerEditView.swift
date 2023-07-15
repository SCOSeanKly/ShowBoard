//
//  LayerEditView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 26/06/2023.
//

import SwiftUI

struct LayerEditView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showLayerEditView: Bool
    @State private var isEditing = false
    @State private var items = ["Text", "Gauges", "Weather", "Charts", "Shapes", "Calendar", "Image", "Maps", "Gallery"]
    private let itemImages = ["character.textbox", "barometer", "cloud.sun", "chart.xyaxis.line", "dot.squareshape", "calendar", "photo", "map", "platter.filled.bottom.and.arrow.down.iphone"]
    @State private var itemButtons = Array(repeating: false, count: 9) // Create an array of boolean values to track the button states
    
    var body: some View {
        ///List Idea
        
        ZStack {
            VStack {
                HStack {
                    Button {
                        showLayerEditView.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            showLayerElementView.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .font(.title)
                            .tint(.black)
                    }
                    Spacer()
                    /*
                    Button {
                        isEditing.toggle()
                    } label: {
                        Image(systemName: isEditing ? "xmark.circle" : "ellipsis.circle")
                            .font(.title)
                            .tint(.black)
                    }
                     */
                }
                .padding()
                .padding(.horizontal)
                
                HStack {
                    Text("Edit Layers")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
                List {
                    ForEach(items.indices, id: \.self) { index in
                        HStack {
                            Image(systemName: itemImages[index % itemImages.count])
                                .foregroundColor(.blue.opacity(itemButtons[index] ? 0.3 : 1.0))
                                
                            
                            if isEditing {
                                TextField("Enter text", text: $items[index])
                            } else {
                                Text(items[index])
                                    .opacity(itemButtons[index] ? 0.3 : 1.0)
                            }
                            
                            Spacer()
                            
                            
                            Button(action: {
                                itemButtons[index].toggle() // Toggle the button state for the corresponding item
                            }, label: {
                                Image(systemName:(itemButtons[index] ? "eye.slash" : "eye"))
                                    .font(.footnote)
                                    .foregroundColor(itemButtons[index] ? Color.red : Color.black)
                            })
                            
                            Image(systemName: "line.3.horizontal")
                                .font(.footnote)
                                .padding(.horizontal)
                             
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .listStyle(PlainListStyle())
                .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
            }
        }
        .presentationDragIndicator(.visible)
        
        
        /*
         ///Moveable Grid Idea
         LayerBackButton(selfViewToClose: $showLayerEditView, showLayerElementView: $showLayerElementView, headerText: "Edit Layers", systemImage: "arrow.left.circle")
         
         MoveableGrid(showLayerElementView: $showLayerElementView)
         */
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
        itemButtons.remove(atOffsets: offsets) // Remove the corresponding button state when deleting an item
    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
        itemButtons.move(fromOffsets: source, toOffset: destination) // Move the corresponding button state along with the item
    }
}
