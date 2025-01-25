#!/bin/bash

# Main menu function
main_menu() {
    clear
    echo "Main Menu"
    echo "1. Sub Menu"
    echo "2. Option 2"
    echo "3. Option 3"
    echo "4. Exit"
    echo -n "Please choose an option: "
    read option

    case $option in
        1) sub_menu ;;
        2) option_2 ;;
        3) option_3 ;;
        4) exit 0 ;;
        *) echo "Invalid option, please try again."; sleep 1; main_menu ;;
    esac
}

# Sub menu function
sub_menu() {
    clear
    echo "Sub Menu"
    echo "1. Option A"
    echo "2. Option B"
    echo "3. Back to Main Menu"
    echo -n "Please choose an option: "
    read option

    case $option in
        1) option_a ;;
        2) option_b ;;
        3) main_menu ;;
        *) echo "Invalid option, please try again."; sleep 1; sub_menu ;;
    esac
}

# Option functions (you can define them as you need)
option_2() {
    clear
    echo "Option 2 selected"
    sleep 1
    main_menu
}

option_3() {
    clear
    echo "Option 3 selected"
    sleep 1
    main_menu
}

option_a() {
    clear
    echo "Option A selected"
    sleep 1
    sub_menu
}

option_b() {
    clear
    echo "Option B selected"
    sleep 1
    sub_menu
}

# Run the main menu
main_menu
