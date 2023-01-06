# simple-encrypt-decrypt-in-bash-shell

### Encrypt
```
#!/bin/bash
# Ask user for a password
echo "Please enter a password to encrypt the file:"
read -s PASSWORD
# Ask user for the file to encrypt
echo "Please enter the file to encrypt:"
read FILE
# Encrypt the file
openssl enc -aes-256-cbc -salt -in $FILE -out encrypt.txt -k $PASSWORD
echo "File encrypted successfully!"
```

### Decrypt
```
#!/bin/bash
# Prompt user for password
echo -n "Please enter the password: "
read -s password
# Ask user for the file to decrypt
echo "Please enter the file to decrypt:"
read FILE
# Decrypt the file
openssl enc -aes-256-cbc -d -in $FILE -out decrypted.txt -k $password
```
