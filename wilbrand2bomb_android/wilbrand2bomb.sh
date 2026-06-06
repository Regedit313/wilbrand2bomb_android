#!/data/data/com.termux/files/usr/bin/bash

cd "$(dirname "$0")" || exit 1

while true; do
    clear

    echo
    echo "wilbrand2bomb_android"
    echo
    echo "1) Create Wilbrand exploit"
    echo "9) Run first-time setup"
    echo "0) Exit"
    echo

    read -p "Choose what to do: " choice

    case "$choice" in

        1)
            clear

            if [ ! -f ~/bin/Wilbrand_termux ]; then
                echo
                echo "Wilbrand_termux not found."
                echo
                echo "Please run option 9 first."
                echo
                read -p "Press Enter to continue..."
                continue
            fi

            echo "Create Wilbrand exploit"
            echo

            read -p "Enter Wii MAC address: " mac
            read -p "Enter date MM/DD/YYYY: " date
            read -p "Enter Wii firmware version (recommended: 4.3E or 4.3U or 4.3J or 4.3K): " version

            rm -rf COPY_TO_SD
            mkdir -p COPY_TO_SD

            echo
            echo "Running Wilbrand..."
            echo

            ~/bin/Wilbrand_termux "$mac" "$date" "$version" "$PWD/COPY_TO_SD"

            echo
            echo "Done."
            echo
            echo "Copy the contents of COPY_TO_SD to the root of the SD card."
            echo
            read -p "Press Enter to continue..."
            ;;

        9)
            clear
            bash ./wilbrand2bomb_setup.sh
            ;;

        0)
            clear
            exit 0
            ;;

        *)
            echo
            echo "Invalid choice."
            sleep 1
            ;;
    esac
done
