//
//  DataMediator.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case requestFailed
    case invalidData
}

class DataMediator {
    static let shared: DataMediator = DataMediator()
    
    func fetchData<T: Decodable>(from url: URL, type: T.Type, headers: [String: String]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(type, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
