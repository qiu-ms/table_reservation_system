//
//  ReservationView.swift
//  table_reservation_system
//
//  Created by Qiu, Men Seng on 03.12.23.
//

import SwiftUI

struct ReservationView: View {
    let reservation: Reservation
    
    var body: some View {
        VStack(alignment: .leading) {
                    Text(reservation.name)
                        .font(.headline)
                    Spacer()
            Text(reservation.date.description)
                    HStack {
                        Label("\(reservation.count)", systemImage: "person.3")
                    }
                }
    }
}

