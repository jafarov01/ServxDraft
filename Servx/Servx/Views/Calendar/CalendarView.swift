//
//  CalendarView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 28/10/2023.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    
    // Your list of bookings
    @State private var bookings: [Booking] = []
    
    var body: some View {
        VStack {
            Text("Selected Date: \(dateFormatter.string(from: selectedDate))")
                .font(.title)
            
            // Custom date picker
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                .frame(width: 342, height: 302)
                .background(Color("primary100Color"))
                .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
                .accentColor(Color("primary400Color"))
            
            HStack {
                ServxTextView(text: "Service Booking (0)", fontStyle: "poppins", fontSize: 18, fontColor: .black, isBold: true, isItalic: false, textAlignment: .center)
                    .padding(.leading, 24)
                
                Spacer()
                
                ServxButtonView(height: 24, width: 90, handler: {}, label: "See All", textColor: Color("primary400Color"), backgroundColor: .white)
                    .padding(.trailing, 24)
            }
            .padding(.top, 30)
            
            // List of bookings for the selected date
            ScrollView {
                ForEach(bookings.filter { isSameDay($0.Date.dateValue(), selectedDate) }, id: \.ID) { booking in
                    VStack {
                        Text("Service Provider: \(booking.ServiceProvider.fullname)")
                        Text("Location: \(booking.Location)")
                    }
                }
                if bookings.filter({ isSameDay($0.Date.dateValue(), selectedDate) }).isEmpty {
                    Text("You have no services booked on this date")
                }
            }
        }
    }
    
    // Function to check if two dates are on the same day
    func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
#Preview {
    CalendarView()
}
