//
//  ToDoModle.swift
//  ToDo
//
//  Created by 陈昆涛 on 16/1/8.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: NSDate
    //调用的是指针 在别的类引用时可以修改属性
    init(id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }

}
//把内存放在栈里面 调用的是实体 修改的结果会指向不同的内存
struct ToDoModle2 {
    var id: String
    var image: String
    var title: String
    var date: NSDate
}

