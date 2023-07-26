//
//  ViewController.swift
//  RandomImageViewer
//
//  Created by Gizem Coşkun on 25.07.2023.
//

// secret key: A8qSdF7VJWmlhC700FnLUWOxVuXWtsA_3wHs5sH5oes
// access key: tDvlFp4omTTGkdjhocTzHkmbYWJDeP7DrqUJXjBj_1I
//https://api.unsplash.com/search/photos?page=1&query=office&client_id=tDvlFp4omTTGkdjhocTzHkmbYWJDeP7DrqUJXjBj_1I


import UIKit

struct APIResponse: Codable {
    let total: Int?
    let totalPages: Int?
    let results: [Result]?
}
struct Result: Codable {
    let id: String
    let urls: URLS
}
struct URLS: Codable {
    let full: String
}

class ViewController: UIViewController, UICollectionViewDataSource {
    let urlString = "https://api.unsplash.com/search/photos?page=1&query=office&client_id=tDvlFp4omTTGkdjhocTzHkmbYWJDeP7DrqUJXjBj_1I"

    private var collectionView: UICollectionView?
    
    var results: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        view.addSubview(collectionView)
        self.collectionView = collectionView
        fetchPhotos()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    func fetchPhotos(){
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results ?? []
                    self?.collectionView?.reloadData()
                }

            }catch{
                print(error)
            }
            print("Got data!")
        }
        task.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}
