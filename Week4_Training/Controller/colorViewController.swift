//
//  colorViewController.swift
//  Week4_Training
//
//  Created by 준수김 on 2021/10/03.
//

import UIKit

class colorViewController: UIViewController {
    
    //MARK: - Prperty
    
    let colorArr: [UIColor] = [.red,
                               .orange,
                               .yellow,
                               .green,
                               .blue,
                               .purple]
    var count1 = 0
    var count2 = 0
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor02()
    }
    
    // 1 DisPatchQueue.main 이 없는 경우
    private func setupColor01() {
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in (0...100) {
                
                self.firstView.backgroundColor = self.colorArr.randomElement()
                self.firstLabel.text = "\(self.count1)회 색깔 출력중"
                self.firstLabel.sizeToFit()
                self.count1 += 1
                usleep(100000)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in (0...100) {
                
                self.secondView.backgroundColor = self.colorArr.randomElement()
                self.secondLabel.text = "\(self.count2)회 색깔 출력중"
                self.secondLabel.sizeToFit()
                self.count2 += 1
                usleep(100000)
            }
        }
    }
    
    
    // 2 DisPatchQueue.main 을 적용한 경우
    private func setupColor02() {
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in (0...100) {
                
                DispatchQueue.main.async {
                    self.firstView.backgroundColor = self.colorArr.randomElement()
                    self.firstLabel.text = "\(self.count1)회 색깔 출력중"
                    self.firstLabel.sizeToFit()
                    self.count1 += 1
                }
                usleep(1000000)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            for _ in (0...100) {
                
                DispatchQueue.main.async {
                    self.secondView.backgroundColor = self.colorArr.randomElement()
                    self.secondLabel.text = "\(self.count2)회 색깔 출력중"
                    self.secondLabel.sizeToFit()
                    self.count2 += 1
               
                }
                usleep(1000000)
            }
        }
    }

    

}
