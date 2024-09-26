//
//  TestTableViewCell.swift
//  TestTBV
//
//  Created by Pham on 2024/09/16.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var sttLabel: UILabel!
    @IBOutlet weak var matHangLabel: UILabel!
    @IBOutlet weak var soLuongLabel: UILabel!
    @IBOutlet weak var donGiaLabel: UILabel!
    @IBOutlet weak var thanhTienLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func bindData(data: DataHang, index: Int) {
        self.changeBgColorLabels(index: index)
        self.sttLabel.text = String(index + 1)
        self.matHangLabel.text = data.matHang
        self.soLuongLabel.text = data.soLuong + "Kg"
        self.donGiaLabel.text = data.donGia
        self.thanhTienLabel.text = String((Double(data.donGia) ?? 0)*(Double(data.soLuong) ?? 0))
    }

    private func changeBgColorLabels(index: Int) {
//        if index % 2 == 0 {
            self.sttLabel.backgroundColor = UIColor.systemGray6
            self.matHangLabel.backgroundColor = UIColor.systemGray6
            self.soLuongLabel.backgroundColor = UIColor.systemGray6
            self.donGiaLabel.backgroundColor = UIColor.systemGray6
            self.thanhTienLabel.backgroundColor = UIColor.systemGray6
//        }
    }
}
