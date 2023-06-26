//
//  MenuButtonsView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct MenuButtonsView: View {
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @Binding var hideMenuButtons: Bool
    @Binding var showClipboardAlert: Bool
    @Binding var showAdjustmentsView: Bool
    @State var numberOfShakes: CGFloat = 0
    @Binding var showLayerEditView: Bool
    
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Button {
                        
                        showAdjustmentsView.toggle()
                        
                        withAnimation(.linear(duration: 2.0)) {
                            if numberOfShakes == 0 {
                                numberOfShakes = 10
                            }else {
                                numberOfShakes = 0
                            }
                        }
                    }label: {
                        Image(systemName: "square.grid.2x2")
                            .font(.title2)
                            .tint(.white)
                            .padding()
                            .shadow(radius: 5)
                            .modifier(ShakeEffect(delta: numberOfShakes))
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        
                        showLayerEditView.toggle()
                        
                    }label: {
                        Image(systemName: "square.3.layers.3d.bottom.filled")
                            .font(.title2)
                            .tint(.white)
                            .shadow(radius: 5)
                            .offset(y: 2)
                    }
                    
                    
                    
                    Button {
                        
                        hideMenuButtons = true
                        
                        performDelayedAction(after: 0.2) {
                            copyImageToClipboard()
                        }
                        
                        performDelayedAction(after: 0.2) {
                            showClipboardAlert = true
                        }
                        
                        performDelayedAction(after: 0.2) {
                            hideMenuButtons = false
                            
                        }
                    }label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .tint(.white)
                            .padding()
                            .shadow(radius: 5)
                    }
                }
                
                Spacer()
            }
            .padding()
            .opacity(hideMenuButtons ? 0.0 : 1.0)
        }
    }
}


