//
//  AlertModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    @Binding var showClipboardAlert: Bool
    let runShortcut: () -> Void
    
    func body(content: Content) -> some View {
        content.alert(isPresented: $showClipboardAlert) {
            Alert(
                title: Text("Content Captured"),
                message: Text("The content has been captured successfully to the device."),
                primaryButton: .default(Text("Run Shortcut"), action: runShortcut),
                secondaryButton: .cancel(Text("Cancel"))
            )
        }
    }
}


struct DownloadShortcutModifier: ViewModifier {
    @Binding var showClipboardAlert: Bool
    let url: URL
    
    func body(content: Content) -> some View {
        content.alert(isPresented: $showClipboardAlert) {
            Alert(
                title: Text("Download Shortcut"),
                message: Text("An iOS shortcut is required to set the wallpaper."),
                primaryButton: .default(Text("Download Shortcut"), action: {
                    UIApplication.shared.open(url)
                }),
                secondaryButton: .cancel(Text("Cancel"))
            )
        }
    }
}
