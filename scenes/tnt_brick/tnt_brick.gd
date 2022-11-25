extends StaticBody2D

func queue_free():
	for node in $ExplosionZone.get_overlapping_bodies():
		if node != self && node.is_in_group("Brick"):
			node.queue_free()
	
	.queue_free()
