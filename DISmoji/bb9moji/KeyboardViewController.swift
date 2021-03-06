//
//  KeyboardViewController.swift
//  bb9moji
//
//  Created by James La Marre on 5/4/16.
//  Copyright © 2016 Berlin Biennale. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var keyOne: UILabel!
    
    @IBAction func didTapInsert() {
        
        var proxy = textDocumentProxy as UITextDocumentProxy
        if let input = keyOne?.text as String? {
            proxy.insertText(input)
        }
        
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        loadInterface()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .System)
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true

        
//        self.keyOne = UIButton(type: .System)
//        self.keyOne.setTitle(NSLocalizedString("1", comment: "Title for first button"), forState: .Normal)
//        self.keyOne.sizeToFit()
//        self.keyOne.translatesAutoresizingMaskIntoConstraints = false
//        self.keyOne.addTarget(self, action: "inputTextIntoField", forControlEvents: .TouchUpInside)
//        self.keyOne.font = UIFont[name: "Helvetica", size: 18]
//        self.view.addSubview(self.keyOne)
        
        
    }
    
    func loadInterface() {
        
        // load the nib file
        var bb9mojiNib = UINib(nibName: "bbmoji", bundle: nil)
        // instantiate the view
        let bbmojiView = bb9mojiNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        // add interface to the main view
        view.addSubview(bbmojiView)
        
        // copy the background color 
        view.backgroundColor = bbmojiView.backgroundColor
        
    }
    
    func inputTextIntoField() {
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText("1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
//        self.keyOne.setTitleColor(textColor, forState: .Normal)
        
    }

}
