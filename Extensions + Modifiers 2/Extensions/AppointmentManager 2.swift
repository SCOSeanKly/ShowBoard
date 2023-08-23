//
//  UpcomingEvents.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/08/2023.
//

import EventKit

struct AppointmentManager {
    
    func fetchUpcomingAppointments(completion: @escaping (Int) -> Void) {
        let eventStore = EKEventStore()
        
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            let calendars = eventStore.calendars(for: .event)
            let currentDate = Date()
            let endDate = currentDate.addingTimeInterval(7 * 24 * 60 * 60) // Fetch appointments for the next 7 days
            
            let predicate = eventStore.predicateForEvents(withStart: currentDate, end: endDate, calendars: calendars)
            let events = eventStore.events(matching: predicate)
            
            DispatchQueue.main.async { // Update UI on the main queue
                completion(events.count)
            }
            
        case .notDetermined:
            eventStore.requestAccess(to: .event) { granted, error in
                if granted {
                    self.fetchUpcomingAppointments(completion: completion)
                }
            }
        default:
            // Handle other authorization statuses
            break
        }
    }
}






