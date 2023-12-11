//
//  ImageView.swift
//  Gitly
//
//  Created by Yazan Tarifi on 11/12/2023.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @State private var image: UIImage?
    @State private var isLoading = true

    let imageURL: URL
    let placeholder: Image
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        if isLoading {
            placeholder
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
                .onAppear {
                    loadImage()
                }
        } else {
            Image(uiImage: image ?? UIImage())
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
        }
    }

    private func loadImage() {
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                self.isLoading = false
            }
        }.resume()
    }
}
