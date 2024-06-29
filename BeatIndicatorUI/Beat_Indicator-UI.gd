extends Control

# The speed at which the progress bar fills up (seconds)
const FILL_DURATION : float = 1.2

# Timer to track the progress
var timer : float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update the timer
	timer += delta
	
	# Calculate the progress (0-1)
	var progress = timer / FILL_DURATION
	
	# Clamp the progress to 0-1 range
	progress = clamp(progress, 0.0, 1.0)
	
	# Set the progress bar value
	$LeftProgressBar.value = progress * 100
	$RightProgressBar.value = progress * 100

	if progress >= 1.0:
		timer = 0

func _ready():
	# Initialize the progress bar value
	$LeftProgressBar.value = 0
	$RightProgressBar.value = 0
	# Ensure the ProgressBar max value is set to 100
	$LeftProgressBar.max_value = 100
	$RightProgressBar.max_value = 100
