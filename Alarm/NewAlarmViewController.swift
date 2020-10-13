//
//  NewAlarmViewController.swift
//  Alarm
//
//  Created by Madina Tazhiyeva on 10/11/20.
//  Copyright © 2020 Madina Tazhiyeva. All rights reserved.
//

import UIKit

class NewAlarmViewController: UIViewController {
    
    
    @IBOutlet weak var timePicker: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    var doneAction: (() -> ())?
    var delegate: AddAlarm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveSelectedTime(_ sender: Any) {
        delegate?.addAlarm(time: timePicker.text!, comment: titleTextField.text!)
        if let doneAction = doneAction{
            doneAction()
        }
        dismiss(animated: true)
    }
    
    @IBAction func cancelSelectedTime(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension NewAlarmViewController: AddAlarm{
    func addAlarm(time: String, comment: String) {
    }
}
