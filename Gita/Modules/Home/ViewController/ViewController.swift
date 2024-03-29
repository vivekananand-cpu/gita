//
//  ViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        viewModelSetup()
        self.viewModel.performApiCallGetAllChapters()
    }
    
    func setupView() {
        self.title = "Chapters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
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
    
    func pushToChaptersDetails(row: Int) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let chapterDetailsVC = storyBoard.instantiateViewController(identifier: String(describing: ChapterDetailsViewController.self)) as! ChapterDetailsViewController
        if let chapter = self.viewModel.getChapterForRow(row: row) {
            chapterDetailsVC.viewModel = ChapterDetailsViewModel(chapter: chapter)
        }
        
        self.navigationController?.pushViewController(chapterDetailsVC, animated: true)
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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushToChaptersDetails(row: indexPath.row)
    }
    
}

extension HomeViewController {
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
