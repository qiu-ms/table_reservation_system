//
//  TableView.swift
//  table_reservation_system
//
//  Created by Qiu, Men Seng on 03.12.23.
//

import SwiftUI

struct TableView: View {
    @State var selectedDate: Date = Date()
    @State var bookings: [Reservation] = []
    @State private var showingAlert = false
    @State private var name = ""
    @State private var count = ""
    @State private var tableNumber = ""
    
    var body: some View {
        HStack {
            NavigationSplitView() {
                
                NavigationLink(destination: Overview(reservations: $bookings)) {
                    Text("Alle Reservierungen anzeigen")
                }.navigationBarHidden(true).navigationSplitViewColumnWidth(200)
                
                
            } detail: {
                Section {
                    
                    Form {
                        VStack {
                            Grid(alignment: .topLeading) {
                                GridRow {
                                    HStack {
                                        VStack {
                                            Table(number: 20, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 21, reservations: $bookings,  viewDate: selectedDate)
                                        }
                                        
                                        VStack {
                                            Table(number: 19, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 18, reservations: $bookings,  viewDate: selectedDate)
                                        }
                                        
                                        VStack {
                                            Table(number: 16, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 17, reservations: $bookings,  viewDate: selectedDate)
                                        }
                                        
                                        VStack {
                                            Table(number: 15, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 14, reservations: $bookings,  viewDate: selectedDate)
                                        }
                                    }
                                }
                                
                                GridRow {
                                    VStack {
                                        HStack {
                                            Table(number: 22, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 23, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 28, reservations: $bookings,  viewDate: selectedDate)
                                        }
                                        
                                        HStack {
                                            Table(number: 24, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 25, reservations: $bookings,  viewDate: selectedDate)
                                            Table(number: 27, reservations: $bookings,  viewDate: selectedDate)
                                        }
                                    }
                                }
                                
                            }.padding()
                        }
                    }
                } footer: {
                    DatePicker("", selection: $selectedDate)
                    
                    Button("Reservierung speichern") {
                        showingAlert.toggle()
                        
                    }.foregroundColor(.black).alert("Reservierung", isPresented: $showingAlert, actions: {
                        TextField("Name", text: $name)
                        TextField("Anzahl", text: $count)
                        TextField("Tischnummer", text: $tableNumber)
                        
                        Button("OK", action: {
                            bookings.append(Reservation(name: name, count: Int(count)!, date: selectedDate, tableNumber: Int(tableNumber)!))
                        })
                        Button("Abbrechen", role: .cancel, action: {})
                    }, message: {
                        Text("Geben Sie den Namen und Anzahl ein")
                    }).padding()
                }
            }
        }
    }
}

#Preview {
    TableView()
}
