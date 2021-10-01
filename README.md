# Keybow 2040

This repository contains scripts for the [Pimoroni Keybow 2040](https://shop.pimoroni.com/products/keybow-2040?variant=32399559589971)

It is built on top of the work by __Sandy Macdonald__ as part of the [Keybow project](https://github.com/pimoroni/keybow2040-circuitpython)

## Requirements

* Your keybow must be running >= [7.x of Circuit Python](https://circuitpython.org/board/pimoroni_keybow2040/) or from [github](https://github.com/adafruit/circuitpython/releases/tag/7.0.0)
  * If you use the `make.sh` script in the root, the firmware .uf2 file will be placed in a firmware sub directory
* You must be using a [compatible version of the library](https://circuitpython.org/libraries)
* Libraries required are:
  * adafruit_bus_device
  * adafruit_hid
  * adafruit_is31fl3731
* You also need a copy of the [keybow library](https://github.com/pimoroni/keybow2040-circuitpython)

## Standards

* Code is formatted using [Black](https://pypi.org/project/black/) - [See here for setup details](https://dev.to/adamlombard/how-to-use-the-black-python-code-formatter-in-vscode-3lo0) 
* Editor of choice is [VSCode](https://code.visualstudio.com)
* Terminal is zsh

## How to use

* Copy the library to `/lib`
* Copy `keybow2040.py` to `/lib`
* Copy `boot.py` to the root of the `CIRCUITPY` directory
* Copy `code.py` to the root of the `CIRCUITPY` directory

Alternatively, you can use the script in the root of the repository, simply run `make.sh` and it will build you a directory `build/circuitpy`. Simply copy the whole contents from here to the root of the `CIRCUITPY` volume.

## What does it do?

The code.py sets up the Keybow to send shortcut commands. When you press the key, it will light that key. Repeats are not sent. 
The default configuration is very specific to my needs, and currently sends commands related to media playback, as well as the CLion IDE.

## Key layout

The current key layout is below:

<table class="tg">
<thead>
  <tr>
    <td class="tg-vsei">Debugger continue</td>
    <td class="tg-vsei">Debugger step over</td>
    <td class="tg-vsei">Debugger step in</td>
    <td class="tg-vsei">Debugger step out</td>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-vsei">Go to definition</td>
    <td class="tg-vsei">Find usage</td>
    <td class="tg-vsei">Switch between h/cpp</td>
    <td class="tg-vsei"> Empty</td>
  </tr>
  <tr>
    <td class="tg-vsei"> <span style="font-weight:normal;font-style:normal;text-decoration:none">Empty</span></td>
    <td class="tg-vsei"> <span style="font-weight:normal;font-style:normal;text-decoration:none">Empty</span></td>
    <td class="tg-vsei"> <span style="font-weight:normal;font-style:normal;text-decoration:none">Empty</span></td>
    <td class="tg-vsei"> <span style="font-weight:normal;font-style:normal;text-decoration:none">Empty</span></td>
  </tr>
  <tr>
    <td class="tg-vsei">Play / Pause</td>
    <td class="tg-vsei">Next track</td>
    <td class="tg-vsei">Volume down</td>
    <td class="tg-vsei">Volume up</td>
  </tr>
</tbody>
</table>

## Booting

By default the code in `boot.py` will prevent the `CIRCUITPY` drive from appearing in the host machine. If you want to make it visible, for example for editing the `code.py` file, you need to hold `SW0` (Bottom left button if the USB port is pointing up) and then plugin the USB cable. This will enable the device to mount as a volume.

## Artwork

The [artwork](./artwork/keybow.pdf) is in both sketch and pdf format. It is designed to be printed at 100%, and if you then cut it out it will fit nicely in to these [relegendable caps](https://mechbox.co.uk/collections/relegendable-keycaps/products/relegendable-keycap-for-mx-switches?variant=40694821617826)