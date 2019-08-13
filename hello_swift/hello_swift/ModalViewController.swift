//
//  ModalViewController.swift
//  hello_swift
//
//  Created by 浜村純 on 2019/08/13.
//  Copyright © 2019 Jun Hamamura. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "modal page"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, // アイコンの名前
                                                            target: self, //どこにいるメソッド
                                                            action: #selector(close)) //objective-cのメソッドのポインタ
        // Do any additional setup after loading the view.
    }
    
    @objc func close() {
        print("close")
        dismiss(animated: true, completion: nil) // モーダルを閉じる
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
