//
//  DetailLearningView.swift
//  BersinarApp
//
//  Created by Andira Yunita on 06/01/24.
//

import SwiftUI
import UIKit

struct DetailLearningView: View {
    var learning: BersinarLearning
    
    var body: some View {
        if learning.link != nil && learning.link != "" {
            DetailLearningWithGD(link: learning.link!, title: learning.title)
        }
        
        if learning.videoId != nil && learning.videoId != "" {
            DetailLearningWithVideo(videoId: learning.videoId!, title: learning.title, description: learning.description)
        }
    }
}

struct DetailLearningWithGD: View {
    @Environment(\.presentationMode) var presentationMode
    var link: String
    var title: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            GDView(url: "\(link)preview")
        }
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.primary80)
            },
            trailing: Button(action: {
                // MARK: - for pdf file or document file
//                if let linkUrl = URL(string: "https://drive.google.com/file/d/1dVsi6SRB2CtF5_BJBtV42LTp360L3vGM/view") {
//                    let documentController = UIDocumentInteractionController(url: linkUrl)
//                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//                        if let window = windowScene.windows.first {
//                            documentController.presentOptionsMenu(from: .zero, in: window.rootViewController?.view ?? UIView(), animated: true)
//                        }
//                    }
//                }
                // MARK: - for link file
                guard let linkUrl = URL(string: link) else { return }
                let av = UIActivityViewController(activityItems: [linkUrl], applicationActivities: nil)
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let window = windowScene.windows.first {
                        window.rootViewController?.present(av, animated: true)
                    }
                }
            }) {
                Image(systemName: "square.and.arrow.up")
            }
        )
    }
}

struct DetailLearningWithVideo: View {
    @Environment(\.presentationMode) var presentationMode
    var videoId: String
    var title: String
    var description: String
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                YTView(id: videoId)
                Divider()
                LazyVStack(alignment: .leading, spacing: 16) {
                    Text("Description")
                        .font(Font.custom("Public Sans", size: 18))
                        .fontWeight(.bold)
                    
                    Text(description)
                        .font(Font.custom("Public Sans", size: 14))
                    
                    Text("""
                        Jangan lupa untuk follow media sosial Bersinar ya!
                         Instagram/Twitter: @bersinarproject
                        """)
                        .font(Font.custom("Public Sans", size: 14))
                }
                .padding()
                Spacer()
            }
            .padding(.vertical, 8)
        }
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.primary80)
            })
    }
}

