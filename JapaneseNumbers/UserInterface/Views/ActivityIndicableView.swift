//
//  ActivityIndicableView.swift
//  JapaneseNumbers
//
//  Created by Marcin Rainka on 24/06/2018.
//  Copyright © 2018 Marcin Rainka. All rights reserved.
//

import UIKit

protocol ActivityIndicableView {

    var activityIndicatorView: UIActivityIndicatorView! { get }
}

extension ActivityIndicableView {

    func makeConstraintsForActivityIndicatorView() {
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([.centerX, .centerY].map {
            .init(
                item: activityIndicatorView,
                attribute: $0,
                relatedBy: .equal,
                toItem: activityIndicatorView.superview,
                attribute: $0,
                multiplier: 1,
                constant: 0)
        })
    }

    // MARK: - Starting and Stopping Indicating Activity

    func startIndicatingActivity() {
        activityIndicatorView.startAnimating()
    }

    func stopIndicatingActivity() {
        activityIndicatorView.stopAnimating()
    }
}

extension ActivityIndicableView where Self: CustomViewContainer, Self.CustomViewType: ActivityIndicableView {

    weak var activityIndicatorView: UIActivityIndicatorView! { return customView.activityIndicatorView }

    // MARK: - Starting and Stopping Indicating Activity

    func startIndicatingActivity() {
        customView.startIndicatingActivity()
    }

    func stopIndicatingActivity() {
        customView.stopIndicatingActivity()
    }
}

extension ActivityIndicableView where Self: UIView {

    func addActivityIndicatorView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.color = .gray
        addSubview(activityIndicatorView)
        return activityIndicatorView
    }
}
