//
//  MoveableGrid.swift
//  ShowBoard
//
//  Created by Sean Kelly on 03/07/2023.
//

import SwiftUI

    struct MoveableGrid: View {
        /// View Properties
        @Binding var showLayerElementView: Bool
        
        @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange]
        
        @State private var draggingItem: Color?
        
        var body: some View {
            
            
                ScrollView(.vertical) {
                    let columns = Array(repeating: GridItem(spacing: 10), count: 6)
                    LazyVGrid(columns: columns, spacing: 10, content: {
                        ForEach(colors, id: \.self) { color in
                            GeometryReader {
                                let size = $0.size
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(color.gradient)
                                    /// Drag
                                    .draggable(color) {
                                        /// Custom Preview View
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.clear.opacity(0.000001))
                                            .frame(width: size.width, height: size.height)
                                            .onAppear {
                                                draggingItem = color
                                            }
                                    }
                                    /// Drop
                                    .dropDestination(for: Color.self) { items, location in
                                        draggingItem = nil
                                        return false
                                    } isTargeted: { status in
                                        if let draggingItem, status, draggingItem != color {
                                            /// Moving Color from source to destination
                                            if let sourceIndex = colors.firstIndex(of: draggingItem),
                                               let destinationIndex = colors.firstIndex(of: color) {
                                                withAnimation(.spring()) {
                                                    let sourceItem = colors.remove(at: sourceIndex)
                                                    colors.insert(sourceItem, at: destinationIndex)
                                                }
                                            }
                                        }
                                    }

                            }
                            .frame(height: 120)
                        }
                    })
                    .padding(15)
                    .offset(y: -15)
                }
                .presentationDragIndicator(.visible)
        }
    }
/*
 struct MoveableGrid_Previews: PreviewProvider {
 static var previews: some View {
 MoveableGrid()
 }
 }
 */
