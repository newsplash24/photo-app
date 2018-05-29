//
//  LoadingView.swift
//  Photo App
//
//  Created by Mohamed Hamed on 5/29/18.
//  Copyright © 2018 Mohamed Hamed. All rights reserved.
//

import UIKit
import Foundation
import NVActivityIndicatorView


class LoadingView {
    
    static var instance = LoadingView()
    
    private let activityData = ActivityData()
    
    private init() {
        
    }
    
    /**
     Show loading indicator
     */
    func showLoading(){
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(self.activityData)
        }
        
        //        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        //        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
        //        PKHUD.sharedHUD.show()
    }
    
    func showLoadingWithMessage(message: String) {
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(self.activityData)
            NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
        }
        
        //        PKHUD.sharedHUD.contentView = PKHUDTextView(text: message)
        //        PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = false
        //        PKHUD.sharedHUD.show()
    }
    
    /**
     Hide loading indicator
     */
    func dismissLoading() {
        
        DispatchQueue.main.async {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
        
        //        PKHUD.sharedHUD.hide(animated: true, completion: nil)
    }
}
