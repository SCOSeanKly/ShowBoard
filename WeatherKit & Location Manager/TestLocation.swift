//
//  TestLocation.swift
//  ShowBoard
//
//  Created by Sean Kelly on 08/09/2023.
//

import SwiftUI

struct TestLocation: View {
    @ObservedObject var locationManager = AppModel.shared.lObserver
    let font = Font.system(size: 12) // You can replace 12 with your desired font size


    var body: some View {
        VStack {
            Text(locationManager.city)
                .font(font)
            
            Text(locationManager.country)
                .font(font)
            
            
            Text(locationManager.state)
                .font(font)
            
            
            Text(locationManager.street)
                .font(font)
            
            
            Text(locationManager.postalCode)
                .font(font)
            
            
            Text(String(locationManager.latitude))
                .font(font)
            
            
            Text(String(locationManager.longitude))
                .font(font)
            
            
            Text(String(locationManager.neighborhood))
                .font(font)
            
        }
    }
}


 #Preview {
     TestLocation()
 }
 

  
