# Modular Bed Klipper

Modular Bed Klipper is the klipper module for using the [Modular Bed](https://store.tonylabs.com/products/preview-modular-bed-for-high-performance-3d-printers)

The project is currently in development.

I'm looking for a Python developer join this project who can help me develop the module for Klipper. If you are interested in this project, please contact me via email: tony.wang@tonylabs.com

## Features
1. The modular bed controller is connected to Raspberry Pi via USB. User need to find the serial port of the controller and define it to the printer.cfg file.

2. We need to add support for the modular bed to Klipper. The modular bed controller is based on STM32F103C8T6. We need to add the support for this MCU to Klipper.

3. Each heater PCB board has a temperature sensor. We need to change the temperature control algorithm of the modular bed to make it compatible with Klipper. We need to make Klipper to support more than 6 temperature sensors feedback and PID control channels.

4. (Optional) If it's possible to use something like the Klipper Exclude Object. It would be awesome to heat the bed only where the print is going to be by detecting the object position. Save more power and heat up faster.