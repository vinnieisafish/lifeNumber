//
//  BirthdayViewController.swift
//  lifeNumber
//
//  Created by 林盈君 on 2020/8/11.
//  Copyright © 2020 林盈君. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {

    @IBOutlet weak var datepicker: UIDatePicker!   //元件date picker拉outlet
    
    override func viewDidLoad() {   //剛載入時所顯示的畫面
        super.viewDidLoad()   //存取UIViewController的屬性
    }
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {   //把資料從第一頁傳到第二頁

        let controller = ResultViewController(coder: coder)       //透過coder建立從storyboard設計的controller，包含了建立controller畫面需要的內容
        controller?.birthday = datepicker.date   //將第一頁選擇的時間存到第二頁的屬性birthday
        return controller   //回傳controller
        
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
