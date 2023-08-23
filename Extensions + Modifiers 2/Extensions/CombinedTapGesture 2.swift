//
//  TapGesture.swift
//  ShowBoard
//
//  Created by Sean Kelly on 09/08/2023.
//

import SwiftUI
import Combine

struct CombinedTapGesture: Gesture {
    let singleTap: () -> Void
    let doubleTap: () -> Void
    
    init(singleTap: @escaping () -> Void, doubleTap: @escaping () -> Void) {
        self.singleTap = singleTap
        self.doubleTap = doubleTap
    }
    
    var body: some Gesture {
        SequenceGesture(
            TapGesture(count: 2).onEnded { _ in doubleTap() },
            TapGesture(count: 1).onEnded { _ in singleTap() }
         
        ).exclusively(before: TapGesture().onEnded { _ in })
    }
}


//MARK: Useage
/*
 .gesture(
                CombinedTapGesture(
                    singleTap: {
                        singleTapAction.toggle()
                    },
                    doubleTap: {
                        doubleTapAction.toggle()
                    }
                )
            )
 */
