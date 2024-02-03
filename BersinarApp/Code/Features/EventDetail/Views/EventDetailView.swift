//
//  EventDetailView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 28/11/23.
//

import SwiftUI

struct HeaderEventCell: View {
    var body: some View {
        // MARK: - title, image, typeOfEvent
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 16) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 150)
                    .background(
                        Image("img_event_one")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped())
                    .cornerRadius(6)
                
                HStack(alignment: .center, spacing: 4) {
                    Image("ic_info")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text("Bersinar Mengajar")
                        .font(
                            Font.custom("Public Sans", size: 12)
                                .weight(.semibold))
                        .foregroundColor(Color.primary90)
                }
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .frame(maxWidth: .infinity)
                .background(Color.primary10)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: -0.5)
                        .stroke(Color.primary60, lineWidth: 1))
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

struct InfoEventCell: View {
    var body: some View {
        // MARK: - date info
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Image("ic_calendar_black")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.50)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.50)
                )
                .shadow(
                    color: Color(red: 0.01, green: 0.01, blue: 0.01, opacity: 0.04), radius: 5, y: 1
                )
                VStack(alignment: .leading, spacing: 2) {
                    Text("Kapan dilaksanainnya?")
                        .font(Font.custom("Public Sans", size: 12))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                    Text("16 Desember 2023")
                        .font(Font.custom("Public Sans", size: 16).weight(.bold))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                }
            }
            // MARK: - time info
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Image("ic_clock_red")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.50)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.50)
                )
                .shadow(
                    color: Color(red: 0.01, green: 0.01, blue: 0.01, opacity: 0.04), radius: 5, y: 1
                )
                VStack(alignment: .leading, spacing: 2) {
                    Text("Dari jam berapa sih?")
                        .font(Font.custom("Public Sans", size: 12))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                    Text("15.00 - 17.00 WIB")
                        .font(Font.custom("Public Sans", size: 16).weight(.bold))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                }
            }
            // MARK: - narsum info
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Image("ic_profile_green")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.50)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.50)
                )
                .shadow(
                    color: Color(red: 0.01, green: 0.01, blue: 0.01, opacity: 0.04), radius: 5, y: 1
                )
                VStack(alignment: .leading, spacing: 2) {
                    Text("Siapa yang ngisi?")
                        .font(Font.custom("Public Sans", size: 12))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                    Text("Rafi Pratama Hariyanto")
                        .font(Font.custom("Public Sans", size: 16).weight(.bold))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                }
                Spacer()
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.99, green: 0.99, blue: 0.99))
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .inset(by: 0.50)
                .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.50)
        )
        .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01, opacity: 0.04), radius: 4, y: 2)
    }
}

struct DescriptionEventCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Image("ic_doc_black")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.50)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.50)
                )
                .shadow(
                    color: Color(red: 0.01, green: 0.01, blue: 0.01, opacity: 0.04), radius: 5, y: 1
                )
                VStack(alignment: .leading, spacing: 0) {
                    Text("Bakal bahas apasih?")
                        .font(Font.custom("Public Sans", size: 16).weight(.bold))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                }
            }
            Text("""
                 Sharing session langsung dengan Kak Rafi, membahas cara menentukan jurusan sesuai minat bakat, dan tips menjadi mahasiswa yang aktif dan berprestasi!
                 """)
                .font(Font.custom("Public Sans", size: 14))
                .lineSpacing(4)
                .tracking(0.07)
                .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
        }
    }
}

struct TutorInfoCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
//            Rectangle()
//                .foregroundColor(.clear)
//                .frame(width: 96, height: 96)
//                .background(
//                    AsyncImage(url: URL(string: "img_event_one"), scale: 1)
//                )
//                .cornerRadius(6)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 6)
//                        .inset(by: 0.50)
//                        .stroke(Color(red: 1, green: 0.83, blue: 0.45), lineWidth: 0.50))
//            
            HStack(spacing: 12) {
                HStack(spacing: 8) {
                    Image("ic_check_cal_black")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .inset(by: 0.50)
                        .stroke(Color(red: 0.88, green: 0.88, blue: 0.88), lineWidth: 0.50)
                )
                .shadow(
                    color: Color(red: 0.01, green: 0.01, blue: 0.01, opacity: 0.04), radius: 5, y: 1
                )
                VStack(alignment: .leading, spacing: 0) {
                    Text("Kenalan yuk sama pematerinya!")
                        .font(Font.custom("Public Sans", size: 16).weight(.bold))
                        .foregroundColor(Color(red: 0.20, green: 0.20, blue: 0.20))
                }
            }
            Text("Kak Rafi merupakan mahasiswa jurusan Kedokteran di Universitas Airlangga yang aktif dan berprestasi. Kak Rafi telah meraih 1st Runner Up Debate Competition National Action Event AMSA-Indonesia 2023, menjadi Speaker of Sharing SNBT by SmartaMedika, dan masih banyak lagi!")
                .font(Font.custom("Public Sans", size: 14))
                .lineSpacing(4)
                .tracking(0.07)
                .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
            Spacer(minLength: 72)
        }
    }
}

struct EventDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        Spacer()
                        HeaderEventCell()
                        InfoEventCell()
                        DescriptionEventCell()
                        TutorInfoCell()
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 0)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
            }
            .overlay(
                VStack {
                    Spacer()
                    RegistBottomCell()
                        .frame(width: geometry.size.width)
                        .background(Color(red: 0.99, green: 0.99, blue: 0.98))
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.04), radius: 8)
                }
            )
        }
        .navigationBarTitle("Exclusive Talks: Guide to MABA Life")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(Color.primary80)
        })
    }
}

#Preview {
    EventDetailView()
}
