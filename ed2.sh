#!/bin/bash

# Display menu
echo "Select an option:"
echo "1) Encrypt a file"
echo "2) Decrypt a file"
echo -n "Enter your choice (1 or 2): "
read choice

if [ "$choice" == "1" ]; then
    # Encryption process
    echo "Files available in the current directory:"
    ls -1
    echo -n "Please select a file number to encrypt: "
    select FILE in *; do
        if [ -n "$FILE" ]; then
            echo "Selected file: $FILE"
            break
        else
            echo "Invalid selection. Please try again."
        fi
    done

    echo -n "Please enter a password to encrypt the file: "
    read -s PASSWORD
    echo

    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    OUTPUT_FILE="${FILE}_encrypted_$TIMESTAMP.txt"
    openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -in "$FILE" -out "$OUTPUT_FILE" -k "$PASSWORD"
    echo "File encrypted successfully! Output saved as $OUTPUT_FILE"

elif [ "$choice" == "2" ]; then
    # Decryption process
    echo "Files available in the current directory:"
    ls -1
    echo -n "Please select a file number to decrypt: "
    select FILE in *; do
        if [ -n "$FILE" ]; then
            echo "Selected file: $FILE"
            break
        else
            echo "Invalid selection. Please try again."
        fi
    done

    echo -n "Please enter the password: "
    read -s PASSWORD
    echo

    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    OUTPUT_FILE="${FILE}_decrypted_$TIMESTAMP.txt"
    openssl enc -aes-256-cbc -d -pbkdf2 -iter 100000 -in "$FILE" -out "$OUTPUT_FILE" -k "$PASSWORD"
    if [ $? -eq 0 ]; then
        echo "File decrypted successfully! Output saved as $OUTPUT_FILE"
    else
        echo "Error: Decryption failed. Check your password or file."
        rm -f "$OUTPUT_FILE"
    fi

else
    echo "Invalid choice. Please select either 1 or 2."
fi
