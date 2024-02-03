//
//  ImagePicker.swift
//  BersinarApp
//
//  Created by Andira Yunita on 28/11/23.
//

import SwiftUI
import UIKit

struct ImagePicker: View {
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage?

    var body: some View {
        ImagePickerRepresentable(isPresented: $isPresented, selectedImage: $selectedImage)
    }
}

struct ImagePickerRepresentable: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerRepresentable

        init(parent: ImagePickerRepresentable) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }

            parent.isPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

extension View {
    func imagePicker(isPresented: Binding<Bool>, selectedImage: Binding<UIImage?>) -> some View {
        sheet(isPresented: isPresented) {
            ImagePicker(isPresented: isPresented, selectedImage: selectedImage)
        }
    }
}
