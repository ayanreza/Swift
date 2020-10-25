//
//  NoteViewController.swift
//  Notes
//
//  Created by Ayan Reza on 8/30/20.
//  Copyright © 2020 Ayan Reza. All rights reserved.
//


import UIKit

class NoteViewController: UIViewController {
    var note: Note!
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note.contents
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        note.contents = textView.text
        NoteManager.main.save(note: note)
    }
}
