//
//  UITableView.swift
//  
//
//  Created by Severyn-Wsevolod Katolyk on 2/7/19.
//  Copyright © 2019 Severyn-Wsevolod Katolyk. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }
    
    func register<T: UIView>(reuseView: T.Type) {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not find table view cell with identifier \(T.identifier)")
        }
        return cell
    }
    
    func dequeueReusableView<T: UIView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Could not find table view cell with identifier \(T.identifier)")
        }
        return view
    }
    
    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard dataSource?.tableView(self, cellForRowAt: indexPath) != nil else {
            return
        }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    func scrollToFirstRow(at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        safeScrollToRow(at: .zero, at: scrollPosition, animated: animated)
    }
}
