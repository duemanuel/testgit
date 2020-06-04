//
//  UITableView.swift
//  TestGit
//
//  Created by Eduardo Emanuel Freire do Vale Oliveira on 03/06/20.
//  Copyright © 2020 Eduardo Oliveira. All rights reserved.
//

import UIKit

extension UITableView {

    public func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T
    }
}

public protocol ClassNameProtocol {
    static var className: String { get }
}

extension ClassNameProtocol {
    public static var className: String {
        let name = String(describing: self)
        return name
    }
}

extension NSObject: ClassNameProtocol {}
