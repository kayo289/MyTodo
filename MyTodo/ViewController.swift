//
//  ViewController.swift
//  MyTodo
//
//  Created by 菊池華世 on 2020/04/12.
//  Copyright © 2020 kayo. All rights reserved.
//

import UIKit

var TodoData = [String]()

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var myTableView: UITableView!
    
    @IBAction func addTodo(_ sender: Any) {
          var textField = UITextField()

          let alert = UIAlertController(title: "新しいアイテムを追加", message: "", preferredStyle: .alert)

          let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
              // 「リストに追加」を押された時に実行される処理
               TodoData.append(textField.text!)
               textField.text = ""
               UserDefaults.standard.set(TodoData,forKey: "TodoList")
               self.tableView.reloadData()
          }

          alert.addTextField { (alertTextField) in
              alertTextField.placeholder = "新しいアイテム"
              textField = alertTextField
          }

          alert.addAction(action)
          present(alert, animated: true, completion: nil)
    }
    


    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return TodoData.count
    }

    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = TodoData[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoData = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }

    //スワイプしたセルを削除
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         // アイテム削除処理
         TodoData.remove(at: indexPath.row)
         let indexPaths = [indexPath]
         tableView.deleteRows(at: indexPaths, with: .automatic)
     }

}
