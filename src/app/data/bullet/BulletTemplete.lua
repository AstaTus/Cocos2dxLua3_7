local BulletTemplete = class("BulletTemplete")

--初速度
BulletTemplete.id_ = 0
BulletTemplete.srcSpeed_ = 0

BulletTemplete.res_ = ""
BulletTemplete.damage_ = 0

--摩擦因素公式  两个物体之间的u 取摩擦因素最小的那个作为摩擦因素[0, 1]
BulletTemplete.u_ = 0

return BulletTemplete