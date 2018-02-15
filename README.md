# ASViewController

[![CI Status](http://img.shields.io/travis/onmotion/ASViewController.svg?style=flat)](https://travis-ci.org/onmotion/ASViewController)
[![Version](https://img.shields.io/cocoapods/v/ASViewController.svg?style=flat)](http://cocoapods.org/pods/ASViewController)
[![License](https://img.shields.io/cocoapods/l/ASViewController.svg?style=flat)](http://cocoapods.org/pods/ASViewController)
[![Platform](https://img.shields.io/cocoapods/p/ASViewController.svg?style=flat)](http://cocoapods.org/pods/ASViewController)

## Example

![sample](https://github.com/onmotion/ASViewController/blob/captions/Screenshots/2.gif)


## Installation

ASViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ASViewController'
```
* Add import **ASViewController** to your **ViewController**

* Inherit your **ViewController** from **ASViewController** instead **UIASViewController**

* then wrap your view contains text fields into **UIScrollView**, add ```@IBOutlet``` and bind it to ASViewController.scrollView as so:

![sample2](https://github.com/onmotion/ASViewController/blob/captions/Screenshots/1.gif)

* Setup AutoLayout like so:

![1](https://github.com/onmotion/ASViewController/blob/captions/Screenshots/1.png)

![2](https://github.com/onmotion/ASViewController/blob/captions/Screenshots/2.png)


## Author

Alexandr Kozhevnikov, onmotion1@gmail.com

## License

ASViewController is available under the MIT license. See the LICENSE file for more info.
