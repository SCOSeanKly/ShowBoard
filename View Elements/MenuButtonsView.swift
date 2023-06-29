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
    @Binding var showMicroContols: Bool
    @State private var isPressing: Bool = false
    @State private var isPressingLayers: Bool = false
    @State private var isPressingExport: Bool = false
    
    
    var body: some View {
        Group {
            ZStack {
                VStack {
                    HStack {
                        
                        Image(systemName: showMicroContols ? "xmark" : "square.grid.2x2")
                            .font(.title2)
                            .foregroundColor(showMicroContols ? .red : .white)
                            .padding()
                            .shadow(radius: 5)
                            .contentShape(Circle())
                            .scaleEffect(isPressing ? 0.8 : 1)
                            .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                            .onTapGesture(count: 2) {
                                showMicroContols.toggle()
                            }
                            .onTapGesture {
                                isPressing.toggle()
                                
                                if !showMicroContols {
                                    
                                    showAdjustmentsView.toggle()
                               
                                    
                                } else {
                                    
                                    showMicroContols.toggle()
                                  
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    isPressing.toggle()
                                    
                                }
                            }
                        
                        Spacer()
                        
                        Image(systemName: "square.3.layers.3d.bottom.filled")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .shadow(radius: 5)
                            .contentShape(Circle())
                            .offset(y: 2)
                            .scaleEffect(isPressingLayers ? 0.8 : 1)
                            .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressingLayers)
                            .onTapGesture {
                                showLayerEditView.toggle()
                                
                                isPressingLayers.toggle()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    isPressingLayers.toggle()
                                }
                            }
                            .offset(x: 15)
                        
                        Image(systemName: "square.and.arrow.up")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .shadow(radius: 5)
                            .contentShape(Circle())
                            .onTapGesture {
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
                            }
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                .opacity(hideMenuButtons ? 0.0 : 1.0)
            }
        }
    }
}

struct MenuButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowBoardView()
    }
}

