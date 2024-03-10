//
//  HomeViewModel.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var arrayChaptersPO: [Chapter]? {get set}
    
    func performApiCallGetAllChapters()
    var closureReloadTable: (() -> Void)? {get set}
    
}

class HomeViewModel: HomeViewModelProtocol {
    var closureReloadTable: (() -> Void)?
    
    var arrayChaptersPO: [Chapter]?

    func performApiCallGetAllChapters() {
        let url = URL(string: "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/?limit=18")!
        let headers: [String:String] = [
            "X-RapidAPI-Key": "6b17d3fa4bmshd110cbb51f0e639p1f8c95jsn08f2f187b65f",
            "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com"
        ]

        DataMediator.shared.fetchData(from: url, type: [Chapter].self, headers: headers) { result in
            switch result {
            case .success(let data):
                self.arrayChaptersPO = data
                self.closureReloadTable?()
            case .failure(let error):
                print(error)
            }
        }
    }
    

    func getNumberOfRowsInSection() -> Int {
        self.arrayChaptersPO?.count ?? 0
    }
    
    func getChapterForRow(row: Int) -> Chapter? {
        self.arrayChaptersPO?[safe: row]
    }
}
