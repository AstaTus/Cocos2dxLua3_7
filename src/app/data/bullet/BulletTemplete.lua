local BulletTemplete = class("BulletTemplete")

--���ٶ�
BulletTemplete.id_ = 0
BulletTemplete.srcSpeed_ = 0

BulletTemplete.res_ = ""
BulletTemplete.damage_ = 0

BulletTemplete.density_ = 0     --�ܶ�
BulletTemplete.restitution_ = 0 --����
BulletTemplete.friction_ = 0    --Ħ������


--Ħ�����ع�ʽ  ��������֮���u ȡĦ��������С���Ǹ���ΪĦ������[0, 1]
BulletTemplete.u_ = 0

return BulletTemplete