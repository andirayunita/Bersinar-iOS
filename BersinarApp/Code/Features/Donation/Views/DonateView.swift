//
//  DonateView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 22/10/23.
//

import SwiftUI
import PhotosUI

struct DonationView: View {
    @State private var donationAmount: Double = 0.0
    @State private var isAddingDonation = false
    @State private var descDonate = ""
    @State private var donations: [Double] = []
    @State private var selectedImage: UIImage? = UIImage(systemName: "photo")
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    if donations.isEmpty {
                        Text("You have no donations yet")
                            .font(Font.custom("Public Sans", size: 16)
                                .weight(.semibold))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Your Total Donations: \(donations.reduce(0, +).formatCurrency())")
                            .font(Font.custom("Public Sans", size: 16)
                                .weight(.semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()
                
                List {
                    ForEach(donations, id: \.self) { donation in
                        NavigationLink(destination: DonateDetailView(amount: donation, description: descDonate, image: selectedImage!)) {
                            Text("Donate: \(donation.formatCurrency())")
                        }
                    }
                }
                
                Button(action: {
                    isAddingDonation = true
                }) {
                    Text("Add Donation")
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.primary50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .inset(by: 0.5)
                                        .stroke(Color.primary70)
                                )
                        )
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Donation")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isAddingDonation) {
                AddDonationView(donationAmount: $donationAmount, 
                                isAddingDonation: $isAddingDonation,
                                descDonate: $descDonate,
                                donations: $donations,
                                updateSelectedImage: { selectedImage in
                                        self.selectedImage = selectedImage ?? UIImage(systemName: "photo")!
                                        })
            }
        }
    }
}

struct AddDonationView: View {
    @Binding var donationAmount: Double
    @Binding var isAddingDonation: Bool
    @Binding var descDonate: String
    @Binding var donations: [Double]
    
    @State private var selectedImage: UIImage?
    @State private var photosPickerResult: PhotosPickerItem?
    
    var updateSelectedImage: (UIImage?) -> Void
    
    var body: some View {
        VStack {
            Text("We appreciate it. You can donate it to BCA 2190026345 a.n. Andira Yunita")
                .padding()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            
            PhotosPicker(selection: $photosPickerResult, matching: .images) {
                ZStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding()
                        .tint(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 200, height: 100)
                        )
                    
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Enter Amount:")
                    .font(
                        Font.custom("Public Sans", size: 14)
                            .weight(.semibold)
                    )
                    .foregroundColor(.neutral100)
                
                TextField("0", value: $donationAmount, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 8)
                
                Text("Add Description or Feedback:")
                    .font(
                        Font.custom("Public Sans", size: 14)
                            .weight(.semibold)
                    )
                    .foregroundColor(.neutral100)
                
                TextField("Description", text: $descDonate)
                    .disableAutocorrection(true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            Button("Add Donation") {
                donations.append(donationAmount)
                isAddingDonation = false
            }
            .foregroundColor(.black)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.primary50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .inset(by: 0.5)
                            .stroke(Color.primary70)
                    )
            )
        }
        .padding()
        .background(.clear)
        .onChange(of: photosPickerResult) {_ in
            Task {
                if let photosPickerResult = photosPickerResult, let data = try? await photosPickerResult.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        selectedImage = image
                    }
                }
                photosPickerResult = nil
            }
        }
    }
}

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}

