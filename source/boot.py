import board  # type: ignore
import digitalio  # type: ignore
import storage  # type: ignore

button = digitalio.DigitalInOut(board.SW0)
button.pull = digitalio.Pull.UP

if button.value:
    storage.disable_usb_drive()
