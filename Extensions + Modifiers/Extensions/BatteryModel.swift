//
//  BatteryModel.swift
//  ShowBoard
//
//  Created by Sean Kelly on 20/06/2023.
//

import SwiftUI

class BatteryViewModel: ObservableObject {
    @Published var batteryLevel: Int = 0
    @Published var batteryStateDescription: String = "Unknown"
    @Published var batteryStateColor: Color = .gray
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
        setBatteryState()
        
        // Notification observers
        NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange(notification:)), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange(notification:)), name: UIDevice.batteryStateDidChangeNotification, object: nil)
    }
    
    @objc func batteryLevelDidChange(notification: Notification) {
        self.batteryLevel = Int(UIDevice.current.batteryLevel * 100)
    }
    
    @objc func batteryStateDidChange(notification: Notification) {
        setBatteryState()
    }
    
    private func setBatteryState() {
        let batteryState = UIDevice.current.batteryState
        self.batteryStateDescription = getBatteryDescription(for: batteryState)
        self.batteryStateColor = getBatteryColor(for: batteryState)
    }
    
    private func getBatteryColor(for state: UIDevice.BatteryState) -> Color {
        switch state {
        case .unplugged:
            return .blue
        case .charging:
            return .yellow
        case .full:
            return .green
        case .unknown:
            return .gray
        @unknown default:
            return .gray
        }
    }
    
    private func getBatteryDescription(for state: UIDevice.BatteryState) -> String {
        switch state {
        case .unplugged:
            return "Unplugged"
        case .charging:
            return "Charging"
        case .full:
            return "Fully Charged"
        case .unknown:
            return "?"
        @unknown default:
            return "?"
        }
    }
    
    func startBatteryMonitoring() {
          UIDevice.current.isBatteryMonitoringEnabled = true
      }
}
