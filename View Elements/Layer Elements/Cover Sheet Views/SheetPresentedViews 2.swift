//
//  SheetPresentedViews.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct SheetPresentedViews: View {
    
    //MARK: Sheet Presented - Layer Elements
    @Binding var pressedButtonObjectIndex: Int?
    @Binding var showLayerElementView: Bool
    @Binding var showWeatherElementView: Bool
    @Binding var showTextElementView: Bool
    @Binding var showGaugesElementView: Bool
    @Binding var showChartsElementView: Bool
    @Binding var showShapesElementView: Bool
    @Binding var showCalendarElementView: Bool
    @Binding var showMapsElementView: Bool
    @Binding var showImportImageElementView: Bool
    @Binding var showLayerEditView: Bool
    @Binding var showImagePickerSheet1: Bool
    @Binding var showImagePickerSheet2: Bool
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    @Binding var showUrlImageView: Bool
  //  @Binding var showDynamicTextEditView: Bool
   
  
    var body: some View {
        ZStack{
            /// Empty content placeholder
        }
        
        //MARK: Element Selection Menu
        .sheet(isPresented: $showLayerElementView) {
            LayerElementView(showLayerElementView: $showLayerElementView, pressedButtonObjectIndex: $pressedButtonObjectIndex, showWeatherElementView: $showWeatherElementView, showTextElementView: $showTextElementView, showGaugesElementView: $showGaugesElementView, showChartsElementView: $showChartsElementView, showShapesElementView: $showShapesElementView, showCalendarElementView: $showCalendarElementView, showImportImageElementView: $showImportImageElementView, showMapsElementView: $showMapsElementView, showUrlImageView: $showUrlImageView, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Text Element
        .sheet(isPresented: $showTextElementView) {
            TextElementView(showLayerElementView: $showLayerElementView, showTextElementView: $showTextElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Gauges Element
        .sheet(isPresented: $showGaugesElementView) {
            GaugesElementView(showLayerElementView: $showLayerElementView, showGaugesElementView: $showGaugesElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Weather Element Selection Menu
        .sheet(isPresented: $showWeatherElementView) {
            WeatherElementView(showWeatherElementView: $showWeatherElementView, showLayerElementView: $showLayerElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Charts Element
        .sheet(isPresented: $showChartsElementView) {
            ChartsElementView(showLayerElementView: $showLayerElementView, showChartsElementView: $showChartsElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Shapes Element
        .sheet(isPresented: $showShapesElementView) {
            ShapesElementView(showLayerElementView: $showLayerElementView, showShapesElementView: $showShapesElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Calendar Element
        .sheet(isPresented: $showCalendarElementView) {
            CalendarElementView(showLayerElementView: $showLayerElementView, showCalendarElementView: $showCalendarElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Maps Element
        .sheet(isPresented: $showMapsElementView) {
            MapsElementView(showLayerElementView: $showLayerElementView, showMapsElementView: $showMapsElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Import Image Element
        .sheet(isPresented: $showImportImageElementView) {
            ImportImageElementView(showLayerElementView: $showLayerElementView, showImportImageElementView: $showImportImageElementView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3)
                .presentationDetents([.fraction(0.45), .large])
        }
        //MARK: Import URL Image Element
        .sheet(isPresented: $showUrlImageView) {
            URLImages(showUrlImageView: $showUrlImageView, showLayerElementView: $showLayerElementView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        //MARK: Layer Edit View
        .sheet(isPresented: $showLayerEditView) {
            LayerEditView(showLayerElementView: $showLayerElementView, showLayerEditView: $showLayerEditView)
                .presentationDetents([.fraction(0.45), .large])
        }
        
        // App Settings still to be added
      
    }
}

