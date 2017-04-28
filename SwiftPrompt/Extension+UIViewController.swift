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
    
    public func indicatorWith(title msg: String) {
        let loadingView = UIView(frame: CGRect(origin: .zero, size: .zero))
        loadingView.backgroundColor = .lightGray
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicator.startAnimating()
        indicator.tintColor = .blue
        let label = UILabel(frame: CGRect.zero)
        loadingView.addSubview(indicator)
        loadingView.addSubview(label)
        view.addSubview(loadingView)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: loadingView.leadingAnchor, constant: +20),
            label.trailingAnchor.constraint(equalTo: loadingView.trailingAnchor, constant: -20),
            indicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            indicator.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10),
            indicator.topAnchor.constraint(equalTo: loadingView.topAnchor, constant: 10)
            ])
        label.numberOfLines = 1
        label.text = msg
        label.textAlignment = .center
        view.bringSubview(toFront: loadingView)
        loadingView.layer.cornerRadius = 10
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            loadingView.removeFromSuperview()
        }
    }
}
