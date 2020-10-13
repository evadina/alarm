//
//  AlarmTableViewCell.swift
//  Alarm
//
//  Created by Madina Tazhiyeva on 10/11/20.
//  Copyright © 2020 Madina Tazhiyeva. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var isActive: UISwitch!
    
    @IBAction func activateAlarm(_ sender: UISwitch) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
