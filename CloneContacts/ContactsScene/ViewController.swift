//
//  ViewController.swift
//  CloneContacts
//
//  Created by Hoang Tung on 2/18/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

protocol HasAction {
  func reloadData()
}

class ViewController: UIViewController, HasAction {
  
  let sceneView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let sceneLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Contacts"
    label.font = .boldSystemFont(ofSize: 32)
    return label
  }()
  
  let contactSearchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.backgroundImage = UIImage()
    return searchBar
  }()
  
  let contactTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigation()
    setupView()
    setupLayout()
    setupTableView()
  }
  
  func setupNavigation() {
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    //    navigationController?.navigationBar.
    let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(routeToAddScene))
    navigationItem.rightBarButtonItem = addItem
  }
  
  func setupView() {
    view.addSubview(sceneView)
    sceneView.addSubview(sceneLabel)
    sceneView.addSubview(contactSearchBar)
    sceneView.addSubview(contactTableView)
  }
  
  func setupLayout() {
    sceneView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    sceneLabel.topAnchor.constraint(equalTo: sceneView.topAnchor, constant: 0).isActive = true
    sceneLabel.leadingAnchor.constraint(equalTo: sceneView.leadingAnchor, constant: 16).isActive = true
    sceneLabel.trailingAnchor.constraint(equalTo: sceneView.trailingAnchor, constant: -16).isActive = true
    sceneLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
    
    contactSearchBar.topAnchor.constraint(equalTo: sceneLabel.bottomAnchor, constant: 16).isActive = true
    contactSearchBar.leadingAnchor.constraint(equalTo: sceneView.leadingAnchor, constant: 8).isActive = true
    contactSearchBar.trailingAnchor.constraint(equalTo: sceneView.trailingAnchor, constant: -8).isActive = true
    contactSearchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    contactTableView.topAnchor.constraint(equalTo: contactSearchBar.bottomAnchor, constant: 16).isActive = true
    contactTableView.leadingAnchor.constraint(equalTo: sceneView.leadingAnchor, constant: 0).isActive = true
    contactTableView.trailingAnchor.constraint(equalTo: sceneView.trailingAnchor, constant: 0).isActive = true
    contactTableView.bottomAnchor.constraint(equalTo: sceneView.bottomAnchor, constant: 0).isActive = true
  }
  
  @objc func setupTableView() {
    contactTableView.delegate = self
    contactTableView.dataSource = self
  }
  
  @objc func routeToAddScene() {
    let addVC = AddViewController()
    addVC.mainViewController = self
    let addNavigation = UINavigationController(rootViewController: addVC)
    navigationController?.present(addNavigation, animated: true, completion: {})
    navigationController?.modalPresentationStyle = .formSheet
  }
  
  func reloadData() {
    contactTableView.reloadData()
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return User.getAllUser().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = ContactTableViewCell()
    cell.firstNameLabel.text = User.getAllUser()[indexPath.row].firstName
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    detailVC.user = User.getAllUser()[indexPath.row]
    navigationController?.pushViewController(detailVC, animated: true)
  }
}
