# BulletGraph
R implementation of a bullet graph

A bullet graph is a variation of a bar graph developed by Stephen Few.  You can view as a replacement for dashboard gauges and meters. These gauges often consume a lot of real estate on the screen just to display a single numeric quantity. Bullet gauge solves the problem nicely, as it is space efficient. it is easy to pack a lot of them in a dashboard. It comes with a simple bar to represent your main quantity, along with a background field that represents 2 or 3 numbers like minimum, maximum and the expected range for your parameter. More details can be had from the Wiki page
https://en.wikipedia.org/wiki/Bullet_graph
The design specification are at
http://www.perceptualedge.com/articles/misc/Bullet_Graph_Design_Spec.pdf
You can even painstakingly create them in Microsoft XL:
http://www.exceluser.com/explore/bullet.htm

Some commercial data visualization packages have started including a bullet graph, but these are relatively few. Here is a quick and dirty implementation of a bullet graph in R. While an adult bullet graph will have its own axis ticks, our version sacrifices this flexibility for the sake of simplicity: It is just about 3 lines of R code !
