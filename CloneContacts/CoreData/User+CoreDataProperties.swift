//
//  User+CoreDataProperties.swift
//  CloneContacts
//
//  Created by Hoang Tung on 2/18/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//
//

import Foundation
import CoreData


extension User {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
    return NSFetchRequest<User>(entityName: "User")
  }
  
  @NSManaged public var id: Int16
  @NSManaged public var firstName: String?
  @NSManaged public var lastName: String?
  @NSManaged public var phone: NSSet?
  
}

// MARK: Generated accessors for phone
extension User {
  
  @objc(addPhoneObject:)
  @NSManaged public func addToPhone(_ value: Phone)
  
  @objc(removePhoneObject:)
  @NSManaged public func removeFromPhone(_ value: Phone)
  
  @objc(addPhone:)
  @NSManaged public func addToPhone(_ values: NSSet)
  
  @objc(removePhone:)
  @NSManaged public func removeFromPhone(_ values: NSSet)
  
  static func insertNewUser(id: Int16, firstName: String?, lastName: String?) -> User? {
    let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: AppDelegate.managedObjectContext!) as! User
    user.id = id
    user.firstName = firstName
    user.lastName = lastName
    
    do {
      try AppDelegate.managedObjectContext?.save()
    } catch {
      let nsError = error as NSError
      print("Can not insert new user. Error in \(nsError), \(nsError.userInfo)")
      return nil
    }
    print("Insert new User with first name \(String(describing: user.firstName)) successful")
    return user
  }
  
  static func getAllUser() -> [User] {
    var users = [User]()
    let context = AppDelegate.managedObjectContext
    do {
      users = try context!.fetch(User.fetchRequest()) as! [User]
    } catch {
      print("Can not fetch, error is \(error)")
      return users
    }
    return users
  }
  
  static func getUser(id: Int16) -> User? {
    var users = [User]()
    let context = AppDelegate.managedObjectContext
    do {
      let userFetchRequest = NSFetchRequest<User>(entityName: "User")
      userFetchRequest.predicate = NSPredicate(format: "id == %@", id)
      users = try context!.fetch(userFetchRequest)
    } catch {
      print("Can not fetch, error is \(error)")
      return nil
    }
    return users[0]
  }
  
  static func deleteUser(id: Int16) {
    let context = AppDelegate.managedObjectContext
    if let user = User.getUser(id: id) {
      context?.delete(user)
    }
    do {
      try AppDelegate.managedObjectContext?.save()
    } catch {
      print("User with id \(id) doesn't exist!")
    }
  }
}
