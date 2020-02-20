//
//  AddViewController.swift
//  CloneContacts
//
//  Created by Hoang Tung on 2/19/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
  
  var mainViewController: HasAction?
  
  let firstNameTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.borderStyle = .none
    var bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: 39, width: UIScreen.main.bounds.maxX - 16, height: 0.5)
    bottomLine.backgroundColor = UIColor.systemGray3.cgColor
    textField.layer.addSublayer(bottomLine)
    textField.placeholder = "First Name"
    return textField
  }()
  
  let lastNameTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.borderStyle = .none
    var bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: 39, width: UIScreen.main.bounds.maxX - 16, height: 0.5)
    bottomLine.backgroundColor = UIColor.systemGray3.cgColor
    textField.layer.addSublayer(bottomLine)
    textField.placeholder = "Last Name"
    return textField
  }()
  
  let phoneNumberTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.borderStyle = .none
    var bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: 39, width: UIScreen.main.bounds.maxX - 16, height: 0.5)
    bottomLine.backgroundColor = UIColor.systemGray3.cgColor
    textField.layer.addSublayer(bottomLine)
    textField.placeholder = "Phone Number"
    return textField
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigation()
    setupView()
    setupLayout()
    setupTextFieldDelegate()
  }
  
  func setupNavigation() {
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//    navigationController?.navigationBar.shadowImage = UIImage()
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                       style: .plain, target: self, action: #selector(cancel))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(save))
    navigationItem.rightBarButtonItem?.isEnabled = false
    navigationItem.title = "New Contact"
  }
  
  @objc func cancel() {
    navigationController?.dismiss(animated: true, completion: {})
  }
  
  @objc func save() {
    let users = User.getAllUser()
    let index = users.count == 0 ? 1 : users[users.count - 1].id + 1
    let user = User.insertNewUser(id: Int16(index), firstName: firstNameTextField.text, lastName: lastNameTextField.text)
    var phoneNumbers = Set<Phone>()
    if let phone = Phone.insertNewPhone(number: phoneNumberTextField.text) {
      phone.user = user
      phoneNumbers.insert(phone)
    }
    user?.addToPhone(phoneNumbers as NSSet)
    navigationController?.dismiss(animated: true, completion: {})
    mainViewController?.reloadData()
  }
  
  func setupView() {
    view.addSubview(firstNameTextField)
    view.addSubview(lastNameTextField)
    view.addSubview(phoneNumberTextField)
  }
  
  func setupLayout() {
    firstNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    firstNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 0).isActive = true
    lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    lastNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    phoneNumberTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 0).isActive = true
    phoneNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    phoneNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  
  func setupTextFieldDelegate() {
    firstNameTextField.delegate = self
    lastNameTextField.delegate = self
    phoneNumberTextField.delegate = self
  }
}

extension AddViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    navigationItem.rightBarButtonItem?.isEnabled = true
  }
}
