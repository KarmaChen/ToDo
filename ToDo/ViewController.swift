//
//  ViewController.swift
//  ToDo
//
//  Created by 陈昆涛 on 16/1/8.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

import UIKit

func dateFromString(dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    //全局变量 定义本地运行时的数据库
    static var todos:[TodoModel]?
    @IBAction func UnwindToMain(sender: UIStoryboardSegue)
    {
            
    }

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       ViewController.todos = [
            TodoModel(id: "1", image: "selected-phone", title: "1.约她", date: dateFromString("2015-06-01")!),
            TodoModel(id: "2", image: "selected-child", title: "2.啪啪啪", date: dateFromString("2015-06-02")!),
            TodoModel(id: "3", image: "selected-plane", title: "3.跑路", date: dateFromString("2015-06-03")!),
            TodoModel(id: "4", image: "selected-shopping-cart", title: "4.买奶粉", date: dateFromString("2016-03-15")!)
            
        ]

        navigationItem.leftBarButtonItem = editButtonItem()
    }
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //屏幕显示几行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ViewController.todos!.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //重用
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell")! as UITableViewCell
        let todo: TodoModel
        todo = ViewController.todos![indexPath.row] as TodoModel
        let image = cell.viewWithTag(101) as! UIImageView
        let title = cell.viewWithTag(102) as! UILabel
        let date = cell.viewWithTag(103) as! UILabel
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd" , options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        date.text = dateFormatter.stringFromDate(todo.date)
        return cell

    }
    //删除的功能
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            ViewController.todos!.removeAtIndex(indexPath.row)
            //删除的动画
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    //编辑的功能
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }

}

