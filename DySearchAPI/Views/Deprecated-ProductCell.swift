//
//  ProductCell.swift
//  DySearchAPI
//
//  Created by Chuck.Zhou on 6/27/20.
//  Copyright © 2020 Haibo Family. All rights reserved.
//

// Removed as switch to SwiftUI from UIKit.

//import UIKit
//
//class ProductCell: UITableViewCell {
//
//    let brandLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .clear
//        label.numberOfLines = 1
//        label.font = .boldSystemFont(ofSize: 20)
//        label.textColor = .textColor
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let stockLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .clear
//        label.numberOfLines = 1
//        label.font = .systemFont(ofSize: 15)
//        label.textColor = .textColor
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let priceLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .clear
//        label.numberOfLines = 1
//        label.font = .systemFont(ofSize: 17)
//        label.textColor = .textColor
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let containerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.clipsToBounds = true
//        return view
//    }()
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        self.contentView.addSubview(brandLabel)
//        self.contentView.addSubview(stockLabel)
//        self.contentView.addSubview(priceLabel)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        brandLabel.frame = CGRect(x: CommonInsets.left, y: 20, width: bounds.width - CommonInsets.left - CommonInsets.right, height: 30)
//        stockLabel.frame = CGRect(x: CommonInsets.left, y: brandLabel.frame.maxY, width: brandLabel.frame.width, height: 30)
//
//        priceLabel.frame = CGRect(x: bounds.width - 80, y: (bounds.height / 2) - 9, width: 70, height: 18)
//
//    }
//
//}
