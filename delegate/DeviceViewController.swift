//
//  DeviceViewController.swift
//  delegate
//
//  Created by Soul on 19/05/2018.
//  Copyright © 2018 Fluffy. All rights reserved.
//

import UIKit

// the delegate of device view controller can be another view controller

// You will need to include "@objc" for the protocol if you want to include optional method
@objc protocol DeviceViewControllerDelegate: AnyObject {
	// need to include "@objc" for optional function too
	@objc optional func deviceViewController(_ deviceViewController: DeviceViewController, deviceSelected device: String) -> Void
}

class DeviceViewController: UIViewController {
	
	@IBOutlet weak var iPhoneView: UIView!
	@IBOutlet weak var iPadView: UIView!
	@IBOutlet weak var simulatorView: UIView!
	
	weak var delegate: DeviceViewControllerDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		self.iPhoneView.layer.borderWidth = 1.0
		self.iPhoneView.layer.borderColor = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0).cgColor
		
		self.iPadView.layer.borderWidth = 1.0
		self.iPadView.layer.borderColor = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0).cgColor
		
		self.simulatorView.layer.borderWidth = 1.0
		self.simulatorView.layer.borderColor = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0).cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	// MARK: - IBActions

	@IBAction func iPhoneButtonTapped(_ sender: Any) {
		// delegate (setting view controller) will call the method 'deviceViewcontroller(deviceViewController : DeviceViewController, deviceSelected: String)' located inside itself if the delegate is not nil and the delegate has implemented this method
		delegate?.deviceViewController?(self, deviceSelected: "iPhone")
		
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func iPadButtonTapped(_ sender: Any) {
		// this is equivalent to calling
		// SettingViewController.deviceViewController(self, deviceSelected: "iPad")
		delegate?.deviceViewController?(self, deviceSelected: "iPad")
		
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func simulatorButtonTapped(_ sender: Any) {
		delegate?.deviceViewController?(self, deviceSelected: "Simulator")
		
		dismiss(animated: true, completion: nil)
	}
	
}
