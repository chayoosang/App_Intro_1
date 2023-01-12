//
//  ViewController.swift
//  App_Intro_1
//
//  Created by 유상 on 2023/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    @IBAction func loadImage(_ sender: Any) {
        // https://picsum.photos/1000
        
        UIView.animate(withDuration: 5) {
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
        }
        
        
        guard let url = URL(string: "https://picsum.photos/1000") else{
            return
        }

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }

            let image = UIImage(data: data)

            image?.prepareThumbnail(of: CGSize(width: 100, height: 100), completionHandler: { image in

                DispatchQueue.main.async {
                    self.imageView.image = image
                }

            })
        }
        
      
    
    }
    
}

