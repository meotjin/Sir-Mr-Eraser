extends Control

# The speed at which the progress bar fills up (full progress in 1.2 seconds)
const FILL_DURATION : float = 1.2

# Timer to track the progress
var timer : float = 0.0
# Direction to fill (1 for fill, -1 for empty)
var direction : int = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update the timer
	timer += delta * direction
	
	# Calculate the progress (normalized to 0-1)
	var progress = timer / FILL_DURATION
	
	# Clamp the progress to 0-1 range
	progress = clamp(progress, 0.0, 1.0)
	
	# Set the progress bar value
	$LeftProgressBar.value = progress * 100 # Assuming the ProgressBar max value is 100
	$RightProgressBar.value = progress * 100
	# Reverse direction if the bar is fully filled or emptied
	if progress >= 1.0:
		timer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize the progress bar value
	$LeftProgressBar.value = 0
	$RightProgressBar.value = 0
	# Ensure the ProgressBar max value is set to 100
	$LeftProgressBar.max_value = 100
	$RightProgressBar.max_value = 100
