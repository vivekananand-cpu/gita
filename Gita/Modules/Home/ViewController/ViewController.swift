//
//  ViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.loadChaptes(fileName: "chapters")
    }
    

    @IBAction func buttonHandler(_ sender: Any) {
        self.viewModel.loadChaptes(fileName: "chapters")
    }
    
}

