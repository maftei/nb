/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mavenproject1.classes;

import java.io.Serializable;
import java.util.regex.Pattern;

/**
 *
 * @author razvan
 */
public class Person implements Cloneable, Serializable, ValidateString {

    String firstname;
    String lastname;
    String phone;
    String emailaddress;
    String address;

    
    public Person(String firstname, String lastname, String phone, String emailAddress, String address) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.emailaddress = emailAddress;
        this.address = address;

    }

    public String get_firstname() {
        return firstname;
    }

    public int set_firstname(String pfirstname) {
        if (personnameValidation(pfirstname) == 1) {
            this.firstname = pfirstname;
            return 1;
        }
        return 0;
    }

    public String get_lastname() {
        return lastname;
    }

    public int set_lastname(String plastname) {
        if (personnameValidation(plastname) == 1) {
            this.lastname = plastname;
            return 1;
        }
        return 0;
    }

    public String get_emailaddress() {
        return emailaddress;
    }

    public void  set_emailaddress(String pemailaddress) {
        if (pemailaddress != null)
            this.emailaddress=pemailaddress;
        
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public String get_address()
    {
        return address;
    }
    
    public void  set_address(String address)
    {
        if(address!=null)
            this.address=address;
    }
    
    

//    @Override
//    public boolean emailValidation(String emailaddress) {
//        if (emailaddress == null) {
//            return false;
//        }
//        
//        else{
//            this.emailaddress = emailaddress;
//        }
//
//        return true;
////        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."
////                + "[a-zA-Z0-9_+&*-]+)*@"
////                + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
////                + "A-Z]{2,7}$";
////
////        Pattern pat = Pattern.compile(emailRegex);
////        return pat.matcher(emailaddress).matches();
//    }

    @Override
    public int personnameValidation(String personname) {

        if (personname == null) {
            return 0;
        }
        for (int i = 0; i < personname.length(); i++) {
            if (!(personname.charAt(i) >= 'A' && personname.charAt(i) <= 'Z' || personname.charAt(i) >= 'a' && personname.charAt(i) <= 'z' || personname.charAt(i) == ' ')) {
                return 0;
            }
        }

        return 1;
    }

    @Override
    public boolean passwordValidation(String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

//    @Override
//    public boolean emailValidation(String emailaddress) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

}


//    @Override
//    public String toString() { 
//        return static String toString(int i)
//    } 