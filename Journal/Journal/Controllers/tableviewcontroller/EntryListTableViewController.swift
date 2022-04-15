//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Bo Kim on 4/11/22.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    var journal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journal?.entries.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        guard let journal = journal else { return cell }
        
        let entry = journal.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let journal = journal else { return }
            let entryToDelete = journal.entries[indexPath.row]
            EntryController.delete(entry: entryToDelete, journal: journal)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "entrySegue" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController else { return }
            guard let journal = journal else { return }
            let entryToSend = journal.entries[indexPath.row]
            
            destination.entry = entryToSend
            destination.journal = journal
        } else if segue.identifier == "createNewEntry" {
            guard let journal = journal else { return }
            guard let destination = segue.destination as? EntryDetailViewController else { return }
            destination.journal = journal
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
