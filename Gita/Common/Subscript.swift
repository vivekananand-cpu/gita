//
//  Subscript.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import Foundation


extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0 && index < self.count else {return nil}
        return self[index]
    }
}
