//
//  RemoteImage.swift
//  RickAndMorty-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 25/04/24.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject var imageLoader: ImageLoader

    init(url: URL?,
         urlString: String? = nil) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var url: URL?
    private var urlString: String?
    private var task: URLSessionDataTask?

    init(url: URL?,
         urlString: String? = nil) {
        self.url = url
        self.urlString = urlString
        loadImage()
    }

    private func loadImage() {
        guard let urlString = url?.absoluteString ?? urlString else {
            return
        }
        if let cachedImage = ImageCache.shared.get(forKey: urlString) {
            self.image = cachedImage
            return
        }

        guard let url = URL(string: urlString) else { return }

        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
                ImageCache.shared.set(image!, forKey: urlString)
            }
        }
        task?.resume()
    }
}
