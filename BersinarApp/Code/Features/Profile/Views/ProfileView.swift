//
//  ProfileView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/10/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @StateObject private var faqViewModel = FAQViewModel()
    
    @Binding var showSignInView: Bool
    @State private var isEditingProfile = false
    @State var isAlertErrorDeleteAccPresented = false

    var body: some View {
        let user = authViewModel.currentUser
        NavigationStack {
            List {
                Section {
                    HStack {
//                        Text(profileViewModel.user. ?? "US")
//                            .font(.title)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .frame(width: 72, height: 72)
//                            .background(Color(.secondary60))
//                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            Text(user?.fullname ?? "Unknown User")
                                .padding(.top, 4)
                                .font(.system(size: 17, weight: .semibold))
                                .font(.subheadline)
                                .foregroundColor(.secondary70)

                            Text(user?.email ?? "unknown@gmail.com")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }

                        Spacer()
                        Button(action: {
                            isEditingProfile = true
                        }) {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                                .foregroundColor(.secondary60)
                        }
                        .sheet(isPresented: $isEditingProfile) {
                            EditProfileView()
                        }
                    }
                }

                Section(header: Text("General")) {
                    NavigationLink(destination: FAQView(viewModel: faqViewModel)) {
                        SettingsRowView(imageName: "questionmark.bubble.fill", title: "FAQ", tintColor: Color(.secondary60))
                    }

                    NavigationLink(destination: DonationView()) {
                        SettingsRowView(imageName: "arrow.counterclockwise", title: "Donation History", tintColor: Color(.secondary60))
                    }
                    .navigationBarBackButtonHidden(true)

                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.secondary60))
                        Spacer()
                        Text("1.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }

                Section(header: Text("Account")) {
                    Button {
                        print("Signing out")
                        Task {
                            do {
                                try authViewModel.signOut()
                                showSignInView = true
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        SettingsRowView(imageName: "arrow.right.circle.fill", title: "Log Out", tintColor: Color.red70)
                    }

                    Button {
                        Task {
                            do {
                                try await authViewModel.deleteAccount()
                                isAlertErrorDeleteAccPresented = false
                            } catch {
                                isAlertErrorDeleteAccPresented = true
                                print(error)
                            }
                        }
                    } label: {
                        SettingsRowView(imageName: "xmark.circle", title: "Delete Account", tintColor: Color.red80)
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $isAlertErrorDeleteAccPresented, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Couldn't delete your account, please try again later"),
                    dismissButton: .default(Text("Yes"))
                )
            })
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showSignInView: .constant(false))
            .environmentObject(AuthenticationViewModel())
    }
}

