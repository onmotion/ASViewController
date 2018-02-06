//
//  ASViewController.swift
//
//  Created by Alexandr Kozhevnikov on 06/02/2018.
//  Copyright © 2018 Aleksandr Kozhevnikov. All rights reserved.
//
import UIKit

open class ASViewController: UIViewController {
    
    var activeField: UITextField? = nil
    open static var scrollView: UIScrollView? = nil
    open static var offset = 20
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
    }
    
    deinit {
        removeForKeyboardNotifications()
    }
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeForKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let scrollView = ASViewController.scrollView else{
            return
        }
        
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbFrameSize.height + CGFloat(ASViewController.offset), 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect = scrollView.frame
        aRect.size.height -= kbFrameSize.height
        
        guard activeField != nil else {
            return
        }
        if (!aRect.contains(activeField!.frame.origin)) {
            scrollView.scrollRectToVisible(activeField!.frame, animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        guard let scrollView = ASViewController.scrollView else{
            return
        }
        
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField;
        return true
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil;
    }
}
