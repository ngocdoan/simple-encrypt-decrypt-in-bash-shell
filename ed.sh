#!/bin/bash
############################################################
encrypt_text () {
   # Ask user for a password
echo "Please enter a password to encrypt the file:"
read -s PASSWORD
# Ask user for the file to encrypt
echo "File list:"
ls -l
echo "Please enter the file to encrypt:"
read FILE
# Encrypt the file
openssl enc -aes-256-cbc -pbkdf2 -salt -in $FILE -out $FILE.encrypt.txt -k $PASSWORD
echo "File encrypted successfully!"
}

############################################################
decrypt_text () {
# Prompt user for password
echo -n "Please enter the password: "
read -s password
# Ask user for the file to decrypt
echo "File list"
ls -l
echo "Please enter the file to decrypt:"
read FILE
# Decrypt the file
openssl enc -aes-256-cbc -pbkdf2 -d -in $FILE -out $FILE.decrypted.txt -k $password
echo "File decrypted successfully!"
}
############################################################


PS3="Select your choice please: "

select lng in Encrypt Decrypt Quit
do
    case $lng in
        "Encrypt")
            encrypt_text
            break;;
        "Decrypt")
           decrypt_text
           break;;
        "Quit")
           echo "We're done"
           break;;
        *)
           echo "Ooops";;
    esac
done
