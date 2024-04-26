# Project: Implementation of Basic Ciphers
## Introduction
Our project is connected with some ciphers, whitch will be made by VHDL on the FPGA development board Nexys A7 50-T. There are some of these ciphers.
## Team members
Patrik Gurín (responsible for programming, testing, top_level)

Ilia Zhigachev (responsible for programming, documentation, description)

Mark Kovychev (responsible for programming, documentation, testbenches)
## Theoretical description of the ciphers
### Caesar cipher:
One of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence
![image](https://github.com/VelkyGecko/Project-DE1---Implementation-of-Basic-Ciphers/assets/166106704/0cc52307-89f1-4d31-8ca5-049b01b322b7)

The action of a Caesar cipher is to replace each plaintext letter with a different one a fixed number of places down the alphabet. The cipher illustrated here uses a left shift of three, so that (for example) each occurrence of E in the plaintext becomes B in the ciphertext
Advantages:
Easy to implement and use thus, making suitable for beginners to learn about encryption.
Can be physically implemented, such as with a set of rotating disks or a set of cards, known as a scytale, which can be useful in certain situations.
Requires only a small set of pre-shared information.
Can be modified easily to create a more secure variant, such as by using a multiple shift values or keywords.
### Vernam cipher:
Vernam Cipher is a method of encrypting alphabetic text. It is one of the Substitution techniques for converting plain text into cipher text. In this mechanism, we assign a number to each character of the Plain-Text, like (a = 0, b = 1, c = 2, … z = 25). 
In the Vernam cipher algorithm, we take a key to encrypt the plain text whose length should be equal to the length of the plain text
![image](https://github.com/VelkyGecko/Project-DE1---Implementation-of-Basic-Ciphers/assets/166106704/07c62c7f-57b8-4623-8952-116597dcf4e8)
Advantages of the Vernam Cipher
Perfect Secrecy: With a truly random and unpredictable key of the same length as the message, the charnum cipher provides perfect confidentiality. This means that, in theory, an encrypted message provides no information about the original message.
Unbreakable with a Truly Random Key: In theory, if the key stream were truly random and used only once (hence the name “one-time pad”), the Vernam cipher would be unbreakable. The key stream is the same length as the message, and the likelihood of any decryption of the ciphertext is equal.
No Pattern Recognition: Unlike other encryption algorithms, the Vernam cipher does not produce a pattern of ciphertext that can be used to break the code. Each character of the ciphertext is encrypted independently.
Simple Algorithm: Both the encryption and decryption algorithms are simple and involve a bitwise XOR operation. This simplicity can be an advantage in some situations.





## References 
https://www.geeksforgeeks.org/vernam-cipher-in-cryptography/

https://en.wikipedia.org/wiki/Caesar_cipher

https://www.geeksforgeeks.org/caesar-cipher-in-cryptography/?ref=leftbar-rightbar




