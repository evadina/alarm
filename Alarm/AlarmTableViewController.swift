//
//  AlarmTableViewController.swift
//  Alarm
//
//  Created by Madina Tazhiyeva on 10/11/20.
//  Copyright © 2020 Madina Tazhiyeva. All rights reserved.
//

import UIKit

class AlarmTableViewController: UITableViewController, AddAlarm, UpdateAlarm, DeleteAlarm {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func deleteAlarm(index: Int?) {
        if let ind = index  {
            Data.alarmsList.remove(at: ind)
            print(Data.alarmsList.count)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    func updateAlarm(time: String, comment: String, index: Int?) {
        print(time + "Update")
        print(comment + "Update")
        if let ind = index  {
            Data.alarmsList[ind] = Alarm.init(time: time, comment: comment, isActive: true)
        }
    }
    
    func addAlarm(time: String, comment: String) {
        print(time)
        print(comment)
        print("blabla")
        Data.alarmsList.append(Alarm.init(time:time,comment:comment, isActive: true))
        print(Data.alarmsList.count)
    }
    
    
    @IBAction func addNewAlarm(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let popup = storyBoard.instantiateViewController(withIdentifier: "newAlarm") as! NewAlarmViewController
        popup.delegate = self
        self.present(popup, animated: true, completion: nil)
        popup.doneAction = {
            self.tableView?.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let popup = storyBoard.instantiateViewController(withIdentifier: "editAlarm") as! UpdateViewController
        self.present(popup, animated: true, completion: nil)
        
        popup.index = indexPath.row
        popup.delegate = self
        popup.delegateDelete = self
        popup.doneAction = {
            self.tableView?.reloadData()
        }
        
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.alarmsList.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        cell.timeLabel!.text = Data.alarmsList[indexPath.row].time
        cell.commentLabel!.text = Data.alarmsList[indexPath.row].comment
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            Data.alarmsList.remove(at: indexPath.row)
            print(Data.alarmsList.count)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
