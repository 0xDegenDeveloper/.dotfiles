# Key Bindings

## MacOS

### Karabiner Elements

- [Link](https://karabiner-elements.pqrs.org/)

Allows `right shift -> hyper` bind and key presses for apple scripts.

#### Complex Modifications

- Right Shift to Hyper

```json
{
    "description": "Right shift to Hyper",
    "manipulators": [
        {
            "from": { "key_code": "right_shift" },
            "to": [
                {
                    "key_code": "left_control",
                    "modifiers": ["left_command", "left_option", "left_shift"]
                }
            ],
            "type": "basic"
        }
    ]
}
```

- Hyper + C: Open Code Editor

```json
{
    "description": "Hyper + C to open code editor",
    "manipulators": [
        {
            "from": { "key_code": "c" },
            "modifiers": { "mandatory": ["left_control", "left_command", "left_option", "left_shift"] }
            "to": [{ "shell_command": "osascript ~/AppleScripts/open-ghostty.scpt" }],
            "type": "basic"
        }
    ]
}
```



### Rectangle Pro

- [Link](https://rectangleapp.com/pro/): For window management

For window management.






