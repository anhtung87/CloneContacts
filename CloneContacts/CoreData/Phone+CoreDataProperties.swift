//
//  Phone+CoreDataProperties.swift
//  CloneContacts
//
//  Created by Hoang Tung on 2/18/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//
//

import Foundation
import CoreData


extension Phone {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Phone> {
    return NSFetchRequest<Phone>(entityName: "Phone")
  }
  
  @NSManaged public var number: String?
  @NSManaged public var user: User?
  
  static func insertNewPhone(number: String?) -> Phone? {
    let phone = NSEntityDescription.insertNewObject(forEntityName: "Phone", into: AppDelegate.managedObjectContext!) as! Phone
    phone.number = number
    
    do {
      try AppDelegate.managedObjectContext?.save()
    } catch {
      let nsError = error as NSError
      print("Can not insert new phone. Error in \(nsError), \(nsError.userInfo)")
    }
    print("Insert new phone with number \(String(describing: phone.number)) successful")
    return phone
  }
  
  static func getPhone(user: User?) -> Phone? {
    var phones = [Phone]()
    let context = AppDelegate.managedObjectContext
    do {
      let phoneFetchRequest = NSFetchRequest<Phone>(entityName: "Phone")
      phoneFetchRequest.predicate = NSPredicate(format: "user == %@", user!)
      phones = try context!.fetch(phoneFetchRequest)
    } catch {
      print("Can not fetch, error is \(error)")
    }
    print(phones)
    return phones[0]
  }
}
