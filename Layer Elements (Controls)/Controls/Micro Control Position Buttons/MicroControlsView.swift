//
//  ControlButtons.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct MicroControlsView: View {
    @Binding var showMicroControls: Bool
    @StateObject var layer: LayerObject
    
    var body: some View {
        
        HStack(spacing: 50){
            PositionButton(layer: layer)
            ScaleButton(layer: layer)
        }
        .padding()
    }
}
