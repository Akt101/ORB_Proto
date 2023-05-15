# ORB_Proto
The entire ORB fitness startup code, along with acceleration to displacement conversion for free weights, the server to collect the data and the gym machine code.
The orb-proto.exe is a server that receives accelearation data from the esp32 devices on free weight devices.
The acceleration is converted to displacement using DATS Omega method and further cleaning in fourier domain to avoid noise buildup, the code for the same can be found
in "Free_weight" folder, a snapshot of sample data conversion from acceleration to displacement is also present.
"Main" folder has the code to upload to the esp32 attached to the rotary encoder on the gym machine, open the main.h file for more information.
The IMU module and the driver for all it's functionalities is present in the "IMU_ProtoKey" Folder.

A prototype of the gym machine can be seen here:
https://youtu.be/n1FOK8vS7YU
