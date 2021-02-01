import SYS
import RPi.GPIO as gpio
gpio.setwarnings(False)

idGpio = int(sys.argv[1])
staus = sys.argv[2]

print(idGpio)
print(staus)

gpio.setmode(gpio.BCM)
gpio.setup(12, gpio.OUT)

if staus == 'on':
	gpio.output(idGpio, True)

if staus == 'off':
	gpio.output(idGpio, False)
