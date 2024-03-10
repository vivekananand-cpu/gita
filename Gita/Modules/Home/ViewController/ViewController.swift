//
//  ViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModelSetup()
        self.viewModel.performApiCallGetAllChapters()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        cell.chapter = self.viewModel.getChapterForRow(row: indexPath.row)
        return cell
    }
    
    
}

extension HomeViewController {
    func viewModelSetup() {
        self.viewModel.closureReloadTable = {[weak self] in
            if let strongSelf = self {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
}
