//
//  TaskCell.swift
//  Composite
//
//  Created by Daniil Kniss on 20.04.2021.
//

import UIKit

class TaskCell: UITableViewCell {
    
    
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var subTasksCount: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
