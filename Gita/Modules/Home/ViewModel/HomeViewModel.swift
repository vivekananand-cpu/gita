//
//  HomeViewModel.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var arrayChaptersPO: [Chapter]? {get set}
    func loadChaptes(fileName: String)
}

class HomeViewModel: HomeViewModelProtocol {
    var arrayChaptersPO: [Chapter]?
    
    func loadChaptes(fileName: String) {
        self.arrayChaptersPO = loadJson(fileName: fileName, type: [Chapter].self)
    }
    
}
