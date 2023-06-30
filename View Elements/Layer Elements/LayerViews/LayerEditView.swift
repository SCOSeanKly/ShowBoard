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
    //MARK: This array should be populated with the items we add to the view
    @State private var items = ["Text", "Gauges", "Weather", "Charts", "Shapes", "Calendar", "Image", "Maps", "Gallery"]
    
    //MARK: id Tag would determine what image to use based on the item added to the view
    private let itemImages = ["character.textbox", "barometer", "cloud.sun", "chart.xyaxis.line", "dot.squareshape", "calendar", "photo", "map", "platter.filled.bottom.and.arrow.down.iphone"]
    
    var body: some View {
        ZStack {
            VStack{
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
                    Button {
                        
                        isEditing.toggle()
                        
                    } label: {
                        Image(systemName: isEditing ? "xmark.circle" : "ellipsis.circle")
                            .font(.title)
                            .tint(.black)
                    }
                }
                .padding()
                .padding(.horizontal)
                
                HStack{
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
                                .foregroundColor(.blue)
                            
                            if isEditing {
                                TextField("Enter text", text: $items[index])
                            } else {
                                Text(items[index])
                            }
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
                .listStyle(PlainListStyle())
                .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
            }
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

