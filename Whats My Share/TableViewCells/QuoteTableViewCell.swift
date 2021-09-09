//
//  QuoteTableViewCell.swift
//  Whats My Share
//
//  Created by Søren Randum on 05/09/2021.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    
//    @IBOutlet weak var employeeIdLabel: UILabel!
//  @IBOutlet weak var employeeNameLabel: UILabel!
  
  
  
  var quote : Response? {
        didSet {
        //    employeeIdLabel.text = employee?.id
        //    employeeNameLabel.text = employee?.employeeName
        }
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
