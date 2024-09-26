//
//  PopUpSelectViewModel.swift
//  QuickGooCo
//
//  Created by xuanquynhle on 2021/02/08.
//  Copyright © 2021 グッドサイクルシステム. All rights reserved.
//

import UIKit

class PopUpSelectViewModel {
    // MARK: - Properties
    private var contents: [String] = []
    var accessoryType: UITableViewCell.AccessoryType = .none

    // MARK: - Handlers
    
    /// Number of rows for table view
    /// - Returns: Number of rows for table view
    func numberOfRowsInSection() -> Int {
        return self.contents.count
    }

    /// Set content for table view
    /// - Parameters:
    ///   - contents: content for table view
    ///   - accessoryType: accessory type
    func setContents(contents: [String], accessoryType: UITableViewCell.AccessoryType = .none) {
        self.contents = contents
        self.accessoryType = accessoryType
    }

    /// Content for table view cell
    /// - Parameter indexPath: indexPaht of table view
    /// - Returns: Content for table view cell
    func getContent(indexPath: IndexPath) -> String {
        return self.contents[indexPath.row]
    }
}
