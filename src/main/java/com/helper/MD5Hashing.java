package com.helper;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Hashing {

	/**
	 * Hashes the input password using MD5.
	 *
	 * @param password The password to hash.
	 * @return The MD5 hash of the password as a hex string.
	 * @throws NoSuchAlgorithmException If the MD5 algorithm is not available.
	 */
	public static String hashPassword(String password) throws NoSuchAlgorithmException {
		// Create an instance of MessageDigest for MD5
		MessageDigest md = MessageDigest.getInstance("MD5");

		// Hash the password
		byte[] hashBytes = md.digest(password.getBytes());

		// Convert the hash bytes to a hexadecimal string
		StringBuilder hexString = new StringBuilder();
		for (byte b : hashBytes) {
			String hex = Integer.toHexString(0xff & b);
			if (hex.length() == 1) {
				hexString.append('0');
			}
			hexString.append(hex);
		}

		return hexString.toString();
	}
}
