//
//  commonFunctions.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import Foundation

func loadJson<T: Codable>(fileName: String, type: T.Type) -> T? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(type, from: data)
            print(jsonData)
            return jsonData
        } catch let error {
                print(error)
        }
    }
    return nil
}
