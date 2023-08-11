//
//  ContentView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 20/06/2023.
//

import SwiftUI

struct ContentView: View {
    let microControls = MicroControls()
    var body: some View {
        
        ShowBoardView(micro: microControls)
         
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