struct DetailLearningWithText: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                LazyVStack(alignment: .leading, spacing: 16) {
                    Text("Tentang Materi")
                        .font(Font.custom("Public Sans", size: 20))
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Subject   : Penalaran Umum")
                            .font(Font.custom("Public Sans", size: 12))
                        Text("Pemateri : Kak Sofia Ghina Syahira")
                            .font(Font.custom("Public Sans", size: 12))
                        Text("Tanggal   : 2 Mei 2023")
                            .font(Font.custom("Public Sans", size: 12))
                    }
                    Divider()
                    // MARK: - COLUMN 1
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image("logobersinar")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            Text("Logika Proposisi")
                                .font(Font.custom("Public Sans", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.secondary80)
                        }
                        
                        Text("""
                            Logika proposisi adalah proses berpikir untuk identifikasi valid tidaknya suatu pernyataan (memiliki satu nilai kebenaran, yakni salah atau benar) yang berada pada argumen.
                            """)
                        .font(Font.custom("Public Sans", size: 12))
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    .background(Color.primary10)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.primary60, lineWidth: 1))
                    
                    // MARK: - COLUMN 2
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image("logobersinar")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            Text("Aturan Logika Proposisi")
                                .font(Font.custom("Public Sans", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.green60)
                        }
                        
                        Text("""
                            a. Nilai kebenarannya hanya satu, yakni benar atau salah saja. Contoh :
                            - Bumi berbentuk bulat (Benar)
                            - Lele memiliki sayap (Salah)
                            
                            b. Tidak menimbulkan perdebatan secara teknis. Contoh :
                            - Hari Sabtu adalah hari sial
                            
                            c. Bukan kalimat perintah dan kalimat tanya Contoh :
                            - Gala, tutup pintu itu!
                            - Apakah kamu memiliki pena warna ungu
                            
                            d. Tidak boleh digantikan dengan proposisi lain yang berarti sama Contoh :
                            - Aku tidak lapar  Aku kenyang
                            """)
                        .font(Font.custom("Public Sans", size: 12))
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.green60, lineWidth: 1))
                    
                    // MARK: - COLUMN 3
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image("logobersinar")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            Text("Logika Matematika dalam Logika Proposisi")
                                .font(Font.custom("Public Sans", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.secondary80)
                        }
                        
                        Text("""
                            a. Negasi(~)
                            Negasi adalah KEBALIKAN dari pernyataan/proposisi aslinya. Negasi akan mengingkari pernyataan aslinya**.** Jadi, misalnya kalau proposisi benar akan menjadi salah b sebaliknya.
                            Contoh : p: Iqbal tidak bisa terbang  ~p: Iqbal bisa terbang
                            
                            b. Proposisi Universal
                            Pernyataan universal ini bersifat MENYELURUH ya Sob. Supaya lebih mudah diingat, proposisi universal memiliki kata kunci loh Sob! Kata Kunci Proposisi Universal:
                            SEMUA = TIDAK ADA = SELURUH = SETIAP
                            
                            c. Proposisi Partikular
                            Beda lagi kalau sudah partikular. Awalnya kalau universal menyeluruh, sedangkan pernyataan partikular bersifat spesifik menyebutkan BAGIAN dari kelompok UNIVERSAL tertentu.
                            Kata Kunci Proposisi Partikular :
                            ADA = BEBERAPA = SEBAGIAN = TIDAK SEMUA = SEMENTARA
                            
                            d. Proposisi Majemuk
                            Gabungan dua pernyataan atau proposisi dalam satu kalimat.
                            - Konjungsi (DAN) (^)
                            Gabungan dua pernyataan setara dan pasti terjadi bersamaan
                            Kata Kunci Konjungsi: DAN  TETAPI  SEDANGKAN  DENGAN  MESKIPUN
                            
                            - Disjungsi (ATAU) (v)
                            Gabungan dua pernyataan setara dan terjadi bisa sendiri atau bersama (opsional)
                            Kata Kunci Disjungsi: ATAU
                            
                            - Implikasi (Jika...Maka...) ( →)
                            Gabungan dua pernyataan sebab dan akibat satu arah.
                            Kata Kunci Implikasi: JIKA/APABILA...MAKA
                            
                            - Biimplikasi (Jika dan Hanya Jika ) ( )
                            Gabungan dua pernyataan sebab dan akibat dua arah sehingga bisa dibalik.
                            Kata Kunci Implikasi: JIKA DAN HANYA JIKA
                            
                            e. Proposisi Ekuivalen (=)
                            Kedua pernyataan majemuk mempunyai nilai kebenaran yang sama
                            p → q ≡ q → p
                            p → q ≡ p ∨ q
                            p ⇆ q ≡ (p → q) ∧ (q → p)
                            """)
                        .font(Font.custom("Public Sans", size: 12))
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    .background(Color.primary10)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.primary60, lineWidth: 1))
                    // MARK: - COLUMN 4
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image("logobersinar")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            Text("FYI")
                                .font(Font.custom("Public Sans", size: 16))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.green60)
                        }
                        
                        Text("""
                            a. Argumen; terdiri dari alasan (premis) dan kesimpulan (klaim). Contoh : Jika Lala rajin berlajar maka Lala akan lulus ujian Premis; pernyataan yang digunakan sebagai dasar penarikan kesimpulan
                            
                            b. Kebenaran suatu pernyatan dibedakan menjadi dua, yaitu:
                            1. Kebenaran faktual, yaitu kesesuaian antara isi peryataan dan fakta sesungguhnya.
                            2. Kebenaran logis, yaitu kesesuaian dengan aturan-aturan logika (sesuai dengan soal yang diberikan sehingga dianggap benar pernyataannya).
                            """)
                        .font(Font.custom("Public Sans", size: 12))
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.green60, lineWidth: 1))
                }
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.primary80)
            },
            trailing: Button(action: {
                if let linkUrl = URL(string: "https://drive.google.com/file/d/1t6YQWQg6QTtlpEFBB7N815az0OaODH7o/") {
                    let documentController = UIDocumentInteractionController(url: linkUrl)
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        if let window = windowScene.windows.first {
                            documentController.presentOptionsMenu(from: .zero, in: window.rootViewController?.view ?? UIView(), animated: true)
                        }
                    }
                }
            }) {
                Image(systemName: "square.and.arrow.up")
            }
        )
    }
}

//#Preview {
//    DetailLearningView(title: "PPU", description: "Pengetahuan dan Pemahaman Umum", link: "", videoId: "")
//    DetailLearningView(learning: nil)
//}
