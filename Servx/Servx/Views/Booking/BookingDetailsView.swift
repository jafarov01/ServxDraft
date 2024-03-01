//
//  BookingDetailsView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 09/11/2023.
//

import SwiftUI
import MapKit

enum Status: String {
    case upcoming
    case completed
    case cancelled
}

struct BookingDetailsView: View {
    var bookingNo: String
    var dateTime: String // Date
    var location: String
    
    @State private var region =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                       span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    func openAppleMapsForDirections() {
        let destinationPlacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude))
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        destinationMapItem.name = "Destination"
        destinationMapItem.openInMaps()
    }
    
    var body: some View {
        VStack {
            HStack {
                
                ServxTextView(text: "Booking No:", fontStyle: "Poppins", fontSize: 12, fontColor: Color("greyscale700Color"), isBold: false, isItalic: false, textAlignment: .center)
                    .padding(.leading, 24)
                
                Spacer()
                
                ServxTextView(text: bookingNo, fontStyle: "Poppins", fontSize: 12, fontColor: .black, isBold: true, isItalic: false, textAlignment: .center)
                    .padding(.trailing, 24)
            }
            .padding(.bottom, 8)
            HStack {
                
                ServxTextView(text: "Date and Time:", fontStyle: "Poppins", fontSize: 12, fontColor: Color("greyscale700Color"), isBold: false, isItalic: false, textAlignment: .center)
                    .padding(.leading, 24)
                
                Spacer()
                
                ServxTextView(text: dateTime, fontStyle: "Poppins", fontSize: 12, fontColor: .black, isBold: true, isItalic: false, textAlignment: .center)
                    .padding(.trailing, 24)
            }
            .padding(.bottom, 8)
            HStack {
                
                ServxTextView(text: "Location", fontStyle: "Poppins", fontSize: 12, fontColor: Color("greyscale700Color"), isBold: false, isItalic: false, textAlignment: .center)
                    .padding(.leading, 24)
                
                Spacer()
                
                ServxTextView(text: location, fontStyle: "Poppins", fontSize: 12, fontColor: .black, isBold: true, isItalic: false, textAlignment: .center)
                    .padding(.trailing, 24)
            }
            
            // Add map view here
            Map(coordinateRegion: $region)
                .frame(width: 342, height: 217)
                .cornerRadius(10)
                .padding(.vertical, 10)
            
            // Button to get directions in Apple Maps
            ServxButtonView(height: 40, width: 300, handler: openAppleMapsForDirections, label: "Get Directions", textColor: .white, backgroundColor: Color("primary500Color"))
                .padding(.top, 10)
        }
    }
}

#Preview {
    BookingView()
        .environmentObject(TabSelection())
}
