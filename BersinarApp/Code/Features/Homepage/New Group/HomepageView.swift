//
//  HomepageView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 12/10/23.
//

import SwiftUI

struct WelcomeCell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Welcome Sobat Bersinar, ")
                    .font(Font.custom("Public Sans", size: 12))
                    .foregroundColor(Color.neutral80)
                Text("Mau belajar apa hari ini?")
                    .font(Font.custom("Public Sans", size: 20).weight(.semibold))
            }
        }
    }
}

struct LearningSectionHeaderView: View {
    @StateObject private var viewModel = HomepageViewModel()
    
    var body: some View {
        // MARK: - Bersinar Learning Section
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                // MARK: - Title Section
                VStack(alignment: .leading, spacing: 2) {
                    Text("Bersinar Learning Section")
                        .font(Font.custom("Public Sans", size: 20).weight(.semibold))
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                    
                    Text("Asset untuk persiapan belajar mu")
                        .font(Font.custom("Public Sans", size: 12))
                        .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                }
                Spacer()
                Menu {
                    ForEach(HomepageViewModel.CategoryOption.allCases, id: \.self) { filter in
                        Button(action: {
                            Task {
                                await viewModel.subjectCategoryFiltered(category: filter)
                            }
                            viewModel.selectedCategory = filter
                            viewModel.filterItems()
                        }) {
                            HStack {
                                Text(filter.rawValue)
                                Spacer()
                                if viewModel.selectedCategory == filter {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(Color.secondary60)
                                }
                            }
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.secondary60)
                    }
                }
            }
        }
    }
}

@MainActor
struct HomepageView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 0) {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        Spacer()
                        WelcomeCell()
                        EventCardCell()
                        LearningSectionHeaderView()
                        LearningSectionCardCell()
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 0)
                    .padding(.bottom, 0)
                }
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
