//
//  SingleBookingPostView.swift
//  Servx
//
//  Created by Makhlug Jafarov on 09/11/2023.
//

import SwiftUI

struct SingleBookingPostView: View {
    
    @EnvironmentObject var tabSelection: TabSelection
    @State private var showDetails = false
    var booking: Booking
    
    var body: some View {
        VStack {
            HStack {
                Image("serviceImage2") // Consider loading the image from the service provider's details
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack(alignment: .leading, content: {
                    ServxTextView(text: "Service", fontStyle: "Poppins", fontSize: 12, fontColor: Color("greyscale700Color"), isBold: true, isItalic: false, textAlignment: .center)
                    
                    ServxTextView(text: "ServiceName here", fontStyle: "Poppins", fontSize: 14, fontColor: Color("greyscale900Color"), isBold: true, isItalic: false, textAlignment: .center)
                        .padding(.bottom, 8)
                    
                    ServxTextView(text: "Selected", fontStyle: "Poppins", fontSize: 12, fontColor: Color("greyscale700Color"), isBold: true, isItalic: false, textAlignment: .center)
                    
                    // Assuming there is a category or similar attribute to display
                    ServxTextView(text: "booking.serviceProvider.category", fontStyle: "Poppins", fontSize: 14, fontColor: Color("greyscale900Color"), isBold: true, isItalic: false, textAlignment: .leading)
                })
            }
            
            if !showDetails {
                HStack {
                    ServxButtonView(height: 36, width: 127, handler: {
                        showDetails.toggle()
                    }, label: "View Details", textColor: Color("primary500Color"), backgroundColor: .white)
                    .padding(24)
                    
                    switch booking.Status {
                    case .ongoing:
                        ServxButtonView(height: 36, width: 127, handler: {}, label: "Message", textColor: .white, backgroundColor: Color("primary500Color"))
                    case .completed:
                        ServxButtonView(height: 36, width: 127, handler: {}, label: "Book Again", textColor: .white, backgroundColor: Color("primary500Color"))
                    case .cancelled:
                        ServxButtonView(height: 36, width: 127, handler: {}, label: "Book Again", textColor: .white, backgroundColor: Color("primary500Color"))
                    case .postponed:
                        ServxButtonView(height: 36, width: 127, handler: {}, label: "Reschedule", textColor: .white, backgroundColor: Color("primary500Color"))
                    }
                }
            }
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 12)
        
        if showDetails {
            BookingDetailsView(
                bookingNo: booking.ID,
                dateTime: booking.Date.dateValue().formatted(), // Formatting date as string
                location: booking.Location
            )
            
            HStack {
                switch booking.Status {
                case .ongoing:
                    ServxButtonView(height: 36, width: 127, handler: {}, label: "Cancel Booking", textColor: Color("primary500Color"), backgroundColor: .white)
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    ServxButtonView(height: 36, width: 127, handler: {}, label: "Message", textColor: .white, backgroundColor: Color("primary500Color"))
                        .padding(.trailing, 24)
                    
                case .completed:
                    ServxButtonView(height: 36, width: 127, handler: {}, label: "View e-Receipt", textColor: Color("primary500Color"), backgroundColor: .white)
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    ServxButtonView(height: 36, width: 127, handler: {}, label: "Book Again", textColor: .white, backgroundColor: Color("primary500Color"))
                        .padding(.trailing, 24)
                    
                case .cancelled:
                    ServxButtonView(height: 36, width: 127, handler: {}, label: "Message", textColor: Color("primary500Color"), backgroundColor: .white)
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    ServxButtonView(height: 36, width: 127, handler: {}, label: "Book Again", textColor: .white, backgroundColor: Color("primary500Color"))
                        .padding(.trailing, 24)
                    
                default:
                    Text("ERROR")
                }
                
            }
            .onChange(of: tabSelection.selectedTab) { newTab in
                showDetails = false
            }
        }
    }
}
