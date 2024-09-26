//
//  ViewController.swift
//  TestTBV
//
//  Created by Pham on 2024/09/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var matHangTF: UITextField!
    @IBOutlet weak var soLuongTF: UITextField!
    @IBOutlet weak var donGiaTF: UITextField!
    @IBOutlet weak var addCellBtn: UIButton!
    @IBOutlet weak var testTbv: UITableView!
    @IBOutlet weak var tbvHeigtConstrain: NSLayoutConstraint!
    @IBOutlet weak var dangKyBtn: UIButton!
    @IBOutlet weak var listDonBtn: UIButton!
    var listDataHang: [DataHang] = []

    var numberOfrow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    private func setupUI() {
        let cellNib = UINib(nibName: "TestTableViewCell", bundle: nil)
        let headerNib = UINib(nibName: "HeaderView", bundle: nil)

        self.testTbv.register(cellNib, forCellReuseIdentifier: "TestTableViewCell")
        self.testTbv.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        self.testTbv.delegate = self
        self.testTbv.dataSource = self
        self.testTbv.reloadData()

        self.addCellBtn.layer.borderWidth = 0.5
        self.addCellBtn.layer.borderColor = UIColor.gray.cgColor
        self.addCellBtn.layer.cornerRadius = 5

        self.dangKyBtn.layer.borderWidth = 0.5
        self.dangKyBtn.layer.borderColor = UIColor.gray.cgColor
        self.dangKyBtn.layer.cornerRadius = 5

        self.listDonBtn.layer.borderWidth = 0.5
        self.listDonBtn.layer.borderColor = UIColor.gray.cgColor
        self.listDonBtn.layer.cornerRadius = 5

        self.tbvHeigtConstrain.constant = 0
    }

    @IBAction func addBtnDidTapped(_ sender: UIButton) {
        if !checkValid() {
            return
        }
        let datahang = DataHang(matHang: self.matHangTF.text!, soLuong: self.soLuongTF.text!, donGia: self.donGiaTF.text!)
        listDataHang.append(datahang)
        self.clearText()
        self.numberOfrow += 1
        self.tbvHeigtConstrain.constant = 250
        self.testTbv.reloadData()
    }

    @IBAction func dangKyBtnDidTapped(_ sender: UIButton) {

    }
    
    @IBAction func listDonBtnBtnDidTapped(_ sender: UIButton) {
        let danhSachKHVC = DanhSachKHViewController(nibName: "DanhSachKHViewController", bundle: nil)
        danhSachKHVC.modalTransitionStyle = .coverVertical
        danhSachKHVC.modalPresentationStyle = .fullScreen

        self.present(danhSachKHVC, animated: true)
    }

    private func checkValid() -> Bool {
        if self.matHangTF.text?.count == 0 {
            self.showAlert(thongTin: "[Mặt hàng]")
            return false
        }

        if self.soLuongTF.text?.count == 0 {
            self.showAlert(thongTin: "[Số lượng]")
            return false
        }

        if self.donGiaTF.text?.count == 0 {
            self.showAlert(thongTin: "[Đơn giá]")
            return false
        }
        return true
    }

    private func showAlert(thongTin: String) {
        let alert = UIAlertController(title: "Error", message: "Vui lòng nhập thông tin \n\(thongTin)", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }

    private func clearText() {
        self.matHangTF.text = ""
        self.soLuongTF.text = ""
        self.donGiaTF.text = ""
        self.matHangTF.becomeFirstResponder()
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfrow
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listDataHang.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as? TestTableViewCell else {
            return UITableViewCell()
        }
        cell.bindData(data: self.listDataHang[indexPath.row], index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView else {
            return UIView()
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

public struct DataHang {
    var matHang: String
    var soLuong: String
    var donGia: String
    init(matHang: String, soLuong: String, donGia: String) {
        self.matHang = matHang
        self.soLuong = soLuong
        self.donGia = donGia
    }
}

