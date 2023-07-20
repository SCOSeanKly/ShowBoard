//
//  CustomSlider.swift
//  ShowBoard
//
//  Created by Sean Kelly on 20/07/2023.
//

import SwiftUI

struct CustomSlider<T: BinaryFloatingPoint>: View {
    @Binding var value: T
    let inRange: ClosedRange<T>
    let activeFillColor: Color
    let fillColor: Color
    let emptyColor: Color
    let height: CGFloat
    let onEditingChanged: (Bool) -> Void
  
    
    // private variables
    @State private var localRealProgress: T = 0
    @State private var localTempProgress: T = 0
    @GestureState private var isActive: Bool = false
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                VStack {
                    ZStack(alignment: .center) {
                        
                        LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.white.opacity(isActive ? 0.3 : 0.6)]), startPoint: .top, endPoint: .bottom)
                            .cornerRadius(100)
                        Capsule()
                            .fill(emptyColor)
                        Capsule()
                            .fill(isActive ? activeFillColor : fillColor)
                            .mask({
                                HStack {
                                    Rectangle()
                                        .frame(width: max(bounds.size.width * CGFloat((localRealProgress + localTempProgress)), 0), alignment: .leading)
                                    Spacer(minLength: 0)
                                }
                            })
                        
                      
                     
                            ZStack {
                                Circle()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.15), radius: 1, x: 2, y: 2)
                                
                                Circle()
                                    .frame(width: 16, height: 16)
                                    .foregroundColor(.clear)
                                    .background(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.4), .white.opacity(0.5), .white]), startPoint: .top, endPoint: .bottom))
                                    .clipShape(Circle())
                            }
                            .frame(width: height * 2, height: height * 2)
                            .position(x: bounds.size.width * CGFloat(localRealProgress), y: bounds.size.height / 2) // Center the circle
                            .gesture(DragGesture(minimumDistance: 0)
                                .onChanged { gesture in
                                    let sliderWidth = bounds.size.width
                                    let percentage = min(max(gesture.location.x / sliderWidth, 0), 1)
                                    localRealProgress = T(percentage)
                                    value = max(min(getPrgValue(), inRange.upperBound), inRange.lowerBound)
                                }
                            )
                    }
                    .frame(width: isActive ? bounds.size.width * 1.04 : bounds.size.width, alignment: .center)
                }
                .animation(animation, value: isActive)
            }
            .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .updating($isActive) { value, state, transaction in
                    state = true
                }
                .onChanged { gesture in
                    localTempProgress = T(gesture.translation.width / bounds.size.width)
                    value = max(min(getPrgValue(), inRange.upperBound), inRange.lowerBound)
                }.onEnded { value in
                    localRealProgress = max(min(localRealProgress + localTempProgress, 1), 0)
                    localTempProgress = 0
                })
            .onChange(of: isActive) { newValue in
                value = max(min(getPrgValue(), inRange.upperBound), inRange.lowerBound)
                onEditingChanged(newValue)
            }
            .onAppear {
                localRealProgress = getPrgPercentage(value)
            }
            .onChange(of: value) { newValue in
                if !isActive {
                    localRealProgress = getPrgPercentage(newValue)
                }
            }
        }
        .frame(height: isActive ? height * 2 : height, alignment: .center)
    }
    
    private var animation: Animation {
        if isActive {
            return .spring()
        } else {
            return .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.6)
        }
    }
    
    private func getPrgPercentage(_ value: T) -> T {
        let range = inRange.upperBound - inRange.lowerBound
        let correctedStartValue = value - inRange.lowerBound
        let percentage = correctedStartValue / range
        return percentage
    }
    
    private func getPrgValue() -> T {
        return ((localRealProgress + localTempProgress) * (inRange.upperBound - inRange.lowerBound)) + inRange.lowerBound
    }
}
