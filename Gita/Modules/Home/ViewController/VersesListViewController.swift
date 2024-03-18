//
//  VersesListViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 11/03/24.
//

import UIKit

class VersesListViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: VersesListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
        viewModelSetup()
        self.viewModel.performAPICallGetVersesOfChapter()
    }
    

    func setupView() {
        self.title = "Verses"
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.tableView.register(UINib(nibName: "VerseHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "VerseHeaderTableViewCell")
        self.tableView.register(UINib(nibName: "VerseTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "VerseTitleTableViewCell")
        self.tableView.register(UINib(nibName: "VerseTableViewCell", bundle: nil), forCellReuseIdentifier: "VerseTableViewCell")
    }
    
    func startLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }

}

extension VersesListViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        44
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerseHeaderTableViewCell") as! VerseHeaderTableViewCell
        cell.verseNumber = self.viewModel.getVerseNumberForSection(section: section)
        return cell.contentView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getNumberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VerseTitleTableViewCell", for: indexPath) as! VerseTitleTableViewCell
            cell.versePO = self.viewModel.getVerseFor(section: indexPath.section)
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "VerseTableViewCell", for: indexPath) as! VerseTableViewCell
        cell.translation = self.viewModel.getTranslationFor(section: indexPath.section, row: indexPath.row - 1)
        cell.selectionStyle = .none
        return cell
    }
    
}

extension VersesListViewController {
    func viewModelSetup() {
        self.viewModel.closureReloadTable = {[weak self] in
            if let strongSelf = self {
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData()
                }
            }
        }
        
        self.viewModel.startLoading = {[weak self] in
            self?.startLoading()
        }
        
        self.viewModel.stopLoading = {[weak self] in
            self?.stopLoading()
        }
    }
}
