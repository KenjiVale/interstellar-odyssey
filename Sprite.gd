extends Sprite

var random = RandomNumberGenerator.new()
var newSprite = ImageTexture.new()


func _ready():
	random.randomize()
	var random_number = random.randi_range(1,8)
	self.newSprite = load("res://Assets/planet"+str(random_number)+".png")
	texture = newSprite
	
	
		
	
	
	

   

