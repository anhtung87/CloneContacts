//
//  ContactTableViewCell.swift
//  CloneContacts
//
//  Created by Hoang Tung on 2/19/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
  
  let firstNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 20)
    return label
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setupView()
    setupLayout()
  }
  
  func setupView() {
    self.addSubview(firstNameLabel)
  }
  
  func setupLayout() {
    firstNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
    firstNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    firstNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
    firstNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
  }
  
}
