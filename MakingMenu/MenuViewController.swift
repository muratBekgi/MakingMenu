//
//  MenuViewController.swift
//  MakingMenu
//
//  Created by Murat Bekgi on 2/18/20.
//  Copyright © 2020 Murat Bekgi. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case about
    case profile
}

class MenuViewController: UITableViewController {

    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
}
