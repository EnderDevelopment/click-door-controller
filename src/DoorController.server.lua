local door = script.Parent
local leftMotor = door:WaitForChild("MotorL")
local rightMotor = door:WaitForChild("MotorR")
local openValue = door:WaitForChild("Open")
local button = door:WaitForChild("Button")
local clickDetector = button:FindFirstChildWhichIsA("ClickDetector", true)

if not clickDetector then
	error("DoorController requires a ClickDetector inside Door.Button")
end

local leftHinge = leftMotor:WaitForChild("Hinge")
local rightHinge = rightMotor:WaitForChild("Hinge")

local function updateDoor(isOpen)
	if isOpen then
		rightHinge.TargetAngle = 90
		leftHinge.TargetAngle = -90
	else
		rightHinge.TargetAngle = 0
		leftHinge.TargetAngle = 0
	end
end

openValue.Changed:Connect(updateDoor)

clickDetector.MouseClick:Connect(function()
	openValue.Value = not openValue.Value
end)

updateDoor(openValue.Value)
