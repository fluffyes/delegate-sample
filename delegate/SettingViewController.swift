//
//  SettingViewController.swift
//  delegate
//
//  Created by Soul on 19/05/2018.
//  Copyright © 2018 Fluffy. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, DeviceViewControllerDelegate {

	@IBOutlet weak var deviceLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.deviceLabel.text = "<Please select>"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	// MARK: - IBActions
	
	@IBAction func selectDeviceTapped(_ sender: Any) {
		
		self.performSegue(withIdentifier: "SettingToDevice", sender: self)
	}
	
	
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		
		if(segue.identifier == "SettingToDevice"){
			let deviceViewController = segue.destination as! DeviceViewController
			
			// set SettingViewController as DeviceViewController delegate
			// so that DeviceViewController can call SettingViewController's function.
			deviceViewController.delegate = self
		}
    }
	
	// MARK: - Device View Controller Delegate
	// DeviceViewController will call this function using delegate.deviceViewController( ...
	func deviceViewController(_ deviceViewController: DeviceViewController, deviceSelected device: String) {
		self.deviceLabel.text = device
	}
	

}
