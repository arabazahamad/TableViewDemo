//
//  CustomCell.swift
//  TableViewDemo
//
//  Created by Apps WeLove on 15/12/23.
//

import UIKit

class CustomCell: UITableViewCell {
    let myImageView = UIImageView()
    let myLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add subviews and set up constraints or frames
        // Example:
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)

        // Further customization
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.width - 10, height: 150)
        myLabel.frame = CGRect(x: (contentView.frame.width / 2) - 40, y: 160, width: 90, height: 40)
    }
}


