//
//  JournalController.swift
//  Journal
//
//  Created by Bo Kim on 4/12/22.
//

import Foundation

class JournalController {
    static let shared = JournalController()
    
    var journals: [Journal] = []
    
    func createJournalWith(title: String) {
        let newJournals = Journal(title: title)
        journals.append(newJournals)
    }
    func delete(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
    }
    func addEntryTo(journal: Journal, entry: Entry) {
        journal.entries.append(entry)
    }
    func removeEntryFrom(journal: Journal, entry: Entry) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journal.entries.remove(at: index)
    }
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectoryURL = urls[0].appendingPathComponent("Journal.json")
        return documentsDirectoryURL
    }
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(journals)
            try data.write(to: fileURL())
        } catch {
            print("we had an error")
            print(error)
            print(error.localizedDescription)
        }
    }
    func loadFromPersistentStorage() {
        do {
            let data = try Data(contentsOf: fileURL())
            let fetchedJournals = try JSONDecoder().decode([Journal].self, from: data)
            journals = fetchedJournals
        } catch {
            print("We had an error loading data")
            print(error)
            print(error.localizedDescription)
        }
    }
}
