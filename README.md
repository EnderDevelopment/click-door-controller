# Roblox Click Door Controller Script

ClickDoorController is a Roblox server script for controlling a two-sided hinged door with a clickable button. It uses a BoolValue as the door state, a ClickDetector for player interaction, and HingeConstraints to open and close the door.

## Install

1. Create or use a door model inside `Workspace`.
2. Place a normal `Script` inside the door model.
3. Add two motor objects named `MotorL` and `MotorR` inside the door model.
4. Add a `HingeConstraint` named `Hinge` inside each motor object.
5. Add a `BoolValue` named `Open` inside the door model.
6. Add a part named `Button` inside the door model.
7. Add a `ClickDetector` inside `Button`.
8. Copy the contents of `src/DoorController.server.lua` into the script.
9. Set the `ClickDetector.MaxActivationDistance` property as needed.
10. Test the door using Play mode in Roblox Studio.

The required structure is:

```text
Door
├── MotorL
│   └── Hinge
├── MotorR
│   └── Hinge
├── Open
├── Button
│   └── ClickDetector
└── DoorController.server.lua
```

`MotorL.Hinge` and `MotorR.Hinge` must be HingeConstraints. `Open` must be a BoolValue.

## Use

Players click the button to toggle the door.

When `Open.Value` is `true`:

- `MotorR.Hinge.TargetAngle` is set to `90`.
- `MotorL.Hinge.TargetAngle` is set to `-90`.

When `Open.Value` is `false`:

- Both hinge target angles are set to `0`.

The script updates the hinges whenever `Open.Value` changes. Other Roblox scripts can also control the door by changing the value directly:

```lua
workspace.Door.Open.Value = true
```

```lua
workspace.Door.Open.Value = false
```

The door uses the initial value of `Open` when the server script starts.

---

More Roblox script projects by EnderDevelopment: https://github.com/EnderDevelopment

Project page: https://dash.enderdevelopment.com/community/2f4104b7-ac5e-4522-9885-c22d1a4ec6ff?utm_source=github&utm_medium=readme&utm_campaign=auto_publish&utm_content=2f4104b7-ac5e-4522-9885-c22d1a4ec6ff
