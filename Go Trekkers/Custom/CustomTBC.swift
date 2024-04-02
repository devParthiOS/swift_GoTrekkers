//
//  CustomTBC.swift
//  Go Trekkers
//
//  Created by Parth Patel on 01/04/24.
//

import UIKit

class CustomTBC: UITabBarController {

    // MARK: - Customization Properties
    
    
    var tabBarBackgroundColor: UIColor? {
        didSet {
            tabBar.barTintColor = tabBarBackgroundColor
        }
    }
    
    var selectedItemColor: UIColor? {
        didSet {
            tabBar.tintColor = selectedItemColor
        }
    }
    
    var unselectedItemColor: UIColor? {
        didSet {
            if let unselectedItemColor = unselectedItemColor {
                tabBar.unselectedItemTintColor = unselectedItemColor
            }
        }
    }
    
    
    var cornerRadius: CGFloat = 8.0 {
        didSet {
            if UIDevice.current.userInterfaceIdiom != .phone || UIScreen.main.nativeBounds.height != 1334 && UIScreen.main.nativeBounds.height != 1920 {
                // Not iPhone 8 and 8 Plus
                tabBar.layer.cornerRadius = cornerRadius
                        tabBar.layer.masksToBounds = true
            }
            else {
                let maskPath = UIBezierPath(roundedRect: tabBar.bounds,
                                            byRoundingCorners: [.topLeft, .topRight],
                                            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
                let maskLayer = CAShapeLayer()
                maskLayer.path = maskPath.cgPath
                tabBar.layer.mask = maskLayer
            }
           
        }
    }

    
    // Add more customization properties as needed
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Apply default customization
        setupDefaultAppearance()
    }
    
    // MARK: - Customization Methods
    
    private func setupDefaultAppearance() {
        // Set default background color, selected/unselected item colors, etc.
//        tabBarBackgroundColor = .yourDefaultBackgroundColor
        selectedItemColor = #colorLiteral(red: 0.03500000015, green: 0.1490000039, blue: 0.2080000043, alpha: 1)
        unselectedItemColor = #colorLiteral(red: 0.1901342613, green: 0.4327353134, blue: 0.1881176681, alpha: 1)
        cornerRadius = 30.0
        
        // Add more default customizations as needed
    }
    
    // Add more customization methods as needed
    

    
}
