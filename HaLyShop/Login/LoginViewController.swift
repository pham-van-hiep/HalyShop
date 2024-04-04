//
//  LoginViewController.swift
//  HaLyShop
//
//  Created by Pham on 2024/04/03.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goBtnDidTapped(_ sender: UIButton) {
        let listKhachViewController = ListKhachViewController(nibName: "ListKhachViewController", bundle: nil)
        listKhachViewController.modalPresentationStyle = .fullScreen
        self.present(listKhachViewController, animated: true, completion: nil)
    }
    
}
