import UIKit

class ViewController: UIViewController {

    var myMoney: Int = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpData1()
//        setUpData2()
        setupData3()
    }
    
//    private func setUpData1() {
//        ascendingNumber()
//        descendingNumber()
//    }
//
//    private func setUpData2() {
//        DispatchQueue.global(qos: .userInitiated).async {
//            self.ascendingNumber()
//        }
//        DispatchQueue.global(qos: .userInitiated).async {
//            self.descendingNumber()
//        }
//
//    }
    
    private func setupData3() {
        
        // 첫 번째 출금 : 맥북
        DispatchQueue.global(qos: .userInteractive).sync {
            var currentMoney = self.myMoney
            currentMoney -= 150
            usleep(1000000)
            self.myMoney = currentMoney
        }
        
        // 두 번째 출금 : 월세
        DispatchQueue.global(qos: .userInteractive).sync {
            var currentMoney = self.myMoney
            currentMoney -= 70
            self.myMoney = currentMoney
        }
    
        print("DEBUG>> 현재 잔액 : \(self.myMoney) ")
        if self.myMoney < 0 {
            print("DEBUG>> 집에서 쫓겨났습니다. ")
            
        } else {
            print("DEBUG>> 집에서 쫓겨나지 않았습니다. ")
        }
    }
    
//    //0에서 100까지 순차적으로 숫자과 방향 이모티콘을 출력해주는 함수
//    private func ascendingNumber() {
//        for i in 0...100 {
//            print("🔺",i)
//            usleep(50000)
//        }
//    }
//
//    //100에서 0까지 순차적으로 숫자과 방향 이모티콘을 출력해주는 함수
//    private func descendingNumber() {
//        for i in (0...100).reversed() {
//            print("🔻",i)
//            usleep(50000)
//        }
//    }
    
    
    

}

