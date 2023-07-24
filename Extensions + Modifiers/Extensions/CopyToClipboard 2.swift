//
//  CopyToClipboard.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

extension View {
    
    //Copies the screen image to the clipboard for export
    func copyImageToClipboard() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        let format = UIGraphicsImageRendererFormat()
        format.scale = UIScreen.main.scale // Use the screen scale for full resolution
        
        let renderer = UIGraphicsImageRenderer(bounds: window.bounds, format: format)
        let image = renderer.image { context in
            // Add .withRenderingMode(.alwaysOriginal) to capture the original image
            window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
        }.withRenderingMode(.alwaysOriginal) // Apply .withRenderingMode(.alwaysOriginal) to the captured image
        
        UIPasteboard.general.image = image
        
        if UIPasteboard.general.image != nil {
            print("Image copied to clipboard successfully.")
        } else {
            print("Failed to copy image to clipboard.")
        }
    }
}

