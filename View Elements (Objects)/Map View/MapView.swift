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
    
    
    var body: some View {
        ZStack {
            MapExtensionView(map: map)
                .objectAppearanceModifier(layer: map, systemImageName: "map", systemImage2: "", titleText: "Map Object")
            
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



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
    
    
    
    /*
        .frame(width: map.mapFrameWidth, height: map.mapFrameHeight * 1.35)
        .cornerRadius(map.appearance.cornerRadius)
        .if(map.mapInvertColor) { view in
            view.colorInvert()
        }
        .overlay(map.mapOverlayColor)
        .mask( // This mask removes the apple text and legal button from the map
            RoundedRectangle(cornerRadius: map.appearance.cornerRadius)
                .frame(width: map.mapFrameWidth, height: map.mapFrameHeight)
                .cornerRadius(map.appearance.cornerRadius)
        )
        .shadow(color: .black.opacity(map.appearance.shadowOpacity), radius: map.appearance.shadow.radius, y: map.appearance.shadow.offset.y)
        .blendMode(map.appearance.blendMode)
        .opacity(map.appearance.opacity)
        .animation(.spring())
        //MARK: Testing purposes only - will be removed into own section.
        .onTapGesture{
            map.appearance.showSettings.toggle()
        }
}

//MARK: Testing purposes only - will be removed into own section.
.sheet(isPresented: $map.appearance.showSettings){
    MapSettings(map: map)
}
     */

