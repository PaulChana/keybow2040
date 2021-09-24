function clean () {
    printf '\r   Cleaning'
    if [ -d "build" ] 
    then
        rm -rf "build"
    fi

    if [ -d "adafruit-circuitpython-bundle-7.x-mpy-20210924" ]
    then
        rm -rf "adafruit-circuitpython-bundle-7.x-mpy-20210924"
    fi
    printf '\r ✓ Cleaning\n'
}

function start () {
    echo "Preparing build"
}

function finish () {
    rm -rf "adafruit-circuitpython-bundle-7.x-mpy-20210924"
    rm "adafruit-circuitpython-bundle-7.x-mpy-20210924.zip"
    echo "Build complete"
}

function prepare () {
    printf '\r   Make directories'
    mkdir "build"
    mkdir "build/firmware"
    mkdir "build/circuitpy"
    mkdir "build/circuitpy/lib"
    printf '\r ✓ Make directories\n'
}

function download_firmware () {
    printf '\r   Downloading uf2'
    curl -L https://downloads.circuitpython.org/bin/pimoroni_keybow2040/en_GB/adafruit-circuitpython-pimoroni_keybow2040-en_GB-7.0.0.uf2 --output "build/firmware/adafruit-circuitpython-pimoroni_keybow2040-en_GB-7.0.0.uf2" --silent
    printf '\r ✓ Downloading uf2\n'
}

function import_circuit_python_library () {
    printf '\r   Importing %s' "$1"
    cp -r "adafruit-circuitpython-bundle-7.x-mpy-20210924/lib/$1" "build/circuitpy/lib/$1"
    printf '\r ✓ Importing %s\n' "$1"
}

function import_circuit_python_libraries () {
    import_circuit_python_library "adafruit_bus_device"
    import_circuit_python_library "adafruit_hid"
    import_circuit_python_library "adafruit_is31fl3731"
}

function download_circuit_python_library () {
    printf '\r   Downloading Circuit Python library'
    curl -L https://github.com/adafruit/Adafruit_CircuitPython_Bundle/releases/download/20210924/adafruit-circuitpython-bundle-7.x-mpy-20210924.zip --output "adafruit-circuitpython-bundle-7.x-mpy-20210924.zip" --silent
    printf '\r ✓ Downloading Circuit Python library\n'

    printf '\r   Unzipping python library'
    unzip -qq "adafruit-circuitpython-bundle-7.x-mpy-20210924.zip"
    printf '\r ✓ Unzipping python library\n'
}

function download_keybow_library () {
    printf '\r   Downloading keybow library'
    curl -L https://raw.githubusercontent.com/pimoroni/keybow2040-circuitpython/master/keybow2040.py --output "build/circuitpy/lib/keybow2040.py" --silent
    printf '\r ✓ Downloading keybow library\n'
}

function copy_source_files () {
    printf '\r   Copying source files'
    cp "source/boot.py" "build/circuitpy/boot.py"
    cp "source/code.py" "build/circuitpy/code.py"
    printf '\r ✓ Copying source files\n'
}

function main () {
    start
    clean
    prepare
    download_firmware
    download_circuit_python_library
    import_circuit_python_libraries
    download_keybow_library
    copy_source_files
    finish
}

main "$@"