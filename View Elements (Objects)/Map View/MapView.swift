//
//  MapView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject var lObserver = AppModel.shared.lObserver
    @StateObject var map = MapObject()
    @State private var isDragging: Bool = false
    @Binding var showMicroControls: Bool
    
    
    
    var body: some View {
        ZStack {
            MapExtensionView(map: map)
                .objectAppearanceModifier(layer: map, systemImageName: "map", systemImage2: "", titleText: "Map Object", showMicroControls: $showMicroControls)
            
        }
    }
}

//MARK: Extension for invertColor toggle using if statement.
 
 
struct CustomClipShape: Shape {
    let rect: CGRect

    func path(in rect: CGRect) -> Path {
        return Rectangle().path(in: self.rect)
    }
}

