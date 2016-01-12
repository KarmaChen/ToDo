//
//  DetailViewController.swift
//  ToDo
//
//  Created by 陈昆涛 on 16/1/9.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var shoppingCartButton: UIButton!
    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    //有可能为空 所以定义成一个optional
    var todo : TodoModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        todoItem.delegate = self
        if todo == nil {
            navigationItem.title = "Add"
            print("todo to edit is nil")
        }
        else {
            navigationItem.title = "Edit"
            let selectedImage = todo?.image
            switch selectedImage! {
            case "selected-child":
                childButton.selected = true
            case "selected-phone":
                phoneButton.selected = true
            case "selected-plane":
                travelButton.selected = true
            case "selected-shopping-cart":
                shoppingCartButton.selected = true
            default: break
            }
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func resetButtons() {
        childButton.selected = false
        phoneButton.selected = false
        travelButton.selected = false
        shoppingCartButton.selected = false
    }
    
    @IBAction func childTapped(sender: AnyObject) {
        resetButtons()
        childButton.selected = true
    }
    @IBAction func phoneTapped(sender: AnyObject) {
        resetButtons()
        phoneButton.selected = true
    }
    @IBAction func travelTapped(sender: AnyObject) {
        resetButtons()
        travelButton.selected = true
    }
    @IBAction func shoppingCartTapped(sender: AnyObject) {
        resetButtons()
        shoppingCartButton.selected = true
    }
    @IBAction func okTapped(sender: AnyObject) {
//        var image = ""
//        if childButton.selected{
//            image = "child-selected"
//        }
//        else if travelButton.selected{
//            image = "travel-selected"
//        }
//
//        else if phoneButton.selected{
//            image = "phone-selected"
//        }
//
//        else if shoppingCartButton.selected{
//            image = "shoppingCart-selected"
//        }
//        let uuid = NSUUID().UUIDString
//        let todo = TodoModel(id: uuid, image: image, title: todoItem.text!, date: todoDate.date)
//        todos.append(todo)
//        
//        
        var image = ""
        if "" == image {
            image = "selected-child"
        }else if travelButton.selected{
            image = "travel-selected"
        }
            
        else if phoneButton.selected{
            image = "phone-selected"
        }
            
        else if shoppingCartButton.selected{
            image = "shoppingCart-selected"
        }

        if todo == nil {
            let uuid = NSUUID().UUIDString
           
            todo = TodoModel(id: uuid, image: image, title: todoItem.text!,
                date: todoDate.date)
            ViewController.todos!.append(todo!)
            

        }else {
            todo?.image = image
            todo?.title = todoItem.text!
            todo?.date = todoDate.date
        }
    }
    //按return键盘消失
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //任意一个位置 键盘小消失
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        todoItem.resignFirstResponder()
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return editing
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let todo = ViewController.todos!.removeAtIndex(sourceIndexPath.row)
        ViewController.todos!.insert(todo, atIndex: destinationIndexPath.row)
    }

    

    

}

