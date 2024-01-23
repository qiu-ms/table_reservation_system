//
//  Table.swift
//  table_reservation_system
//
//  Created by Qiu, Men Seng on 03.12.23.
//

import SwiftUI

struct Table: View {
    let number: Int
    @Binding var reservations: [Reservation]
    let viewDate: Date
    
    @State private var showingAlert = false
    
    var body: some View {
        let bools = reservations.map {Calendar.current.isDate(viewDate, equalTo: $0.date, toGranularity: .minute) && $0.tableNumber == self.number}
        
        if bools.contains(true) {
            Button(String(number)){
                showingAlert.toggle()
            }.foregroundStyle(.red).alert("Reservierung löschen", isPresented: $showingAlert, actions: {
                
                Button("OK", action: {
                    reservations.remove(at: reservations.firstIndex(of: reservations.filter{Calendar.current.isDate(viewDate, equalTo: $0.date, toGranularity: .minute) && $0.tableNumber == self.number}[0])!)
                })
                Button("Abbrechen", role: .cancel, action: {})
            }, message: {
            }).padding()
        } else {
            Text(String(number))
        }
    }
    
}



