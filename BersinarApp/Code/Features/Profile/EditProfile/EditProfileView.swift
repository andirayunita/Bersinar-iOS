//
//  EditProfileView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 24/10/23.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject private var viewModel = EditProfileViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack {
                    // Profile Image
                    CircularProfileImageView()
                        .padding(.bottom)
                    // Name
                    VStack(alignment: .leading) {
                        Text("Full Name")
                            .font(Font.custom("Public Sans", size: 15)
                                .weight(.bold))
                            .foregroundColor(.neutral100)
                        
                        TextField("Enter your new full name..", text: $viewModel.fullName)
                    }
                    Divider()
                    // Email Field
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(Font.custom("Public Sans", size: 15)
                                .weight(.bold))
                        
                        TextField("Enter your new email..", text: $viewModel.email)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                    }
                    Divider()
                    // Phone Number Field
                    VStack(alignment: .leading) {
                        Text("Phone Number")
                            .font(Font.custom("Public Sans", size: 15)
                                .weight(.bold))
                            .foregroundColor(.neutral100)
                        
                        TextField("Add phone number..", text: $viewModel.phoneNumber)
                    }
                    Divider()
                    // Age Field
                    VStack(alignment: .leading) {
                        Text("Age")
                            .font(Font.custom("Public Sans", size: 15)
                                .weight(.bold))
                            .foregroundColor(.neutral100)
                        
                        TextField("Enter your age..", text: $viewModel.age)
                            .keyboardType(.numberPad)
                    }
                    Divider()
                    // Grade Field
                    HStack {
                        Text("Grade")
                            .font(Font.custom("Public Sans", size: 15)
                                .weight(.bold))
                            .foregroundColor(.neutral100)
                        Spacer()
                        Picker("Your Grade", selection: $viewModel.selectedGrade) {
                            Text("10th Grade").tag(Grade.freshman)
                            Text("11th Grade").tag(Grade.sophomore)
                            Text("12th Grade").tag(Grade.senior)
                            Text("Other").tag(Grade.others)
                        }
                        .pickerStyle(.menu)
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary80, lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.red70)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue70)
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
