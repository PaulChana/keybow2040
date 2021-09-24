import board  # type: ignore
import time
from keybow2040 import Keybow2040  # type: ignore

import usb_hid  # type: ignore
from adafruit_hid.keyboard import Keyboard  # type: ignore
from adafruit_hid.keyboard_layout_us import KeyboardLayoutUS  # type: ignore
from adafruit_hid.keycode import Keycode  # type: ignore
from adafruit_hid.consumer_control_code import ConsumerControlCode  # type: ignore
from adafruit_hid.consumer_control import ConsumerControl  # type: ignore

i2c = board.I2C()
keybow = Keybow2040(i2c)
keys = keybow.keys
keyboard = Keyboard(usb_hid.devices)
layout = KeyboardLayoutUS(keyboard)
consumer_control = ConsumerControl(usb_hid.devices)

key_pressed_colour = (30, 159, 232)


def startup():
    for key in [3, 7, 11, 15, 2, 6, 10, 14, 1, 5, 9, 13, 0, 4, 8, 12]:
        keybow.set_led(
            key, key_pressed_colour[0], key_pressed_colour[1], key_pressed_colour[2]
        )
        time.sleep(0.03)

    time.sleep(0.5)

    for key in keys:
        key.led_off()


def setup():
    keymap = [
        lambda: consumer_control.send(ConsumerControlCode.PLAY_PAUSE),
        None,
        lambda: keyboard.send(Keycode.CONTROL, Keycode.COMMAND, Keycode.J),
        lambda: keyboard.send(Keycode.CONTROL, Keycode.COMMAND, Keycode.Y),
        lambda: consumer_control.send(ConsumerControlCode.SCAN_NEXT_TRACK),
        None,
        lambda: keyboard.send(Keycode.ALT, Keycode.F7),
        lambda: keyboard.send(Keycode.F6),
        lambda: consumer_control.send(ConsumerControlCode.VOLUME_DECREMENT),
        None,
        lambda: keyboard.send(Keycode.CONTROL, Keycode.COMMAND, Keycode.UP_ARROW),
        lambda: keyboard.send(Keycode.F7),
        lambda: consumer_control.send(ConsumerControlCode.VOLUME_INCREMENT),
        None,
        None,
        lambda: keyboard.send(Keycode.F8),
    ]

    for key in keys:

        @keybow.on_press(key)
        def press_handler(key):
            if keymap[key.number] != None:
                keymap[key.number]()
                key.set_led(*key_pressed_colour)

        @keybow.on_release(key)
        def release_handler(key):
            key.led_off()


def main():
    while True:
        keybow.update()


startup()
setup()
main()
