//
//  MapView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject var locationDataManager: LocationDataManager
    @StateObject var map = MapObject()
    @State private var isDragging: Bool = false
    @State private var showSettings: Bool = false
    
    
    var body: some View {
        ZStack {
            MapExtensionView(locationDataManager: locationDataManager, map: map)
                .frame(width: map.mapFrameWidth, height: map.mapFrameHeight * 1.35)
                .if(map.mapInvertColor) { view in
                    view.colorInvert()
                }
                .overlay(map.mapOverlayColor)
                .mask(
                    RoundedRectangle(cornerRadius: map.appearance.cornerRadius)
                        .frame(width: map.mapFrameWidth, height: map.mapFrameHeight)
                        .cornerRadius(map.appearance.cornerRadius)
                )
                .shadow(color: .black.opacity(map.appearance.shadowOpacity), radius: map.appearance.shadow.radius, y: map.appearance.shadow.offset.y)
                .blendMode(map.appearance.blendMode)
                .opacity(map.appearance.opacity)
                .animation(.spring())
                .modifier(WidgetModifier(isDragging: $isDragging, enableZoom: false))
                .onTapGesture{
                    showSettings.toggle()
                }
        }
        .sheet(isPresented: $showSettings){
            
            //MARK: Settings for Maps
            MapSettings(map: map, showSettings: $showSettings)
        }
    }
}

//MARK: Extension for invertColor toggle
extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, modifier: (Self) -> Content) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locationDataManager: LocationDataManager())
    }
}
