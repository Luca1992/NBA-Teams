//
//  ThreeLabelCell.swift
//  NBA Teams
//
//  Created by ulixe on 24/04/21.
//

import Foundation
import UIKit

class ThreeLabelCell: UITableViewCell {

    @IBOutlet weak var upperLabel: UILabel!

    @IBOutlet weak var centerLabel: UILabel!

    @IBOutlet weak var lowerLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        resetCell()
    }

    func resetCell() {
    }

    func populate(obj: ThreeLabel) {
        self.upperLabel.text = obj.upperTitle
        self.centerLabel.text = obj.centerTitle
        self.lowerLabel.text = obj.lowerTitle
    }
}
