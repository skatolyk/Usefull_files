//
//  UICollectionView.swift
//
//
//  Created by Severyn-Wsevolod Katolyk on 8/15/18.
//  Copyright © 2018 Severyn-Wsevolod Katolyk. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(cell.nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func registerSupplementary<T: UICollectionReusableView>(header: T.Type) {
        registerSupplementary(view: header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
    }
    
    func registerSupplementary<T: UIView>(view: T.Type, forSupplementaryViewOfKind kind: String) {
        register(view.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: view.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not find collection view cell with identifier \(T.identifier)")
        }
        return cell
    }
    
    func dequeueReusableSupplementaryHeader<T: UICollectionReusableView>(for indexPath: IndexPath) -> T? {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, for: indexPath)
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, for indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: kind,
                                                            withReuseIdentifier: T.identifier,
                                                            for: indexPath) as? T
            else {
                fatalError("Could not find collection supplementary view with identifier \(T.identifier)")
        }
        return header
    }
    
    func safeScrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        guard dataSource?.collectionView(self, cellForItemAt: indexPath) != nil else {
            return
        }
        scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    func scrollToFirstItem(at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        safeScrollToItem(at: .zero, at: scrollPosition, animated: animated)
    }
}
