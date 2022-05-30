//
//  HighLightEnabledButton.swift
//  Rupesh Viper Learning
//
//  Created by Rupeshkumar on 29/05/22.
//

import UIKit

///custom button to add button tap animation
final class HighLightEnabledButton: UIButton{
    override var isHighlighted: Bool{
        didSet{
            alpha = isHighlighted ? 0.8: 1
        }
    }
}
