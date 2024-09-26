//
//  PopUpSelectViewController.swift
//  QuickGooCo
//
//  Created by xuanquynhle on 2021/02/08.
//  Copyright © 2021 グッドサイクルシステム. All rights reserved.
//

import UIKit

class PopUpSelectViewController: UIViewController {
    // MARK: - UI Properties
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var parentVC: UIViewController?
    private var styleColor: UIColor?
    
    // MARK: - Properties
    typealias handler = (Int, String) -> Void
    let viewModel = PopUpSelectViewModel()
    @objc var didSelectRowAt: handler?
    private var indexSelected: Int = 0

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    // MARK: - Configs
    /// Setup table view
    private func setupTableView() {
        self.contentTableView.register(UINib(nibName: "SelectTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectTableViewCell")
        self.contentTableView.tableFooterView = UIView()
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        self.contentTableView.alwaysBounceVertical = false
        self.contentTableView.estimatedRowHeight = 100
        self.contentTableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - UI Actions
    
    // MARK: - Handlers
    func setPopupStyle(styleColor: UIColor) {
        self.styleColor = styleColor
    }

    /// Set contents for table view
    /// - Parameters:
    ///   - title: title
    ///   - contents: contents for table view
    ///   - accessoryType: accessory type
    ///   - indexSelected: index selected
    ///   - fontSize: font size
    @objc func setContents(
        title: String? = nil,
        contents: [String],
        accessoryType: UITableViewCell.AccessoryType = .none,
        indexSelected: Int = 0) {
        if title == nil {
            self.titleLabel.isHidden = true
        }
        self.titleLabel.text = title
        self.viewModel.setContents(contents: contents, accessoryType: accessoryType)
        self.indexSelected = indexSelected
    }

    /// Show popup selected view controller
    /// - Parameters:
    ///   - sourceView: sender view
    ///   - parentViewController: parentViewController need show
    ///   - popupSize: size for popup view
    ///   - permittedArrowDirections: direction for popup view. default up
    @objc func setupPopup(sourceView: UIView, parentVC: UIViewController, popupSize: CGSize, permittedArrowDirections: UIPopoverArrowDirection = .up) {
        self.parentVC = parentVC
        self.view.frame = CGRect(x: 0, y: 0, width: popupSize.width, height: popupSize.height)
        self.modalPresentationStyle = .popover
        if let popover = self.popoverPresentationController {
            popover.sourceView = sourceView
            popover.permittedArrowDirections = permittedArrowDirections
            // the position of the popover where it's showed
            popover.sourceRect = sourceView.bounds

            // the size you want to display
            self.preferredContentSize = CGSize(width: popupSize.width, height: popupSize.height)

            // set colors
            popover.backgroundColor = styleColor != nil ? styleColor : .clear
            self.view.backgroundColor = styleColor != nil ? styleColor : .clear
        }
    }
    
    // Show popup
    @objc func showPopup() {
        self.parentVC?.present(self, animated: true, completion: nil)
    }
    
    // MARK: - Notifications
    
    // MARK: - Utils
}

// MARK: - UITableViewDataSource
extension PopUpSelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTableViewCell", for: indexPath) as? SelectTableViewCell else {
            return UITableViewCell()
        }
        let contentText = self.viewModel.getContent(indexPath: indexPath)
        cell.bindData(
            content: contentText,
            isSelected: self.indexSelected == indexPath.row,
            accessoryType: self.viewModel.accessoryType)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PopUpSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexSelected = indexPath.row
        self.parentVC?.dismiss(animated: true, completion: {
            self.didSelectRowAt?(indexPath.row, self.viewModel.getContent(indexPath: indexPath))
        })
        tableView.reloadData()
    }
}
