//
//  EventCardCell.swift
//  BersinarApp
//
//  Created by Andira Yunita on 22/10/23.
//

import SwiftUI

struct EventCardCell: View {
    @StateObject private var eventClassViewModel = EventViewModel()
    var body: some View {
        ForEach(eventClassViewModel.eventClasses, id: \.id) { event in
            NavigationLink(destination: ClassDetailView(event: event)) {
                EventClassCardCellView(eventClasses: event)
            }
        }
    }
}

struct EventCardCell_Previews: PreviewProvider {
    static var previews: some View {
        EventCardCell()
    }
}

struct EventClassCardCellView: View {
    var eventClasses: Event
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                // MARK: - Card Event
                VStack(alignment: .leading, spacing: 18) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity, minHeight: 144, maxHeight: 144)
                        .background(
                            Image("placeholder_special_class")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
//                            AsyncImage(url: URL(string: eventClasses.image))
                                .frame(width: 336, height: 144)
                                .clipped())
                        .cornerRadius(6)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        // MARK: - Section status
                        HStack(alignment: .center, spacing: 72) {
                            HStack(alignment: .center, spacing: 4) {
                                Image("ic_info")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                // H12/Semibold
                                Text(eventClasses.typeOfEvent)
                                    .font(Font.custom("Public Sans", size: 12).weight(.semibold))
                                    .foregroundColor(Color.primary90)
                            }
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.primary10)
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .inset(by: -0.5)
                                    .stroke(Color.primary60, lineWidth: 1))
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .leading)
                        
                        // MARK: - Details Event
                        DetailEventContent(eventClasses: eventClasses)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(12)
                .frame(width: 360, alignment: .topLeading)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(6)
                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.04), radius: 2, x: 0, y: 2)
                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.02), radius: 5, x: 0, y: 1)
                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.03), radius: 2.5, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 1))
            }
            .padding(2)
        }
    }
}

struct DetailEventContent: View {
    var eventClasses: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(eventClasses.eventTitle)
                .font(Font.custom("Public Sans", size: 16).weight(.semibold))
                .foregroundColor(Color.neutral100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .center, spacing: 8) {
                Image("ic_profile")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(eventClasses.tutorName)
                    .font(Font.custom("Public Sans", size: 12).weight(.semibold))
                    .foregroundColor(Color.neutral60)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack(alignment: .center, spacing: 8) {
                Image("ic_calendar")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text("\(eventClasses.date)")
                    .font(Font.custom("Public Sans", size: 12).weight(.semibold))
                    .foregroundColor(Color.neutral60)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack(alignment: .center, spacing: 8) {
                Image("ic_clock")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(eventClasses.time)
                    .font(Font.custom("Public Sans", size: 12).weight(.semibold))
                    .foregroundColor(Color.neutral60)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - Button Daftar Sekarang
            HStack(alignment: .center, spacing: 8) {
                Text("Daftar sekarang")
                    .font(
                        Font.custom("Public Sans", size: 14)
                            .weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.2, green: 0.17, blue: 0.09))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.primary50)
            .cornerRadius(6)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.04), radius: 2.5, x: 0, y: 1)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.02), radius: 0.5, x: 0, y: 3)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.03), radius: 1, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .inset(by: 0.5)
                    .stroke(Color.primary60, lineWidth: 1)
            )
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

struct EventCardCellView: View {
    var body: some View {
        NavigationLink(destination: EventDetailView()) {
            LazyHStack {
                // MARK: - Card Event
                VStack(alignment: .leading, spacing: 18) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(maxWidth: .infinity, minHeight: 144, maxHeight: 144)
                        .background(
                            Image("img_event_one")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 336, height: 144)
                                .clipped())
                        .cornerRadius(6)
                    
                    VStack(alignment: .leading, spacing: 18) {
                        // MARK: - Section status
                        HStack(alignment: .center, spacing: 72) {
                            HStack(alignment: .center, spacing: 4) {
                                Image("ic_info")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                // H12/Semibold
                                Text("Bersinar Mengajar")
                                    .font(
                                        Font.custom("Public Sans", size: 12)
                                            .weight(.semibold))
                                    .kerning(0.096)
                                    .foregroundColor(Color.primary90)
                            }
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.primary10)
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .inset(by: -0.5)
                                    .stroke(Color.primary60, lineWidth: 1))
                            
                            // H12/Bold
                            //                            Text("Subject")
                            //                                .font(
                            //                                    Font.custom("Public Sans", size: 12)
                            //                                        .weight(.bold))
                            //                                .kerning(0.096)
                            //                                .multilineTextAlignment(.trailing)
                            //                                .foregroundColor(Color.blue60)
                            //                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .leading)
                        
                        // MARK: - Details Event
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Exclusive Talks: Guide to MABA Life")
                                .font(
                                    Font.custom("Public Sans", size: 16)
                                        .weight(.semibold))
                                .kerning(0.08)
                                .foregroundColor(Color.neutral100)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(alignment: .center, spacing: 8) {
                                Image("ic_profile")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("Rafi Pratama Hariyanto")
                                    .font(
                                        Font.custom("Public Sans", size: 12)
                                            .weight(.semibold))
                                    .kerning(0.096)
                                    .foregroundColor(Color.neutral60)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(alignment: .center, spacing: 8) {
                                Image("ic_calendar")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("16 Desember 2023")
                                    .font(
                                        Font.custom("Public Sans", size: 12)
                                            .weight(.semibold))
                                    .foregroundColor(Color.neutral60)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            HStack(alignment: .center, spacing: 8) {
                                Image("ic_clock")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("15.00 - 17.00 WIB")
                                    .font(
                                        Font.custom("Public Sans", size: 12)
                                            .weight(.semibold))
                                    .foregroundColor(Color.neutral60)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            // MARK: - Button Daftar Sekarang
                            NavigationLink(destination: EventDetailView()) {
                                HStack(alignment: .center, spacing: 8) {
                                    Text("Daftar sekarang")
                                        .font(
                                            Font.custom("Public Sans", size: 14)
                                                .weight(.semibold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(red: 0.2, green: 0.17, blue: 0.09))
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.primary50)
                                .cornerRadius(6)
                                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.04), radius: 2.5, x: 0, y: 1)
                                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.02), radius: 0.5, x: 0, y: 3)
                                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.03), radius: 1, x: 0, y: 2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .inset(by: 0.5)
                                        .stroke(Color.primary60, lineWidth: 1)
                                )
                            }
                            
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(12)
                .frame(width: 360, alignment: .topLeading)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(6)
                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.04), radius: 2, x: 0, y: 2)
                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.02), radius: 5, x: 0, y: 1)
                .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.03), radius: 2.5, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 1))
            }
            .padding(2)
        }
    }
}
