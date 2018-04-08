### Docker image for [arduino-esp8266](https://github.com/esp8266/Arduino) CI builds

Contains Arduino IDE, Python, git, and a copy of ESP8266 toolchain.


### Usage

1. Build the image

    ```bash
    docker build -t arduino-docker .
    ```

2. Run the image

    ```bash
    cd arduino-esp866-dir
    docker run --rm -v $PWD:/build -it arduino-docker
    ```

3. Build arduino-esp8266 tests

    ```bash
    # install tools, can be done once
    cd tools
    cp /opt/dist/* dist/
    ./get.py
    cd ../

    # build tests
    cd tests/device
    export UPLOAD_PORT=none
    make V=1 NO_UPLOAD=1 NO_RUN=1
    ```
