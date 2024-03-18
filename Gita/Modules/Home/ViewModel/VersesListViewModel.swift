//
//  VersesListViewModel.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import Foundation

protocol VersesListViewModelProtocol {
    var chapterID: Int? {get}
    var arrayVerses: [VersePO]? {get set}
    var startLoading: (() -> Void)? {get set}
    var stopLoading: (() -> Void)? {get set}
    var closureReloadTable: (() -> Void)? {get set}
    
    func performAPICallGetVersesOfChapter()
}

class VersesListViewModel: VersesListViewModelProtocol {
    var closureReloadTable: (() -> Void)?
        var startLoading: (() -> Void)?
    var stopLoading: (() -> Void)?
    
    
    var chapterID: Int?
    var arrayVerses: [VersePO]?
    
    init(chapterID: Int) {
        self.chapterID = chapterID
    }
    
    func performAPICallGetVersesOfChapter() {
        startLoading?()
        let url = URL(string: "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/\(chapterID ?? 0)/verses/")!
        let headers: [String:String] = [
            "X-RapidAPI-Key": "6b17d3fa4bmshd110cbb51f0e639p1f8c95jsn08f2f187b65f",
            "X-RapidAPI-Host": "bhagavad-gita3.p.rapidapi.com"
        ]
        DataMediator.shared.fetchData(from: url, type: [Verse].self, headers: headers) { result in
            self.stopLoading?()
            switch result {
            case .success(let data):
                self.arrayVerses = data.compactMap { verse in
                    VersePO(model: verse)
                }
                self.closureReloadTable?()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        if let translations = self.arrayVerses?[safe: section]?.translations {
            return translations.count + 1
        }
        return 0
    }
    
    func getNumberOfSections() -> Int {
        self.arrayVerses?.count ?? 0
    }
    
    func getVerseFor(section: Int) -> VersePO? {
        self.arrayVerses?[safe: section]
    }
    
    func getTranslationFor(section: Int, row: Int) -> Translations? {
        self.arrayVerses?[safe: section]?.translations?[safe: row]
    }
    
    func getVerseNumberForSection(section: Int) -> Int? {
        self.arrayVerses?[safe: section]?.verseNumber
    }
}
