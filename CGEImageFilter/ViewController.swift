//
//  ViewController.swift
//  CGEImageFilter
//
//  Created by Harold on 06/06/2018.
//  Copyright © 2018 My Company. All rights reserved.
//

import UIKit
import cge

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    applyFilters()
  }
  
  private func applyFilters() {
    let configurations = [
      "@curve R(0, 0)(58, 94)(137, 160)(255, 255)G(0, 0)(57, 95)(149, 184)(255, 255)B(0, 0)(102, 47)(149, 165)(255, 255)RGB(0, 0)(175, 84)(255, 255)",
      "@adjust monochrome 0 0 0 0 0 0",
      "@vignette 0 0.8",
      "@adjust level 0.48 0.77 0.48",
      "@adjust level 0.28 0.77 0.68"]
    
    let image = UIImage(named: "Dog")
    
    configurations.forEach { configuration in
      DispatchQueue.global(qos: .default).async {
        let resultImage = cgeFilterUIImage_MultipleEffects(image, configuration, 1.0, nil)
        DispatchQueue.main.async {
          print(resultImage)
        }
      }
    }
  }

}

