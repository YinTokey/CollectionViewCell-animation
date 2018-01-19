# CollectionViewCell-animation

![](http://image18-c.poco.cn/mypoco/myphoto/20160521/20/17914753420160521200730070_640.jpg?310x552_110) ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194155029_640.jpg?310x556_110) ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194217069_640.jpg?308x558_110)
![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194234078_640.jpg?306x558_110)
![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/1791475342016052119424909_640.jpg?300x530_110)  ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194312075_640.jpg?306x552_110)
![](http://image18-c.poco.cn/mypoco/myphoto/20160521/19/17914753420160521194327083_640.jpg?310x558_110) ![](http://image18-c.poco.cn/mypoco/myphoto/20160521/20/17914753420160521202010073_640.jpg?312x554_110)

# What is it?

Delete UICollectionViewCell with Animations.I used CoreAnimation to realize its function.

# How to operate this demo?

Long press cells,until cells  vibrate,click the delete button then you can delete the cell what you want.Double click screen can make all cell to normal status.

# How to add it into your project?

1.Drag YTAnimation.h, YTAnimation.m to your project.It is a tool class.

2.Copy those codes to your cell   .h file.

![](http://img.blog.csdn.net/20160521192508379)

3.Copy my codes in Cell.m to your cell  .m file,you should pay attention to the following picture.

![](http://img.blog.csdn.net/20160523154735128)

4.Add those codes to your CollectionViewController

![](http://img.blog.csdn.net/20160523154856411)

![](http://img.blog.csdn.net/20160523154953508)



# 概述

使用了核心动画里的转场动画和动画组来实现。

# Demo操作

长按cell,出现抖动状态，然后点击左上角叉叉按钮即可删除Cell。双击屏幕即可恢复到原来装态。

# 如何应用到自己项目中

   1.首先将YTAnimation.h , YTAnimation.m两个文件拖入你的项目中，它相当于是一个工具类。
   
   2.在你的自定义UICollectionViewCell 的 .h文件里，添加图中标出的协议声明和属性。
   
   ![](http://img.blog.csdn.net/20160521192508379)
  
   3.在你的自定义的UICollectionViewCell 的 .m文件里，将我Cell.m 文件里方法实现部分黏贴进去。这里要注意，在方法addDeleteButton方法里用到了一张图片，那张图片在我工程里的Assets.xcassets，不要忘了。如果你已经有实现方法 - (instancetype)initWithCoder:(NSCoder *)aDecoder 那么把这两个方法的调用加到你自己的 inintWithCoder的相应位置。 
   
   ![](http://img.blog.csdn.net/20160523154735128)
  
  按照图中说明，调用动画类，选择动画类型。
  
   4.UICollectionView控制器里： 加入如图画圈部分 （注：我这里的控制器直接使用UICollectionViewController, 而不是在UIViewController里拖入 UICollectionView控件）。 
   
![](http://img.blog.csdn.net/20160523154856411)
   
   至于那个sourceArr是我的数据源，你需要用你自己的数据源去处理。那两个BOOL变量是用来使cell长按抖动和左上角出现叉叉按钮用的。
 
   剩下的按照图中说明即可。
   
   ![](http://img.blog.csdn.net/20160523154953508)
