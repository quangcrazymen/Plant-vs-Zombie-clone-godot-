extends Sprite2D

@export var deathParticle : GPUParticles2D

func _ready():
	explodes()
	
func explodes():
	var particle = deathParticle
	particle.position = global_position
	particle.rotation = global_rotation
	await get_tree().create_timer(3)
	#deathParticle.emitting = true

func _on_gpu_particles_2d_finished() -> void:
	print("Just exploded")
