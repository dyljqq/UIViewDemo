# UIView的Frame & Bounds之间的关系

[demo]()

我们可以把frame理解成浮在bounds上的rect。

frame: 以父View为坐标系
bounds： 以自身为坐标系

看下面的例子:

1. 最为平常的代码:

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
	    
这里我门创建了两个View，view1为view2的子视图。布局与我们想象的一样。

然后神奇的点就来了，看下面的代码:

2. 修改view1的bounds:

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
	    
这个时候，view2的原点往右上角偏移了(20, 20)，为什么会往右上角偏移呢，我是这么理解的。因为view2是以view1为坐标的，那么当view1的bounds往下偏移的时候，view2其实还是以（0，0）为原点，因此相对的，就应该是往右上角。我也知道有点绕，但是应该是这么解释吧。有更好的解释方法，欢迎交流。

3. 对view1做transform, 放大2倍

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
	    
执行后，frame变为了：(50.0, 350.0, 200.0, 200.0)， bounds不变。因此是存在bounds与frame的size不想等的情况的（今天的面试题，可太为难我了。）