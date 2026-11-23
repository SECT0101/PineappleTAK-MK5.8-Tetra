# Changelog

PineappleTAK versions for the WiFi Pineapple Tetra. Newest first.

## 1.0.1
- **Console on every address by default**: the console now listens on all interfaces, so it opens by the Tetra's host name, its IP on your network or `172.16.42.1`.
- **Console access on the module page and in the console**: choose *All interfaces*, *USB + VPN* or *USB address only* without SSH. The module page lists every address the console answers on.
- **Open PineappleTAK** uses the same host name or IP you used to open the Pineapple page.
- PagerTAK engine 2.3.2.

## 1.0.0
- First release: the WiFi Pineapple Tetra on your TAK Server, with the [PagerTAK](https://github.com/SECT0101/PagerTAK) engine and web console, as in [PineappleTAK for the Mark VII](https://github.com/SECT0101/PineappleTAK-MK7).
- **Pineapple module** in the Tetra's own format: install, start, stop, *Start at boot*, web console password, recent activity, reinstall and uninstall. Installing runs in the background and adds what is missing (`python3-light`, `python3-sqlite3`, `python3-openssl`, `ca-bundle`). The page says when a console password is still needed.
- **Position** from a USB GPS (u-blox and other NMEA receivers) or a position picked on the map.
- **Sensors on the Tetra**: evil-twin watch, SIGINT tables and site survey read PineAP's recon database, and the probe table reads PineAP's probe log. Radio control, the fox hunt and drone Remote ID pause PineAP's scan while they hold the radio. The blue system LED shows status and is put back when PineappleTAK stops.
- **No Bluetooth**: the Tetra restarts when its Bluetooth driver loads, so the tracker watch is left out and drone Remote ID listens on Wi-Fi only.
- **Clearer errors**: enrollment says whether the server name could not be looked up (no internet or DNS), the port refused, or nothing answered. Log files are named `/tmp/pineappletak-*.log`.
