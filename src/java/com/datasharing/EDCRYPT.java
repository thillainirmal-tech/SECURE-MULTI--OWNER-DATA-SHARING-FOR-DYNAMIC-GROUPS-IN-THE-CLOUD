/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.datasharing;

/**
 *
 * @author sentamilpandi.m
 */
import java.io.*;
import java.security.*;
import java.security.spec.EncodedKeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import javax.crypto.*;
import org.apache.commons.codec.binary.Hex;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class EDCRYPT {
    String ALGORITHM_USED = "RSA";
    String PROVIDER = "BC";
private KeyPair key; 
 
public EDCRYPT() throws NoSuchAlgorithmException
{
    this.init(); 
    this.generateKey();
}

public void init()
{
    Security.addProvider(new BouncyCastleProvider());

}

public KeyPair generateKey() throws NoSuchAlgorithmException
{
    KeyPairGenerator keyGen = null;
    try { 
        keyGen = KeyPairGenerator.getInstance(ALGORITHM_USED, PROVIDER);
    }catch (NoSuchProviderException e){e.printStackTrace();}
    keyGen.initialize(1024);
    key = keyGen.generateKeyPair();
    return key;
}

public PublicKey getpublickey()
{
    return key.getPublic();
}
public PrivateKey getprivatekey()
{
    return key.getPrivate();
}

public byte[] encrypt(byte[] text, PublicKey key) throws Exception
{
    byte[] cipherText = null;
    try
    {
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding",PROVIDER);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        cipherText = cipher.doFinal(text);
    }catch (Exception e){throw e;}
    return cipherText;
}

public String encrypt(String text, PublicKey key) throws Exception
{
    String encryptedText;
    try
    {   byte[] cipherText = encrypt(text.getBytes(),key);
        encryptedText = encodeToBASE64(cipherText);
    }catch (Exception e){throw e;}return encryptedText;
}

public byte[] decrypt(byte[] text, PrivateKey key) throws Exception
{
    byte[] dectyptedText = null;
    try
    {
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding",PROVIDER);
        cipher.init(Cipher.DECRYPT_MODE,key);
        dectyptedText = cipher.doFinal(text);
    }catch (Exception e){throw e;}
    return dectyptedText;
}

public String decrypt(String text, PrivateKey key) throws Exception
{
    String result;
    try
    {   byte[] dectyptedText = decrypt(decodeToBASE64(text),key);
        result = new String(dectyptedText);
    }catch (Exception e){throw e;}
    return result;
}


public String getKeyAsString(Key key)
{
    byte[] keyBytes = key.getEncoded();
    BASE64Encoder b64 = new BASE64Encoder();
    return b64.encode(keyBytes);
}

public PrivateKey getPrivateKeyFromString(String key) throws Exception
{
    KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM_USED);
    BASE64Decoder b64 = new BASE64Decoder();
    EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(b64.decodeBuffer(key));
    PrivateKey privateKey = keyFactory.generatePrivate(privateKeySpec);
    return privateKey;
}

public PublicKey getPublicKeyFromString(String key) throws Exception
{
    BASE64Decoder b64 = new BASE64Decoder();
    KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM_USED);
    EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(b64.decodeBuffer(key));
    PublicKey publicKey = keyFactory.generatePublic(publicKeySpec);
    return publicKey;
}

private String encodeToBASE64(byte[] bytes)
{
BASE64Encoder b64 = new BASE64Encoder();
return b64.encode(bytes);
}

private byte[] decodeToBASE64(String text) throws IOException
{
    BASE64Decoder b64 = new BASE64Decoder();
    return b64.decodeBuffer(text);
}

public static void main(String[] args) throws Exception {
    EDCRYPT rsa= new EDCRYPT();
  
    String pub=rsa.getKeyAsString(rsa.getpublickey());     
    PublicKey key=rsa.getPublicKeyFromString(pub); 
    System.out.println("public key ???"+pub);
    String encry=rsa.encrypt("hello world is the first java program for the java beginners",key);
    System.out.println("cipher text :"+encry);
    String pri=rsa.getKeyAsString(rsa.getprivatekey());  
    System.out.println("private key "+pri);
    String decry=rsa.decrypt(encry,rsa.getPrivateKeyFromString(pri));
    System.out.println("!!!!!!!!!"+decry);
}
    
}
