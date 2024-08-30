package com.helper;

import java.security.NoSuchAlgorithmException;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class AESKeyGenerator {
    /**
     * Generates a new AES key with a key size of 256 bits.
     *
     * @return The generated SecretKey.
     * @throws NoSuchAlgorithmException If the AES algorithm is not available.
     */
    public static SecretKey generateKey() throws NoSuchAlgorithmException {
        // Create a KeyGenerator instance for AES
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        
        // Initialize the KeyGenerator for 256-bit key size
        keyGen.init(256); // You can also use 128 or 192-bit key sizes
        
        // Generate and return the SecretKey
        return keyGen.generateKey();
    }
}
