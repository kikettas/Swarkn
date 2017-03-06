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
    
    @IBInspectable public var filledImage:UIImage? = nil {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable public var emptyImage:UIImage? = nil {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable public var hightlightedImage:UIImage? = nil {
        didSet {
            setupButtons()
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        self.distribution = .fillEqually
        
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
        self.distribution = .fillEqually
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.distribution = .fillEqually
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.distribution = .fillEqually
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
            button.setImage(filledImage, for: .selected)
            button.setImage(hightlightedImage, for: .highlighted)
            button.setImage(hightlightedImage, for: [.highlighted, .selected])
            button.contentHorizontalAlignment = .fill
            button.contentVerticalAlignment = .fill
            button.imageView?.contentMode = .scaleAspectFit
            
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
