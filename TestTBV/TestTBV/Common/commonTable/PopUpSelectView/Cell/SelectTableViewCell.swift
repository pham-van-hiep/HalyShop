//
//  SelectTableViewCell.swift
//  QuickGooCo
//
//  Created by xuanquynhle on 2021/02/08.
//  Copyright © 2021 グッドサイクルシステム. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell, Identifiable {
    // MARK: - UI Properties
    @IBOutlet weak var contentLabel: UILabel!

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Handlers
    func bindData(
        content: String,
        isSelected: Bool,
        accessoryType: UITableViewCell.AccessoryType = .none,
        fontSize: CGFloat = 13) {
        self.contentLabel.text = content
        self.accessoryType = isSelected ? accessoryType : .none
    }
}
