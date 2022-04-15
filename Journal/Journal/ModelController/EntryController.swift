//
//  EntryController.swift
//  Journal
//
//  Created by Bo Kim on 4/11/22.
//

import Foundation

class EntryController {
    
    static func createEntryWith(title: String, body: String, journal: Journal) {
        let newEntry = Entry(title: title, body: body)
        JournalController.shared.addEntryTo(journal: journal, entry: newEntry)
    }
    static func delete(entry: Entry, journal: Journal) {
        JournalController.shared.delete(journal: journal)
    }
    static func update(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
        JournalController.shared.saveToPersistenceStore()
    }
    
}
