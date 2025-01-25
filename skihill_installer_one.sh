#!/bin/bash

# Installer function
install_software() {
    # Define the installation directory
    INSTALL_DIR="/opt/myapp"

    # Check if the installation directory exists, if not, create it
    if [ ! -d "$INSTALL_DIR" ]; then
        echo "Directory $INSTALL_DIR does not exist. Creating it now..."
        sudo mkdir -p "$INSTALL_DIR"
        if [ $? -ne 0 ]; then
            echo "Failed to create directory $INSTALL_DIR. Exiting..."
            return 1
        fi
    else
        echo "Directory $INSTALL_DIR already exists."
    fi

    # Example command 1: Update system
    echo "Updating system..."
    sudo apt update -y
    if [ $? -ne 0 ]; then
        echo "Error updating system. Exiting..."
        return 1
    fi

    # Example command 2: Install curl
    echo "Installing curl..."
    sudo apt install -y curl
    if [ $? -ne 0 ]; then
        echo "Error installing curl. Exiting..."
        return 1
    fi
    sudo ln -sf $(which curl) "$INSTALL_DIR/curl"

    # Example command 3: Install git
    echo "Installing git..."
    sudo apt install -y git
    if [ $? -ne 0 ]; then
        echo "Error installing git. Exiting..."
        return 1
    fi
    sudo ln -sf $(which git) "$INSTALL_DIR/git"

    # Example command 4: Download file to $INSTALL_DIR
    echo "Downloading file to $INSTALL_DIR..."
    sudo curl -L -o "$INSTALL_DIR/samplefile.txt" "https://example.com/samplefile.txt"
    if [ $? -ne 0 ]; then
        echo "Error downloading file. Exiting..."
        return 1
    fi

    # Final cleanup
    echo "Running cleanup..."
    sudo apt autoremove -y
    if [ $? -ne 0 ]; then
        echo "Error during cleanup. Exiting..."
        return 1
    fi

    echo "Installation complete! All files installed to $INSTALL_DIR."
}

# Call the installer function
install_software
