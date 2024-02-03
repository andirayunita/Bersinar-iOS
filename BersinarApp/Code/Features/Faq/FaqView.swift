//
//  FaqView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 01/11/23.
//

import SwiftUI

struct CustomDisclosureView: View {
    @State private var isExpanded = false
    let faq: FAQ
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Button(action: {
                    isExpanded.toggle()
                }) {
                    HStack {
                        Text(faq.question)
                        Spacer()
                        Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                            .foregroundColor(Color.primary80)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            if isExpanded {
                Text(faq.answer)
            }
        }
    }
}

struct FAQView: View {
    @ObservedObject var viewModel: FAQViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List(viewModel.faqData) { faq in
            CustomDisclosureView(faq: faq)
        }
        .navigationBarTitle("FAQ")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(Color.primary80)
        })
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView(viewModel: FAQViewModel())
    }
}
