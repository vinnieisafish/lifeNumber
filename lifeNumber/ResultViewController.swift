//
//  ResultViewController.swift
//  lifeNumber
//
//  Created by 林盈君 on 2020/8/11.
//  Copyright © 2020 林盈君. All rights reserved.
//

import UIKit   
import WebKit   //在app裡顯示網頁的函式庫

class ResultViewController: UIViewController {

    var birthday:Date!   //第一頁傳遞到第二頁的生日資料
    
    let lifeNumberNames = ["","開創", "協調", "創意", "務實", "自由","關懷", "探究", "權威", "智慧"]   //array由0號開始，所以空字串為0號，其後編號亦為生命靈數
    
    @IBOutlet weak var webview: WKWebView!   //元件webview拉outlet
    
    func calculate(date:Date) -> Int {   //定義計算生命靈數的function
         
         let dateFormatter = DateFormatter()   //型別為DateFormatter
         dateFormatter.dateFormat = "yMd"   //設定日期格式
         var numberString = dateFormatter.string(from: date)   //將日期轉變成字串
         
         var sum = 0   //初值設定
        
        repeat {   //
             sum = 0   //初值
             for character in numberString {   //for in迴圈，為求得到每個數字相加的結果
                 let number = Int(String(character))!   //numberString內字元從字串轉變成整數
                 sum = sum + number   //字元相加
             }
             numberString = "\(sum)"   //得到的總和轉變成字串
         } while sum > 9   //總和必須小於等於9，條件失敗即得到結果
         
         return sum
         
     }

    override func viewDidLoad() {   //剛載入時所顯示的畫面
        
        super.viewDidLoad()   //存取UIViewController的屬性

        let number = calculate(date: birthday)   //屬性number
        title = "\(number) \(lifeNumberNames[number])數"   //顯示在navigating bar上的標題
        
        if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).htm") {   //判斷網址是否存在，並讀出網址內的內容
            let request = URLRequest(url: url)   //產生request
            webview.load(request)   //載入網頁
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
