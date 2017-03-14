//
//  MessageBar.swift
//  
//
//  Created by kikettas on 3/8/17.
//  Copyright © 2017 Swarkn. All rights reserved.
//

import Foundation
import UIKit

class MessageBar: UIView {
    
    var messageBarHeight:CGFloat = 0
    var positionConstraint:NSLayoutConstraint!
    var messageBarPosition:MessageBarPosition!
    var didHide:(() -> ())!
    
    enum MessageBarStyle:CGFloat{
        case small = 20
        case medium = 50
        case large = 100
    }
    
    enum MessageBarPosition{
        case top
        case bottom
    }
    
    enum MessageBarDuration:Double{
        case short = 2.0
        case long = 4.0
        case infinite = -1
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public class func show(on:UIView?, withMessage message:String, duration:MessageBarDuration = .short, style:MessageBarStyle = .medium, backgroundColor:UIColor = UIColor.darkGray, position:MessageBarPosition = .bottom, font:UIFont = UIFont.systemFont(ofSize: 17.0), showCloseButton:Bool = false, imageButtonNormal:UIImage? = nil, titleButton:String? = nil, didHide:@escaping (() -> ()) = {}) -> MessageBar{
        let messageBar = MessageBar()
        let parentView:UIView
        if let superview = on{
            parentView = superview
        }else{
            parentView = UIApplication.shared.keyWindow!
        }
        
        parentView.addSubview(messageBar)
        messageBar.translatesAutoresizingMaskIntoConstraints = false
        messageBar.messageBarPosition = position
        messageBar.didHide = didHide
        messageBar.setupSize(style: style)
        messageBar.setupPosition()
        messageBar.setupBackground(backgroundColor: backgroundColor)
        messageBar.setupLabelAndButton(message: message, font: font, imageButtonNormal: imageButtonNormal, messageBarStyle: style, duration:duration, showCloseButton:showCloseButton)
        messageBar.startAnimations(duration:duration)
        return messageBar
    }
    
    func startAnimations(duration:MessageBarDuration){
        guard let superview = self.superview else{
            return
        }
        superview.layoutIfNeeded()
        
        
        self.positionConstraint.constant = 0.0
        UIView.animate(
            withDuration: TimeInterval(0.35),
            delay: TimeInterval(0.0),
            options: [.allowUserInteraction, .curveEaseOut],
            animations: {_ in
                superview.layoutIfNeeded()
        }, completion: {[unowned self] _ in
            if(duration != .infinite){
                self.hideBar(delay:duration.rawValue)
            }
            }
        )
    }
    
    fileprivate func setupBackground(backgroundColor:UIColor){
        self.backgroundColor = backgroundColor
    }
    
    fileprivate func setupPosition(){
        guard let superview = superview else{
            return
        }
        
        if(messageBarPosition == .bottom){
            positionConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: messageBarHeight)
        }else{
            positionConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: -messageBarHeight)
        }
        
        superview.addConstraints([positionConstraint,
                                  NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1.0,constant: 0.0),
                                  NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1.0,constant: 0.0)
            ])
    }
    
    fileprivate func setupSize(style:MessageBarStyle){
        messageBarHeight = messageBarPosition == .top ? (style.rawValue + UIApplication.shared.statusBarFrame.size.height) : style.rawValue
        
        let barHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: messageBarHeight)
        addConstraint(barHeight)
    }
    
    fileprivate func setupLabelAndButton(message:String, font:UIFont, imageButtonNormal:UIImage? = nil, titleButtonNormal:String? = nil, messageBarStyle:MessageBarStyle, duration:MessageBarDuration, showCloseButton:Bool){
        let stackView = UIStackView(frame: CGRect.zero)
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.axis = .horizontal
        
        let statusLabel = UILabel(frame: CGRect.zero)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.numberOfLines = messageBarStyle == .large ? 2 : 1
        statusLabel.font = font
        statusLabel.textAlignment = showCloseButton ? .left : .center
        statusLabel.text = message
        statusLabel.textColor = .white
        
        stackView.addArrangedSubview(statusLabel)
        
        if showCloseButton {
            let closeButton = UIButton(type: .custom)
            if let image = imageButtonNormal{
                closeButton.setImage(image,for: .normal)
            }else{
                closeButton.setTitle(titleButtonNormal ?? "", for: .normal)
            }
            closeButton.addTarget(self, action: #selector(MessageBar.hideBar(delay:)), for: .touchUpInside)
            closeButton.addConstraint(NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal, toItem: closeButton, attribute: .width, multiplier: 1, constant: 0))
            closeButton.layoutIfNeeded()
            stackView.addArrangedSubview(closeButton)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        addConstraints([
            NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 16.0),
            NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: messageBarPosition == .top ? UIApplication.shared.statusBarFrame.size.height : 0.0 )
            ])
        
        layoutIfNeeded()
    }
    
    func hideBar(delay:Double = 0){
        guard let superview = superview else{
            return
        }
        self.positionConstraint.constant = self.messageBarPosition == .bottom ? self.messageBarHeight : -self.messageBarHeight
        UIView.animate(
            withDuration: 0.35,
            delay: TimeInterval(delay),
            options: [.allowUserInteraction, .curveEaseIn],
            animations: { _ in
                superview.layoutIfNeeded()
        }) { [weak self] finished -> Void in
            if let bar = self {
                bar.didHide()
                bar.removeFromSuperview()
            }
        }
    }
}
