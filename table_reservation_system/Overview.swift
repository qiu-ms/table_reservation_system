//
//  Overview.swift
//  table_reservation_system
//
//  Created by Qiu, Men Seng on 03.12.23.
//

import SwiftUI

struct Overview: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var reservations: [Reservation]
    @State private var showingAlert = false
    
    var body: some View {
        List(reservations, id: \.date) { reservation in
            Section {
                ReservationView(reservation: reservation).onTapGesture {
                    showingAlert.toggle()
                }.foregroundStyle(.red).alert("Reservierung löschen", isPresented: $showingAlert, actions: {
                    
                    Button("OK", action: {
                        reservations.remove(at: reservations.firstIndex(of: reservation)!)
                    })
                    Button("Abbrechen", role: .cancel, action: {})
                }, message: {
                }).padding()
            }
            
            
        
                }
        Button("back") {self.presentationMode.wrappedValue.dismiss()}
    }
}

