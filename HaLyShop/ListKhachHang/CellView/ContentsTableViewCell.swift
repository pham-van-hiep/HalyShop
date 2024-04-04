//
//  ContentsTableViewCell.swift
//  Test1
//
//  Created by Pham on 2024/03/30.
//

import UIKit

class ContentsTableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var commodityLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var shippingStatusLabel: UILabel!
    @IBOutlet weak var shippingTimeLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bindData(data: KhachHangResponse, count: Int) {
        self.countLabel.text = String(count + 1)
        self.nameLabel.text = data.userName
        self.phoneLabel.text = data.phone
        self.addressLabel.text = data.address
        self.commodityLabel.text = data.commodity
        self.quantityLabel.text = data.quantity
        self.totalLabel.text = data.total
    }

}
