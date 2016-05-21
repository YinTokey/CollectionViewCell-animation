# CollectionViewCell-animation

![](http://image18-c.poco.cn/mypoco/myphoto/20160521/20/17914753420160521200730070_640.jpg?310x552_110) ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194155029_640.jpg?310x556_110) ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194217069_640.jpg?308x558_110)
![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194234078_640.jpg?306x558_110)

![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/1791475342016052119424909_640.jpg?300x530_110)  ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194312075_640.jpg?306x552_110)

![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194327083_640.jpg?310x558_110) ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/20/17914753420160521202010073_640.jpg?312x554_110)

概述
      使用了核心动画里的转场动画和动画组来实现，并将这些动画封装成类，直接调用类方法，参数是被加入动画的那个view（或UIView的子类），就可以实现指定view的动画了。本篇的view指的都是UICollectionViewCell。

Demo操作
  长按cell,出现抖动状态，然后点击左上角叉叉按钮即可删除Cell。双击屏幕即可恢复到原来装态。

如何应用到自己项目中
   1.首先将YTAnimation.h , YTAnimation.m两个文件拖入你的项目中，它相当于是一个工具类。
   2.在你的自定义UICollectionViewCell 的 .h文件里，添加图中标出的协议声明和属性
   ![](http://img.blog.csdn.net/20160521192508379)
  
   3.在你的自定义的UICollectionViewCell 的 .m文件里，将我Cell.m 文件里方法实现部分黏贴进去。这里要注意，在方法addDeleteButton方法里用到了一张图片，那张图片在我工程里的Assets.xcassets，不要忘了。如果你已经有实现方法 - (instancetype)initWithCoder:(NSCoder *)aDecoder 那么把这两个方法的调用加到你自己的 inintWithCoder的相应位置。 
   ![](http://img.blog.csdn.net/20160521192533907)
  
   4.UICollectionView控制器里： 加入如图画圈部分 （注：我这里的控制器直接使用UICollectionViewController, 而不是在UIViewController里拖入 UICollectionView控件）。 
   ![](http://img.blog.csdn.net/20160521192626299)
   至于那个sourceArr是我的数据源，你需要用你自己的数据源去处理。那两个BOOL变量是用来使cell长按抖动和左上角出现叉叉按钮用的。
 
   5.在你的代理方法 cellForItemAtIndexPath中加入这部分，它可以使长按时，所有cell都呈现抖动状态，双击时，移除动画，恢复原样。 
   ![](http://img.blog.csdn.net/20160521192803083)
 
   6.最关键的部分，删除操作看图中注释。这里解释一下图中画圈部分，也就是动画相关。调用类方法YTAnimation来实现删除动画。想使用其它类型的删除动画，把圈中第三行fadeAnimation改成其它动画即可，一共8中动画，具体参照YTAnimation.h。如果要使用第8个类方法 toMiniAnimation,则把圈中前两行代码注释掉 (cell.imgView.image = nil cell.deleteBtn.hidden = YES ),因为这两行是隐藏掉cell的内容，避免转场动画的重叠效果（前7个动画都是转场动画，所有要这两行代码）。如果你的cell还有其它内容，也需要做类似的处理。 
   ![](http://img.blog.csdn.net/20160521192923398)
 
   7.最后，这4个方法，直接复制黏贴就好了。
   ![](http://img.blog.csdn.net/20160521193028053)
