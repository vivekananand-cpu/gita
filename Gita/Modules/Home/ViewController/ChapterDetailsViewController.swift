//
//  ChapterDetailsViewController.swift
//  Gita
//
//  Created by Vivek Thorat on 10/03/24.
//

import UIKit

class ChapterDetailsViewController: UIViewController {
    
    var viewModel: ChapterDetailsViewModel!

    @IBOutlet weak var buttonReadVerses: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
    }
    
    func setupView() {
        self.title = "Chapter \(self.viewModel.getChapterId())"
        buttonReadVerses.layer.cornerRadius = 30
        buttonReadVerses.setTitle("Read \(self.viewModel.chapter?.versesCount ?? 0) verses.", for: .normal)
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate   = self
        self.tableView.register(UINib(nibName: "ChapterDetailHeadingTableViewCell", bundle: nil), forCellReuseIdentifier: "ChapterDetailHeadingTableViewCell")
    }

    @IBAction func buttonHandlerReadVerses(_ sender: UIButton) {
    }
}

extension ChapterDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChapterDetailHeadingTableViewCell") as! ChapterDetailHeadingTableViewCell
        cell.detailPO = self.viewModel.getDataForRow(row: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    
}
