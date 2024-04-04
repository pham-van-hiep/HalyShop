//
//  ListKhachViewController.swift
//  HaLyShop
//
//  Created by Pham on 2024/04/04.
//

import UIKit

class ListKhachViewController: UIViewController {
    @IBOutlet weak var listKhachTableView: UITableView!

    var viewModel = BanHangViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

        self.viewModel.needReloadTable = { [weak self] in
            self?.listKhachTableView.reloadData()
        }
        self.viewModel.getDataKhachHang()
    }

    private func setupUI() {
        self.listKhachTableView.delegate = self
        self.listKhachTableView.dataSource = self
        let cellNib = UINib.init(nibName: "ContentsTableViewCell", bundle: nil)
        self.listKhachTableView.register(cellNib, forCellReuseIdentifier: "ContentsTableViewCell")

    }
}

extension ListKhachViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentsTableViewCell", for: indexPath) as? ContentsTableViewCell else {
            return UITableViewCell()
        }
        cell.bindData(data: viewModel.dataForRow()[indexPath.row], count: indexPath.row)
        return cell
    }
    

}
