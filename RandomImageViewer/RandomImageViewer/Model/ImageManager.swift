//
//  imageModel.swift
//  RandomImageViewer
//
//  Created by Gizem Coşkun on 25.07.2023.
//

import Foundation

//"https://api.unsplash.com/photos/?client_id=r5kD4bwZmhlIP5vlHrS_82yvod9g9x7Om98Hw9q3-uc"

struct ImageManager {
    var baseURL = "https://api.unsplash.com/photos"
    let apiKey = "r5kD4bwZmhlIP5vlHrS_82yvod9g9x7Om98Hw9q3-uc"
    
    func getRandomImage(completion: @escaping (Result<ImageData, Error>) -> Void) {
        let urlString = "\(baseURL)/?client_id=\(apiKey)"

        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let safeData = data {
                    if let randomImages = parseJSON(safeData) {
                        if let randomImage = randomImages.first {
                            completion(.success(randomImage))
                        } else {
                            print(error)
                        }
                    } else {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }

    

    
    func parseJSON(_ data: Data) -> [ImageData]? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([ImageData].self, from: data)
            return decodedData
        } catch {
            print("JSON çözme hatası: \(error)")
            return nil
        }
    }




}

