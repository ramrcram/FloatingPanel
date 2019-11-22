//
//  ViewController.swift
//  MiddleView
//
//  Created by Ramesh R C on 21.11.19.
//  Copyright © 2019 Ramesh R C. All rights reserved.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController,FloatingPanelControllerDelegate {
    
    var fpc: FloatingPanelController!
    var listVC: ListController!
    var middleVC: MiddleViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize FloatingPanelController
        fpc = FloatingPanelController(isIncludeMiddleView: true)
        fpc.delegate = self

        // Initialize FloatingPanelController and add the view
        fpc.surfaceView.backgroundColor = UIColor(displayP3Red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        fpc.surfaceView.cornerRadius = 24.0
        fpc.surfaceView.shadowHidden = true
        fpc.surfaceView.borderWidth = 1.0 / traitCollection.displayScale
        fpc.surfaceView.borderColor = UIColor.black.withAlphaComponent(0.2)

        listVC = storyboard?.instantiateViewController(withIdentifier: "List") as? ListController
        middleVC = storyboard?.instantiateViewController(withIdentifier: "Middle") as? MiddleViewController

        // Set a content view controller
        fpc.set(contentViewController: listVC, middleContentViewController: middleVC)
//        fpc.set(contentViewController: listVC)
        fpc.addPanel(toParent: self, belowView: nil, animated: false)
        
    }

}



class ListController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
}


class MiddleViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
}
