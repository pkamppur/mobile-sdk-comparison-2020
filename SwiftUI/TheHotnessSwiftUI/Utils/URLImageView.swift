//
//  URLImageView.swift
//  TheHotnessSwiftUI
//
//  Created by Petteri Kamppuri on 28.9.2020.
//

import SwiftUI
import Combine


public struct URLImageView: View {
    private let url: URL
    private let isResizable: Bool
    
    public init(url: URL) {
        self.init(url: url, resizable: false)
    }
    
    public init(url: URL, resizable: Bool) {
        self.url = url
        self.isResizable = resizable
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            ImageViewContainer(url: url, resizable: isResizable)
        }
    }
    
    public func resizable() -> some View {
        return Self(url: url, resizable: true)
    }
}

struct ImageViewContainer: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    private let isResizable: Bool
    
    init(url: URL, resizable: Bool) {
        remoteImageURL = RemoteImageURL(url: url)
        isResizable = resizable
    }
    
    var body: some View {
        var image = Image(uiImage: remoteImageURL.image ?? UIImage())
        
        if isResizable {
            image = image.resizable()
        }
        
        return image
    }
}

class RemoteImageURL: ObservableObject {
    @Published var image: UIImage? = nil
    var task: URLSessionDataTask!
    
    init(url: URL) {
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                let image = UIImage(data: data)
            else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
    
    deinit {
        task.cancel()
    }
}
