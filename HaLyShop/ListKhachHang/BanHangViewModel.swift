//
//  BanHangViewModel.swift
//  HaLyShop
//
//  Created by Pham on 2024/03/21.
//

import Foundation
import UIKit
import CodableFirebase
import FirebaseDatabase

class BanHangViewModel {
    private var ref: DatabaseReference!
    var khachHangList: [KhachHangResponse] = []
    var needReloadTable: (() -> Void)?

    func numberOfRow() -> Int {
        return self.khachHangList.count
    }

    func dataForRow() -> [KhachHangResponse] {
        let listKhach = self.khachHangList.filter { $0.dataKind == "1" }
        return listKhach
    }

    func getDataKhachHang() {
        self.ref = Database.database().reference()
        self.ref.child("KhachHangList").observe(.childAdded, with: { [weak self] (snapshot) in
            guard let strongSelf = self,
                let result = snapshot.value else {
                return
            }
            do {
                if let response = try? FirebaseDecoder().decode(KhachHangResponse.self, from: result) {
                    strongSelf.khachHangList.append(response)
                    strongSelf.needReloadTable?()
                    print(strongSelf.khachHangList)
                }
            }
        })
    }
}

struct KhachHangResponse: Decodable {
    let addDate, address, commodity, dataKind: String
    let note, paymentStatus, phone, priority: String
    let quantity, shipping, total, updateDate: String
    let userName, register: String

    enum CodingKeys: String, CodingKey {
        case addDate = "AddDate"
        case address = "Address"
        case commodity = "Commodity"
        case dataKind = "DataKind"
        case note = "Note"
        case paymentStatus = "PaymentStatus"
        case phone = "Phone"
        case priority = "Priority"
        case quantity = "Quantity"
        case shipping = "Shipping"
        case total = "Total"
        case updateDate = "UpdateDate"
        case userName = "UserName"
        case register = "register"
    }
}
