//
//  PiechartViewController.swift
//  Piechart1
//
//  Created by Yuka Uematsu on 2020/06/07.
//  Copyright © 2020 Uematsu Well. All rights reserved.
//

import UIKit
import Charts

class PiechartViewController: UIViewController {
    var kadaiString = String()
    var timeString = String()
    @IBOutlet weak var kadailabel: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var pieChartsView: PieChartView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        kadailabel.text = kadaiString
        timelabel.text = timeString
        
        self.pieChartsView.centerText = "合計時間"
               
               // グラフに表示するデータのタイトルと値
               let dataEntries = [
                   PieChartDataEntry(value: 5, label: "国語"),
                   PieChartDataEntry(value: 4, label: "数学"),
                   PieChartDataEntry(value: 3, label: "英語")
               ]
               
        let dataSet = PieChartDataSet(entries: dataEntries, label: "合計時間")

               // グラフの色
               dataSet.colors = ChartColorTemplates.vordiplom()
               // グラフのデータの値の色
               dataSet.valueTextColor = UIColor.black
               // グラフのデータのタイトルの色
               dataSet.entryLabelColor = UIColor.black

               self.pieChartsView.data = PieChartData(dataSet: dataSet)
               
               // データを％表示にする!!
               let formatter = NumberFormatter()
               formatter.numberStyle = .percent
               formatter.maximumFractionDigits = 2
               formatter.multiplier = 1.0
               self.pieChartsView.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
               self.pieChartsView.usePercentValuesEnabled = true
               
               view.addSubview(self.pieChartsView)
           }
    }
    


    
    
