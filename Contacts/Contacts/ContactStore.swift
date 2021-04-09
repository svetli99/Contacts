//
//  ContactStore.swift
//  Contacts
//
//  Created by Svetlio on 9.04.21.
//

import UIKit

class ContactStore {
    var allContacts = [(Character, [Contact])]()
    
    init() {
        for _ in 1...10 {
            createContact()
        }
    }
    
    @discardableResult func createContact() -> Contact? {
        let newContact = Contact(random: true)
        guard let first = newContact.name.first else {
            return nil
        }
        if let index = allContacts.firstIndex { $0.0 == first } {
            allContacts[index].1.append(newContact)
            allContacts[index].1.sort()
        } else {
            allContacts.append((first,[newContact]))
            allContacts.sort { $0.0 < $1.0 }
        }
        
        return newContact
    }
    
    func getNumberOfRows(_ section: Int) -> Int {
        allContacts[section].1.count
    }
    
    func getContact(section: Int, row: Int) -> Contact {
        allContacts[section].1[row]
    }
    
    func getSectoinTittle(section: Int) -> String {
        String(allContacts[section].0)
    }
}
