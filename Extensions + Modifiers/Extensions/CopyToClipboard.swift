//
//  CopyToClipboard.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI
import UIKit

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



extension View {
    /// Captures the current window as a UIImage and presents the iOS share sheet.
    func shareScreenshot() {
        guard
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowScene.windows.first,
            let rootVC = window.rootViewController
        else { return }

        let format = UIGraphicsImageRendererFormat()
        format.scale = UIScreen.main.scale

        let renderer = UIGraphicsImageRenderer(bounds: window.bounds, format: format)
        let image = renderer.image { _ in
            window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
        }.withRenderingMode(.alwaysOriginal)

        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)

        // iPad support: anchor the popover to the window
        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = window
            popover.sourceRect = CGRect(x: window.bounds.midX, y: window.bounds.midY, width: 0, height: 0)
            popover.permittedArrowDirections = []
        }

        rootVC.present(activityVC, animated: true)
    }
}
