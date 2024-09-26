//
//  DanhSachKHViewController.swift
//  TestTBV
//
//  Created by Pham on 2024/09/16.
//

import UIKit

class DanhSachKHViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var listTbv: UITableView!
    @IBOutlet weak var ThemDonBtn: UIButton!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var timKiemBtn: UIButton!

    let searchType = ["Ngày", "SDT"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    private func setupUI() {
        self.listTbv.delegate = self
        self.listTbv.dataSource = self
        let cellNib = UINib(nibName: "DanhSachKHTableViewCell", bundle: nil)
        self.listTbv.register(cellNib, forCellReuseIdentifier: "DanhSachKHTableViewCell")

        self.ThemDonBtn.layer.borderWidth = 0.5
        self.ThemDonBtn.layer.borderColor = UIColor.gray.cgColor
        self.ThemDonBtn.layer.cornerRadius = 5

        self.timKiemBtn.layer.borderWidth = 0.5
        self.timKiemBtn.layer.borderColor = UIColor.gray.cgColor
        self.timKiemBtn.layer.cornerRadius = 5

        self.inputTF.layer.borderWidth = 0.5
        self.inputTF.layer.borderColor = UIColor.gray.cgColor
        self.inputTF.layer.cornerRadius = 5
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension DanhSachKHViewController: UITextFieldDelegate {

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension DanhSachKHViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DanhSachKHTableViewCell", for: indexPath) as? DanhSachKHTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    

}
