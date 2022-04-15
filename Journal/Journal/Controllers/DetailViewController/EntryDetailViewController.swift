//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Bo Kim on 4/11/22.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
    var journal: Journal?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    @IBAction func clearButton(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty,
              let journal = journal else { return }
        
        
        if let entry = entry {
            EntryController.update(entry: entry, title: title, body: body)
        } else {
            EntryController.createEntryWith(title: title, body: body, journal: journal)
        }
        navigationController?.popViewController(animated: true)
    }
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
}
