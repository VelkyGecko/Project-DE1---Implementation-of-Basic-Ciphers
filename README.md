# Project: Implementation of Basic Ciphers
## Introduction
Our project is connected with some ciphers, whitch will be made by VHDL on the FPGA development board Nexys A7 50-T. There are some of these ciphers.
### Team members
Patrik Gurín (responsible for programming, testing, top_level)

Ilia Zhigachev (responsible for programming, documentation, description)

Mark Kovychev (responsible for programming, documentation, testbenches)
## Theoretical description of the ciphers
### Caesar cipher:
One of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence
![image](https://github.com/VelkyGecko/Project-DE1---Implementation-of-Basic-Ciphers/assets/166106704/0cc52307-89f1-4d31-8ca5-049b01b322b7)

The action of a Caesar cipher is to replace each plaintext letter with a different one a fixed number of places down the alphabet. The cipher illustrated here uses a left shift of three, so that (for example) each occurrence of E in the plaintext becomes B in the ciphertext

#### Advantages:
1) Easy to implement and use thus, making suitable for beginners to learn about encryption.
2) Can be physically implemented, such as with a set of rotating disks or a set of cards, known as a scytale, which can be useful in certain situations.
3) Requires only a small set of pre-shared information.
4) Can be modified easily to create a more secure variant, such as by using a multiple shift values or keywords.
### Vernam cipher:
Vernam Cipher is a method of encrypting alphabetic text. It is one of the Substitution techniques for converting plain text into cipher text. In this mechanism, we assign a number to each character of the Plain-Text, like (a = 0, b = 1, c = 2, … z = 25). 
In the Vernam cipher algorithm, we take a key to encrypt the plain text whose length should be equal to the length of the plain text
![image](https://github.com/VelkyGecko/Project-DE1---Implementation-of-Basic-Ciphers/assets/166106704/07c62c7f-57b8-4623-8952-116597dcf4e8)

#### Advantages of the Vernam Cipher
1) Perfect Secrecy: With a truly random and unpredictable key of the same length as the message, the charnum cipher provides perfect confidentiality. This means that, in theory, an encrypted message provides no information about the original message.
2) Unbreakable with a Truly Random Key: In theory, if the key stream were truly random and used only once (hence the name “one-time pad”), the Vernam cipher would be unbreakable. The key stream is the same length as the message, and the likelihood of any decryption of the ciphertext is equal.
3) No Pattern Recognition: Unlike other encryption algorithms, the Vernam cipher does not produce a pattern of ciphertext that can be used to break the code. Each character of the ciphertext is encrypted independently.
4) Simple Algorithm: Both the encryption and decryption algorithms are simple and involve a bitwise XOR operation. This simplicity can be an advantage in some situations.

### Atbash cipher:
Atbash cipher is a substitution cipher with just one specific key where all the letters are reversed that is A to Z and Z to A. It was originally used to encode the Hebrew alphabets but it can be modified to encode any alphabet. The Atbash cipher is a particular type of monoalphabetic cipher formed by taking the alphabet (or abjad, syllabary, etc.) and mapping it to its reverse, so that the first letter becomes the last letter, the second letter becomes the second to last letter, and so on. For example, the Latin alphabet would work like this:
![image](https://github.com/VelkyGecko/Project-DE1---Implementation-of-Basic-Ciphers/assets/166106704/b06f91f6-b220-42f6-8107-bbd30441a262)

#### Advantages of the Atbash Cipher
Since its just an affine cipher with both a = 25 = b we don’t need to write separate functions for encryption and decryption. We can re-use the same function for both purposes. 



## Software description and tests





## References 
https://www.geeksforgeeks.org/vernam-cipher-in-cryptography/

https://en.wikipedia.org/wiki/Caesar_cipher

https://www.geeksforgeeks.org/caesar-cipher-in-cryptography/?ref=leftbar-rightbar

https://www.geeksforgeeks.org/implementing-atbash-cipher/?ref=ml_lbp




