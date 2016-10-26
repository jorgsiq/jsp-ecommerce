/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author marcelosiedler
 */
public class Criptografia {

   public static boolean comparePassword(String password, String comparison){
       
       try {
           if(convertPasswordToMD5(comparison).equals(password)){
               return true;
           }
       } catch (NoSuchAlgorithmException ex) {
           Logger.getLogger(Criptografia.class.getName()).log(Level.SEVERE, null, ex);
       }
       return false;
   }
   
   public static String convertPasswordToMD5(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
 
        BigInteger hash = new BigInteger(1, md.digest(password.getBytes()));
 
        return String.format("%32x", hash);
    }
    
}