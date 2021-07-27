//
//  ViewController.swift
//  UIViewDemo
//
//  Created by 季勤强 on 2021/7/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test1()
        test2()
        
        test3()
        
    }
    
    func test1() {
        let view1 = UIView()
        view1.backgroundColor = .red
        view1.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        view2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view1.addSubview(view2)
        
        print(view1.frame, view1.bounds, view2.bounds, view2.frame, view2.center, view1.center)
    }
    
    func test2() {
        
        // 将bounds的原点改为（20， 20）后，那么原来的原点相较于现在的原点就应该是往右上角偏移的。
        let view1 = UIView()
        view1.backgroundColor = .red
        view1.frame = CGRect(x: 100, y: 250, width: 100, height: 100)
        view1.bounds = CGRect(x: 20, y: 20, width: 100, height: 100)
        view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        view2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view1.addSubview(view2)
        
        print(view1.frame, view1.bounds, view2.bounds, view2.frame, view2.center, view1.center)
    }
    
    func test3() {
        
        let view1 = UIView()
        view1.backgroundColor = .red
        view1.frame = CGRect(x: 100, y: 400, width: 100, height: 100)
        view1.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        view2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view1.addSubview(view2)
        
        view1.transform = view1.transform.scaledBy(x: 2, y: 2)
        
        print(view1.frame, view1.bounds, view2.bounds, view2.frame, view2.center, view1.center)
        
    }

}

