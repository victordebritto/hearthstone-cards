//
//  UIView+Extension.swift
//  HearthstoneCards
//
//  Created by Victor Britto e Barros on 31/10/22.
//

import UIKit

fileprivate let overlayViewTag = 999
fileprivate let activityIndicatorViewTag = 1000

extension UIView {
    private var activityIndicatorView: UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = activityIndicatorViewTag
        return view
    }

    private var overlayView: UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0.8
        view.tag = overlayViewTag
        return view
    }

    public func displayActivityIndicator(shouldDisplay: Bool) {
        shouldDisplay ? setActivityIndicatorView() : removeActivityIndicatorView()
    }
    
    private func setActivityIndicatorView() {
        guard !isDisplayingActivityIndicatorOverlay() else { return }
        let overlayView = self.overlayView
        let activityIndicatorView = self.activityIndicatorView

        overlayView.addSubview(activityIndicatorView)
        addSubview(overlayView)
        
        NSLayoutConstraint.activate([
            overlayView.heightAnchor.constraint(equalTo: self.heightAnchor),
            overlayView.widthAnchor.constraint(equalTo: self.widthAnchor),
            activityIndicatorView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor)
        ])
        
        activityIndicatorView.startAnimating()
    }
    
    private func removeActivityIndicatorView() {
        let activityIndicator = getActivityIndicatorView()
        guard let overlayView = getOverlayView() else { return }
        UIView.animate(withDuration: 0.2, animations: {
            overlayView.alpha = 0.0
            activityIndicator?.stopAnimating()
        }) { (finished) in
            activityIndicator?.removeFromSuperview()
            overlayView.removeFromSuperview()
        }
    }
    
    private func isDisplayingActivityIndicatorOverlay() -> Bool {
        getActivityIndicatorView() != nil
        && getOverlayView() != nil
    }
    
    private func getActivityIndicatorView() -> UIActivityIndicatorView? {
        viewWithTag(activityIndicatorViewTag) as? UIActivityIndicatorView
    }
    
    private func getOverlayView() -> UIView? {
        viewWithTag(overlayViewTag)
    }
}

