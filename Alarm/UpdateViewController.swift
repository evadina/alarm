//
//  UpdateViewController.swift
//  Alarm
//
//  Created by Madina Tazhiyeva on 10/12/20.
//  Copyright © 2020 Madina Tazhiyeva. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    var delegate: UpdateAlarm?
    var delegateDelete: DeleteAlarm?
    var index: Int?
    var doneAction: (() -> ())?
    
    
    @IBOutlet weak var timePicker: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func deleteAlarmOnClick(_ sender: Any) {
        delegateDelete?.deleteAlarm(index: index!)
              if let doneAction = doneAction{
                  doneAction()
              }
              dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let ind = index{
            timePicker.text = Data.alarmsList[ind].time
            titleTextField.text = Data.alarmsList[ind].comment
        }
    }
    
    @IBAction func cancelUpdating(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveUpdatedParams(_ sender: Any) {
        delegate?.updateAlarm(time: timePicker.text!, comment: titleTextField.text!, index: index)
        if let doneAction = doneAction{
            doneAction()
        }
        dismiss(animated: true)
    }
    
    
    
}
