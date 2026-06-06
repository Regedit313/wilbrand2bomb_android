wilbrand2bomb_android

Installation

1. Install Termux.

2. Copy the "wilbrand2bomb_android" folder to the root of internal storage.

3. Open Termux and run:

termux-setup-storage

(When prompted, allow Termux to access all files on your device storage.)

4. Start wilbrand2bomb:

bash ~/storage/shared/wilbrand2bomb_android/wilbrand2bomb.sh

(The scripts can be launched from any location in Termux.)

5. IMPORTANT:

Before first use, select:

9 = First-time Setup

This step installs the required files and prepares Wilbrand for use.

The setup must be completed before generating an exploit.

---

Menu

When started, "wilbrand2bomb.sh" provides the following options:

1 = Generate Wilbrand exploit
9 = First-time Setup
0 = Exit

---

First-time Setup

The setup menu provides two installation methods:

1 = Install included Wilbrand_termux (recommended)
2 = Recompile Wilbrand_termux from source (if exploit fails)

Option 1

Installs the included precompiled ARM64 version of Wilbrand.

This is the recommended option and should work on most modern Android devices.

Option 2

Recompiles Wilbrand directly on the device using the included source code.

Use this option only if the included version does not work correctly on your device.

---

Generate Wilbrand Exploit

When generating an exploit, the following information is required:

Wii MAC Address

Example:

AA-BB-CC-DD-EE-FF

or

AABBCCDDEEFF

The MAC address can be found on the Wii:

Wii Button
→ System Settings
→ Page 2
→ Internet
→ Information

Date

Enter the current date using:

MM/DD/YYYY

Example:

06/06/2026

Wii Firmware Version

Recommended values:

4.3E
4.3U
4.3J
4.3K

Where:

E = Europe
U = USA
J = Japan
K = Korea

---

Output Folder

Each time an exploit is generated, the previous output is automatically removed.

A new folder is created:

COPY_TO_SD

inside the project directory.

Example:

wilbrand2bomb_android/
└── COPY_TO_SD/

Copy the contents of this folder to the root of your Wii SD card.

---

Included Files

This project contains:

Wilbrand_termux

A precompiled ARM64 version for Android / Termux.

It also contains the complete original source code:

source/
data/

This allows the project to be recompiled in the future if needed.

---

Notes

The included Wilbrand binary is recommended for normal use.

The recompilation option exists for compatibility and future maintenance purposes.

The original source code is preserved to allow rebuilding the project directly on Android through Termux if required.

---

Credits

Uses:

- Wilbrand by Giantpune
- Termux

This repository provides a simple Android/Termux workflow for generating Wii Wilbrand exploits directly from an Android device.