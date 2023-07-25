//
//  ViewController.swift
//  RandomImageViewer
//
//  Created by Gizem Coşkun on 25.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    var imageManager = ImageManager()
    private var cachedImages: [ImageData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()

    }
    
    func cacheRandomImages(images: [ImageData]) {
            cachedImages = images
        }

    func getRandomCachedImage() -> ImageData? {
        return cachedImages.randomElement()
    }

    
    func loadImage() {
        if cachedImages.isEmpty {
            imageManager.getRandomImage { [weak self] result in
                DispatchQueue.main.async { 
                    switch result {
                    case .success(let randomImage):
                        self?.cacheRandomImages(images: [randomImage])
                        self?.setImageWithRandomImage(imageURL: randomImage.urls.regular)
                    case .failure(let error):
                        print("Hata oluştu: \(error)")
                        // Burada hata durumunda kullanıcıya geri bildirimde bulunabilirsiniz.
                    }
                }
            }
        } else {
            setImageWithRandomImage()
        }
    }

    private func setImageWithRandomImage(imageURL: String? = nil) {
        let url = imageURL ?? getRandomCachedImage()?.urls.regular
        if let imageURL = URL(string: url ?? "") {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, response, error) in
                if let error = error {
                    print("Hata oluştu: \(error)")
                    // Burada hata durumunda kullanıcıya geri bildirimde bulunabilirsiniz.
                    return
                }
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
            }.resume()
        }
    }

    
   
    @IBAction func nextButton(_ sender: UIButton) {
        loadImage()
    }
    
}
