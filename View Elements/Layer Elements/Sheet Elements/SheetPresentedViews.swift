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
    
    var body: some View {
        ZStack{
            // Empty Content Placeholder
        }
        
        //MARK: Element Selection Menu
        .sheet(isPresented: $showLayerElementView) {
            LayerElementView(showLayerElementView: $showLayerElementView, showWeatherElementView: $showWeatherElementView, showTextElementView: $showTextElementView, showGaugesElementView: $showGaugesElementView, showChartsElementView: $showChartsElementView, showShapesElementView: $showShapesElementView, showCalendarElementView: $showCalendarElementView, showMapsElementView: $showMapsElementView, showImportImageElementView: $showImportImageElementView, pressedButtonObjectIndex: $pressedButtonObjectIndex)
        }
        
        //MARK: Text Element
        .sheet(isPresented: $showTextElementView) {
            TextElementView(showLayerElementView: $showLayerElementView, showTextElementView: $showTextElementView)
        }
        
        //MARK: Gauges Element
        .sheet(isPresented: $showGaugesElementView) {
            GaugesElementView(showLayerElementView: $showLayerElementView, showGaugesElementView: $showGaugesElementView)
        }
        
        //MARK: Weather Element Selection Menu
        .sheet(isPresented: $showWeatherElementView) {
            WeatherElementView(showWeatherElementView: $showWeatherElementView, showLayerElementView: $showLayerElementView)
        }
        
        //MARK: Charts Element
        .sheet(isPresented: $showChartsElementView) {
            ChartsElementView(showLayerElementView: $showLayerElementView, showChartsElementView: $showChartsElementView)
        }
        
        //MARK: Shapes Element
        .sheet(isPresented: $showShapesElementView) {
            ShapesElementView(showLayerElementView: $showLayerElementView, showShapesElementView: $showShapesElementView)
        }
        
        //MARK: Calendar Element
        .sheet(isPresented: $showCalendarElementView) {
            CalendarElementView(showLayerElementView: $showLayerElementView, showCalendarElementView: $showCalendarElementView)
        }
        
        //MARK: Maps Element
        .sheet(isPresented: $showMapsElementView) {
            MapsElementView(showLayerElementView: $showLayerElementView, showMapsElementView: $showMapsElementView)
        }
        
        //MARK: Import Image Element
        .sheet(isPresented: $showImportImageElementView) {
            ImportImageElementView(showLayerElementView: $showLayerElementView, showImportImageElementView: $showImportImageElementView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3)
        }
        
        //MARK: Layer Edit View
        .sheet(isPresented: $showLayerEditView) {
           LayerEditView(showLayerElementView: $showLayerElementView, showLayerEditView: $showLayerEditView)
        }
        
        
    }
}

