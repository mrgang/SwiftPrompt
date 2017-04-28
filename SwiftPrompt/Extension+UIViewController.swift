//
//  Extension+UIViewController dic.swift
//  SwiftPrompt
//
//  Created by iOS Developer on 2017/4/28.
//  Copyright © 2017年 mrgang. All rights reserved.
//

import UIKit
extension UIViewController {
    public enum MessageLocation {
        case Top, Center, Bottom
    }
    public func showToast(content msg: String, color: UIColor = .black, size: CGFloat = 13, location type: MessageLocation = .Bottom) {
        let displayLabel = UILabel()
        displayLabel.textColor = color
        displayLabel.textAlignment = .center
        displayLabel.text = msg
        displayLabel.numberOfLines = 0
        displayLabel.font = UIFont.systemFont(ofSize: size)
        view.addSubview(displayLabel)
        view.bringSubview(toFront: displayLabel)
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        var changeConstraint: NSLayoutConstraint!
        switch type {
        case .Top:
            changeConstraint = displayLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: +20)
        case .Center:
            changeConstraint = displayLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        case .Bottom:
            changeConstraint = displayLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        }
        NSLayoutConstraint.activate([
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +20),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            changeConstraint
            ])
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            displayLabel.removeFromSuperview()
        }
    }
    
    func showLoading(msg: String) {
        let loadingView = UIView(frame: CGRect(origin: .zero, size: .zero))
        loadingView.backgroundColor = .red
        let label = UILabel(frame: CGRect.zero)
        loadingView.addSubview(label)
        view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -220),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +20),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: loadingView.topAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: loadingView.leadingAnchor, constant: +20),
            label.trailingAnchor.constraint(equalTo: loadingView.trailingAnchor, constant: -20)
            ])
        label.numberOfLines = 0
        label.text = msg
        view.bringSubview(toFront: loadingView)
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            loadingView.removeFromSuperview()
        }
    }
}
