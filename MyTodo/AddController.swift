//
//  AddController.swift
//  MyTodo
//
//  Created by 菊池華世 on 2020/04/12.
//  Copyright © 2020 kayo. All rights reserved.
//

import UIKit

//var TodoData = [String]()

class AddController: UIViewController {

    @IBOutlet weak var TodoTextField: UITextField!

    @IBAction func TodoAddButton(_ sender: Any) {
        //変数に入力内容を入れる
        TodoData.append(TodoTextField.text!)
        TodoTextField.text = ""
        UserDefaults.standard.set(TodoData,forKey: "TodoList")
    }

    @IBAction func addData(_ sender: Any) {
        // プラスボタンが押された時に実行される処理
          var textField = UITextField()

          let alert = UIAlertController(title: "新しいアイテムを追加", message: "", preferredStyle: .alert)

          let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
              // 「リストに追加」を押された時に実行される処理

               TodoData.append(textField.text!)
               textField.text = ""
          }

          alert.addTextField { (alertTextField) in
              alertTextField.placeholder = "新しいアイテム"
              textField = alertTextField
          }

          alert.addAction(action)
          present(alert, animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
