//
//  LayerObjectProviderView.swift
//  ShowBoard
//
//  Created by Szigeti József on 19.07.23.
//
/*
 import SwiftUI
 
 struct LayerObjectProviderView: View {
 
 var layerObject: any LayerObject
 
 var body: some View {
 
 ZStack {
 switch objectType {
 case .text:
 
 Text((layerObject as! TextObject).dynamicText)
 .shadow(
 radius: (layerObject as! TextObject).appearance.shadow.radius,
 x: (layerObject as! TextObject).appearance.shadow.offset.x,
 y: (layerObject as! TextObject).appearance.shadow.offset.y
 )
 .font((layerObject as! TextObject).font)
 .tracking((layerObject as! TextObject).fontTracking)
 .multilineTextAlignment((layerObject as! TextObject).textAlignment)
 .fontWeight((layerObject as! TextObject).fontWeight)
 .foregroundColor((layerObject as! TextObject).fontColor)
 .background(.ultraThinMaterial)
 .blendMode((layerObject as! TextObject).appearance.blendMode)
 .rotationEffect((layerObject as! TextObject).appearance.rotation)
 .opacity((layerObject as! TextObject).appearance.opacity)
 .blur(radius: (layerObject as! TextObject).appearance.blur)
 /*case customShape:
  case .map:
  case .circleGauge:*/
 default:
 EmptyView()
 }
 }
 .fixedSize()
 
 }
 }
 */
