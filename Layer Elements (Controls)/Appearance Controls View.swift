//
//  AppearanceControlView.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.07.23.
//

import SwiftUI


struct AppearanceControlView: View {
    
    @StateObject var layer: LayerObject
    
    let systemImageName: String
    let titletext: String
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    @State private var doNothing: Bool = false
    @Binding var showMicroControls: Bool
    
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            
            Group {
                if showMicroControls {
                    MicroControlsView(showMicroControls: $showMicroControls, layer: layer)
                }
                
                ResetValues(resetValues: {}, showMicroControls: $showMicroControls, systemImageName: systemImageName, titleText: titletext)
                
                WavyDockControls(layer: layer)
                
                CalendarControls(layer: layer)
                
                CustomShapeControls(layer: layer)
                
                ScaleWidthHeightControls(layer: layer)
            }
            
            Group {
                
                Font_GaugeLabelControls(layer: layer)
                
                CornerRadiusSkewControls(layer: layer)
                
                CommonControls(layer: layer)
                
                GlassControls(layer: layer)
            }
            
            Spacer()
                .frame(height: 100)
                .onChange(of: layer.appearance.rotation) {
                    layer.appearance.rotation = $0}
        }
        .onAppear{
            showMicroControls = true
        }
        .onDisappear{
            showMicroControls = false
        }
        .customPresentationWithPrimaryBackground(detent: .medium, detent2: .small, backgroundColorOpacity: 1.0)
    }
}


