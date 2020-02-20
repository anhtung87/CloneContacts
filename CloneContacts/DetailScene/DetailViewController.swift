//
//  EditViewController.swift
//  CloneContacts
//
//  Created by Hoang Tung on 2/19/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var user: User?
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()
  
  let phoneLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Phone"
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let phoneNumberLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigation()
    setupView()
    setupLayout()
//    addDataToView()
  }
  
  func setupNavigation() {
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationItem.leftBarButtonItem?.title = ""
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
  }
  
  func setupView() {
    view.addSubview(nameLabel)
    view.addSubview(phoneLabel)
    view.addSubview(phoneNumberLabel)
  }
  
  func setupLayout() {
    nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
    nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
    phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    phoneLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
    phoneLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    
    phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
    phoneNumberLabel.leadingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: 16).isActive = true
    phoneNumberLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
    phoneNumberLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
  }
  
  func addDataToView() {
    nameLabel.text = user?.firstName
    let phone = Phone.getPhone(user: user)
    phoneNumberLabel.text = phone?.number
  }
  
}
