//
//  ASViewController.swift
//
//  Created by Alexandr Kozhevnikov on 06/02/2018.
//  Copyright © 2018 Aleksandr Kozhevnikov. All rights reserved.
//
import UIKit

open class ASViewController: UIViewController {
    
    open weak var activeField: UIView? = nil
    open weak var scrollableArea: UIScrollView? = nil
    private var kbFrameSize: CGSize? = nil
    open static var offset = 20
    open static var dismissKeyboardWhenTapAnywhere = false
    
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerForKeyboardNotifications()
        
        if ASViewController.dismissKeyboardWhenTapAnywhere {
            let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tapGestureRecognizer.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeForKeyboardNotifications()
        if ASViewController.dismissKeyboardWhenTapAnywhere {
            let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.removeGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidBeginEditingNotification), name: .UITextViewTextDidBeginEditing, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditingNotification), name: .UITextFieldTextDidBeginEditing, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidEndEditingNotification), name: .UITextViewTextDidEndEditing, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditingNotification), name: .UITextFieldTextDidEndEditing, object: nil)
    }
    
    func removeForKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UITextViewTextDidBeginEditing, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidBeginEditing, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UITextViewTextDidEndEditing, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UITextFieldTextDidEndEditing, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        
        let userInfo = notification.userInfo
        kbFrameSize = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        adjustView()
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        kbFrameSize = nil
    }
    
    func adjustView() {

        guard let scrollView = scrollableArea else{
            return
        }
        
        if let kbFrameSize = kbFrameSize {
            let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbFrameSize.height + CGFloat(ASViewController.offset), 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets

            guard activeField != nil else {
                return
            }
            
            var aRect = scrollView.frame
            aRect.size.height -= kbFrameSize.height
            if (!aRect.contains(activeField!.frame)) {
                scrollView.scrollRectToVisible(activeField!.frame, animated: true)
            }
        } else {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.2, animations: {
                    let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
                    scrollView.contentInset = contentInsets
                    scrollView.scrollIndicatorInsets = contentInsets
                    
                })
            }

        }
    }
    
    @objc func textViewDidBeginEditingNotification(notification: Notification) {
        let textView = notification.object as! UITextView
        activeField = textView;
        adjustView()
    }
    
    @objc func textFieldDidBeginEditingNotification(notification: Notification) {
        let textField = notification.object as! UITextField
        activeField = textField;
    }
    
    @objc func textViewDidEndEditingNotification(notification: Notification) {
        activeField = nil;
        adjustView()
    }
    
    @objc func textFieldDidEndEditingNotification(notification: Notification) {
        activeField = nil;
        adjustView()
    }
    
}
