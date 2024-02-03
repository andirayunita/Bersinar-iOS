//
//  RegistClassView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 04/01/24.
//

import SwiftUI

struct RegistClassView: View {
    @StateObject private var registClassViewModel = RegistClassViewModel()
    @StateObject private var gradeViewModel = EditProfileViewModel()
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 32) {
                VStack(spacing: 24) {
                    Text("Please fill in the form to confirm your regist to the class or the event")
                    InputView(text: $registClassViewModel.fullname,
                              title: "Full Name",
                              placeholder: "")
                    .autocorrectionDisabled()
                    
                    InputView(text: $registClassViewModel.email,
                              title: "Email",
                              placeholder: "")
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    
                    InputView(text: $registClassViewModel.phoneNumber,
                              title: "Phone Number",
                              placeholder: "")
                    
                    InputView(text: $registClassViewModel.usernameX,
                              title: "Username Twitter/X",
                              placeholder: "")
                    
                    InputView(text: $registClassViewModel.usernameIg,
                              title: "Username Instagram",
                              placeholder: "")
                    
                    HStack {
                        Text("Grade")
                            .font(Font.custom("Public Sans", size: 15)
                                .weight(.bold))
                            .foregroundColor(.neutral100)
                        Spacer()
                        Picker("Your Grade", selection: $gradeViewModel.selectedGrade) {
                            Text("10th Grade").tag(Grade.freshman)
                            Text("11th Grade").tag(Grade.sophomore)
                            Text("12th Grade").tag(Grade.senior)
                            Text("Other").tag(Grade.others)
                        }
                        .pickerStyle(.menu)
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Form Regist")
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
                        registClassViewModel.addRegistClass(email: registClassViewModel.email, fullname: registClassViewModel.fullname, phoneNumber: registClassViewModel.phoneNumber, usernameX: registClassViewModel.usernameX, usernameIg: registClassViewModel.usernameIg)
                        showAlert = true
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary60)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Thank you, registration successful!"),
                            message: Text("The Zoom Meeting ID for this event is 758 4335 5266"),
                            dismissButton: .default(Text("OK")) {
                                presentationMode.wrappedValue.dismiss()
                            }
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    RegistClassView()
}
