# Arduino implementation of the HAL real-time metrics platform based on esp-32

Before every `idf.py build`
```sh
cd ~/esp/esp-idf
./install.sh esp32c6
```

```sh
idf.py menuconfig
```

```sh
idf.py build
```

```sh
idf.py flash
```


If you run into some errors and change some verions you can then do:
```sh
rm -rf managed_components
```
```sh
rm -f dependencies.lock
```

```sh
idf.py reconfigure
```

```sh
idf.py fullclean
```

```sh
idf.py build
```



## How to build + flash
```sh
idf.py set-target esp32c6
```

```sh
idf.py fullclean
```

```sh
idf.py menuconfig
```

Component config -> mbedTLS -> TLS Key Exchange Methods -> Enable pre-shared-key ciphersuites and then check `Enable PSK based ciphersuite modes`

- set the partition table

Component config -> Wifi -> SoftAP


```sh
idf.py build
```

```sh
ls /dev/tty.*
ls /dev/tty.usb*
```

```sh
idf.py -p /dev/tty.usbmodem101 flash
```

```sh
idf.py -p /dev/tty.usbmodem101 monitor
```


Go to
```
nano /Users/rodriguedeguerre/Desktop/EPFHelp/HALytics/arduino/src/managed_components/espressif__arduino-esp32/cores/esp32/chip-debug-report.cpp
```
And around line 194 add:
```c
#ifdef ESP_PARTITION_SUBTYPE_DATA_LITTLEFS
    case ESP_PARTITION_SUBTYPE_DATA_LITTLEFS: chip_report_printf("LITTLEFS"); break;
#endif
```


Component config -> mbedTLS -> TLS Key Exchange Methods -> Enable pre-shared-key ciphersuites and then check `Enable PSK based ciphersuite modes`