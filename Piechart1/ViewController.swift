//
//  ViewController.swift
//  Piechart1
//
//  Created by Yuka Uematsu on 2020/06/05.
//  Copyright © 2020 Uematsu Well. All rights reserved.
//
import UIKit

class ViewController:
    UIViewController, UITableViewDelegate,
    UITableViewDataSource, UITextFieldDelegate{
    
    
    @IBOutlet weak var kadai: UILabel!
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var kadaitextField: UITextField!
    @IBOutlet weak var timetextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    //画面遷移しよう
    
    
    var kadaitextArray = [String]()
    var timetextArray = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //UITextFieldクラスのインスタンスであるinputTextのdelegateプロパティにViewControllerのインスタンスを渡している
        tableView.delegate = self
        tableView.dataSource = self
        kadaitextField.delegate = self
        timetextField.delegate = self
    }
    
    // TableViewに表示するセルの数を返す
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return kadaitextArray.count
}
//セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    //cellを作る
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell =
                //cellの再利用,
                tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            //indexPathの変数row
            cell.textLabel?.text = kadaitextArray[indexPath.row]
            return cell
    }
    //nextVCで画面遷移、値の受け渡しをする
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC =
            storyboard?.instantiateViewController(identifier: "next")
                as!PiechartViewController
        
        
        //kadaiStringの値
        nextVC.kadaiString = kadaitextArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
        //timeStringの値
        nextVC.timeString = timetextArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    //TableViewのcellの高さ、12
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/12
        
    }
    //課題キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        kadaitextArray.append(textField.text!)
        kadaitextField.resignFirstResponder()
        kadaitextField.text = ""
        tableView.reloadData()
        
      return true
    }
    //時間キーボードを閉じる
    func timetextFieldShouldReturn(_ textField: UITextField) -> Bool {
           timetextArray.append(textField.text!)
           timetextField.resignFirstResponder()
           timetextField.text = ""
           tableView.reloadData()
           
         return true
    
}
}
//userdefaults!!!
