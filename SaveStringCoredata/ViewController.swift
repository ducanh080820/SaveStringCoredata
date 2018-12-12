//
//  ViewController.swift
//  SaveStringCoredata
//
//  Created by Duc Anh on 11/26/18.
//  Copyright © 2018 Duc Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let entity = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
            textField.text = entity?.last?.string
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func saveString(_ sender: UIBarButtonItem) {
        guard textField.text != "" else {return}
        let context = Entity(context: AppDelegate.context)
        context.string = textField.text
        AppDelegate.saveContext()
    }
    

}

