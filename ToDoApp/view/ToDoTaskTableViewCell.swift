//
//  ToDoTaskTableViewCell.swift
//  ToDoApp
//
//  Created by Osmar Juarez on 24/09/22.
//

import UIKit

class ToDoTaskTableViewCell: UITableViewCell {

    @IBOutlet var taskTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
