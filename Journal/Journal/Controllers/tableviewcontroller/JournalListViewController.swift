//
//  JournalListViewController.swift
//  Journal
//
//  Created by Bo Kim on 4/12/22.
//

import UIKit

class JournalListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalController.shared.journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = journalListTableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        let journal = JournalController.shared.journals[indexPath.row]
        
        cell.textLabel?.text = journal.title
        cell.detailTextLabel?.text = "\(journal.entries.count) Entries"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let journalToDelete = JournalController.shared.journals[indexPath.row]
        JournalController.shared.delete(journal: journalToDelete)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    @IBOutlet weak var JournalTitleTextField: UITextField!
    @IBOutlet weak var journalListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        journalListTableView.delegate = self
        journalListTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        journalListTableView.reloadData()
    }
    
    @IBAction func createNewJournalButtonTapped(_ sender: Any) {
        guard let journalTitle = JournalTitleTextField.text, !journalTitle.isEmpty else { return }
        JournalController.shared.createJournalWith(title: journalTitle)
        journalListTableView.reloadData()
        JournalTitleTextField.text = ""
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryList" {
            guard let indexPath = journalListTableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryListTableViewController else { return }
            let journalToSend = JournalController.shared.journals[indexPath.row]
            destination.journal = journalToSend
        }
    }

}
