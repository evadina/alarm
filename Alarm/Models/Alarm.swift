//
//  Alarm.swift
//  Alarm
//
//  Created by Madina Tazhiyeva on 10/11/20.
//  Copyright © 2020 Madina Tazhiyeva. All rights reserved.
//

import Foundation

class Alarm {
    var time: String?
    var comment: String?
    var isActive: Bool
    
    init(time: String?, comment: String?, isActive: Bool) {
        self.time = time
        self.comment = comment
        self.isActive = isActive
    }
}
