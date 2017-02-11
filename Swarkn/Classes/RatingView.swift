//
//  StarRating.swift
//  Swarkn
//
//  Created by Enrique del Pozo Gómez on 2/11/17.
//  Copyright © 2017 Swarkn. All rights reserved.
//

import UIKit


@IBDesignable public class RatingView: UIStackView {
    
    private var ratingButtons:[UIButton] = []
    
    @IBInspectable public var buttonCount:Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable public var interaction:Bool = true {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable public var sameRatio:Bool = true {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable public var fillImage:UIImage? = nil {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable public var emptyImage:UIImage? = nil {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable public var hightlighted:UIImage? = nil {
        didSet {
            setupButtons()
        }
    }
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtons()
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    
    dynamic public var rating = 0 {
        didSet {
            updateButtonStates()
        }
    }
    
    private func setupButtons(){
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        let buttonHeight = self.frame.height
        let buttonWidth = sameRatio ? buttonHeight : (self.frame.width - (CGFloat((buttonCount - 1)) * self.spacing)) / CGFloat(buttonCount)
        
        for _ in 0..<buttonCount{
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            button.setImage(emptyImage, for: .normal)
            button.setImage(fillImage, for: .selected)
            button.setImage(hightlighted, for: .highlighted)
            button.setImage(hightlighted, for: [.highlighted, .selected])
            
            if(interaction){
                button.addTarget(self, action: #selector(RatingView.tapped(button:)), for: .touchUpInside)
            }
            
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        updateButtonStates()
    }
    
    @objc private func tapped(button:UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button is not in the ratingButtons array")
        }
        
        rating = index + 1
        
    }
    
    private func updateButtonStates(){
        _ = ratingButtons.enumerated().map { index, button in
            button.isSelected = index < rating
        }
    }
}
