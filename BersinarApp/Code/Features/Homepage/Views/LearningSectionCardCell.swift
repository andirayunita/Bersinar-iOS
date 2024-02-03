//
//  LearningSectionCardView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 22/10/23.
//

import SwiftUI

struct LearningSectionCardCell: View {
    @StateObject private var learningViewModel = LearningViewModel()
    
    var body: some View {
        ForEach(learningViewModel.bersinarLearnings, id: \.id) { learning in
            NavigationLink(destination: DetailLearningView(learning: learning)) {
                LearningSectionCardContent(learning: learning)
            }
        }
    }
}

struct LearningSectionCardContent: View {
    var learning: BersinarLearning
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .center, spacing: 6) {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(learning.title)
                            .font(Font.custom("Public Sans", size: 18).weight(.semibold))
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        Text(learning.description)
                            .font(Font.custom("Public Sans", size: 12))
                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    
                    // MARK: - Tags
                    HStack(alignment: .top, spacing: 12) {
                        HStack(alignment: .center, spacing: 4) {
                            Image("ic_play_yellow")
                                .frame(width: 12, height: 12)
                            Text(learning.tags)
                                .font(Font.custom("Public Sans", size: 12).weight(.semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.primary90)
                        }
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color(red: 1, green: 0.97, blue: 0.89))
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .inset(by: -0.5)
                                .stroke(Color(red: 1, green: 0.83, blue: 0.45), lineWidth: 1)
                        )
                    }
                    .padding(0)
                    
                    // MARK: - LINE
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 330, height: 1)
                        .background(Color(red: 0.88, green: 0.88, blue: 0.88))
                    // H12/Regular
                    Text("Additional description ")
                        .font(Font.custom("Public Sans", size: 12))
                        .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    // MARK: - SUB POIN
                    HStack(alignment: .top, spacing: 0) {
                        HStack(alignment: .top, spacing: 0) {
                            HStack(alignment: .center, spacing: 10) {
                                Image("ic_check_green")
                                    .frame(width: 14, height: 14)
                            }
                            .padding(2)
                            .frame(width: 16, height: 16, alignment: .center)
                        }
                        .padding(6)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(learning.subPoin)
                                .font(Font.custom("Public Sans", size: 14).weight(.semibold))
                                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            Text(learning.subPoinDescription)
                                .font(Font.custom("Public Sans", size: 12))
                                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(.horizontal, 6)
                        .padding(.vertical, 0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 330, height: 1)
                        .background(Color(red: 0.88, green: 0.88, blue: 0.88))
                    
                    // MARK: - Section Pelajari Sekarang
                    SectionPelajariSekarang()
                }
            }
            .padding(12)
            .frame(maxWidth: 360, alignment: .leading)
            .background(Color(red: 0.99, green: 0.99, blue: 0.99))
            .cornerRadius(6)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.04), radius: 2, x: 0, y: 2)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.02), radius: 5, x: 0, y: 1)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.03), radius: 2.5, x: 0, y: 4)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .inset(by: 0.5)
                    .stroke(Color(red: 1, green: 0.83, blue: 0.45), lineWidth: 1)
            )
        }
        .padding(0)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}
struct SectionPelajariSekarang: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Sekarang")
                    .font(Font.custom("Public Sans", size: 12))
                    .foregroundColor(Color.neutral60)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                Text("GRATIS")
                    .font(Font.custom("Public Sans", size: 14).weight(.bold))
                    .foregroundColor(Color.green60)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            // Button Pelajari Sekarang
            HStack(alignment: .center, spacing: 8) {
                HStack(alignment: .center, spacing: 10) {
                    Image("ic_check_black")
                        .frame(width: 14, height: 14)
                }
                .padding(2)
                .frame(width: 16, height: 16, alignment: .center)
                
                // H11/Semibold
                Text("Pelajari sekarang")
                    .font(Font.custom("Public Sans", size: 14).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.2, green: 0.17, blue: 0.09))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color(red: 1, green: 0.86, blue: 0.54))
            .cornerRadius(6)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.04), radius: 2.5, x: 0, y: 1)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.02), radius: 0.5, x: 0, y: 3)
            .shadow(color: Color(red: 0.01, green: 0.01, blue: 0.01).opacity(0.03), radius: 1, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .inset(by: 0.5)
                    .stroke(Color(red: 0.83, green: 0.69, blue: 0.37), lineWidth: 1)
            )
        }
    }
}

struct LearningSectionCardCell_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LearningSectionCardCell()
        }
    }
}
