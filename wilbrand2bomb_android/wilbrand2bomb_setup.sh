#!/data/data/com.termux/files/usr/bin/bash

clear

cd "$(dirname "$0")" || exit 1

if [ ! -d ~/storage/shared ]; then
    echo "Setting up storage..."
    termux-setup-storage
else
    echo "Storage is already configured."
fi

echo
echo "wilbrand2bomb_android setup"
echo
echo "1) Install included Wilbrand_termux (recommended)"
echo "2) Recompile Wilbrand_termux from source (if problems)"
echo

read -p "Choose [1 or 2]: " choice

mkdir -p ~/bin

case "$choice" in

    1)
        echo
        echo "Installing included Wilbrand_termux..."

        if [ ! -f Wilbrand_termux ]; then
            echo
            echo "Error: Wilbrand_termux not found."
            echo
            read -p "Press Enter to continue..."
            exit 1
        fi

        cp Wilbrand_termux ~/bin/Wilbrand_termux
        chmod +x ~/bin/Wilbrand_termux
        ;;

    2)
        echo
        echo "Installing dependencies..."
        pkg update -y
        pkg install clang make python binutils -y

        echo
        echo "Generating embedded binary data..."

        python3 - <<'PY'
from pathlib import Path

def write_array(input_file, array_name, size_name, out):
    data = Path(input_file).read_bytes()
    out.write(f'unsigned char {array_name}[] = {{\n')
    for i in range(0, len(data), 12):
        chunk = data[i:i+12]
        out.write('    ' + ', '.join(f'0x{b:02x}' for b in chunk) + ',\n')
    out.write('};\n')
    out.write(f'unsigned int {size_name} = {len(data)};\n\n')

with open('embedded_bins.cpp', 'w') as out:
    write_array('data/loader.bin', 'loader_bin', 'loader_bin_size', out)
    write_array('data/envelope.bin', 'envelope_bin', 'envelope_bin_size', out)
PY

        echo
        echo "Compiling Wilbrand_termux_custom..."

        g++ -std=gnu++98 -DSEP='"/"' -DSEPC="'/'" source/*.cpp embedded_bins.cpp -o Wilbrand_termux_custom

        if [ ! -f Wilbrand_termux_custom ]; then
            echo
            echo "Error: compilation failed."
            echo
            read -p "Press Enter to continue..."
            exit 1
        fi

        cp Wilbrand_termux_custom ~/bin/Wilbrand_termux
        chmod +x ~/bin/Wilbrand_termux
        ;;

    *)
        echo
        echo "Invalid choice."
        echo
        read -p "Press Enter to continue..."
        exit 1
        ;;
esac

echo
echo "Setup completed."
echo
read -p "Press Enter to continue..."
