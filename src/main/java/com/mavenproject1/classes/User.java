/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mavenproject1.classes;

import java.io.Serializable;

/**
 *
 * @author razvan
 */
public final class User extends Person implements Cloneable, Serializable,ValidateString {
    
    String id_user;
    String username;
    String password;
    
//    public User(){
//        super();
//        username="";
//        password="";
//    }
    
    public User(String username, String password, String firstname, String lastname, String address, String phone, String emailaddress)

    {
        super(firstname, lastname, phone,  emailaddress, address);
        this.set_username(username);
        this.set_password(password); 
    }
    
    public User(String id, String username, String password, String firstname, String lastname, String address, String phone, String emailaddress)

    {
        super(firstname, lastname, phone,  emailaddress, address);
        this.set_id_user(id);
        this.set_username(username);
        this.set_password(password); 
    }
    
    public String get_id_user()
    {
        return id_user;
    }
    
    public void set_id_user(String id){
        if(id !=null)
            this.id_user=id;
    }
    
    public String get_username()
    {
        return username;
    }
    
     public void  set_username(String pusername)
     {
          if (pusername !=null)
        {
            this.username = pusername;
            
        }
        
     }
     
     public String get_password()
     {
         return password;
     }
     
     public void set_password(String ppassword)
     {
         
         if (ppassword !=null)
             this.password=ppassword;
//         if (ppassword.length() < 8)
//             return false;
//         
//         int contor1=0, contor2=0, contor3=0;
//         for(int i=0; i < ppassword.length(); i++)
//         {
//             if((ppassword.charAt(i)>='a' && ppassword.charAt(i)<='z') || (ppassword.charAt(i)>='A' && ppassword.charAt(i)<='Z'))  // si are prioritate fata de sau
//                 contor1++;
//             if(ppassword.charAt(i)>='0' && ppassword.charAt(i)<='9')
//                 contor2++;
//             if(ppassword.charAt(i)=='#' || ppassword.charAt(i)=='!' || ppassword.charAt(i)=='%')
//                 contor3++;
//         }
//         if(contor1 < 3 && contor2 < 3 && contor3 < 1)
//             return false;
//         
//         this.password = ppassword;
//         return true;
     }
    
   
     
     @Override
    public int personnameValidation(String personname) {
        
        if (personname == null) {
            return 0;
        }
        for(int i =0; i< personname.length() -1; i++)
        {
            if (!(personname.charAt(i) >= 'A' && personname.charAt(i) <= 'Z' || personname.charAt(i) >= 'a' && personname.charAt(i) <='z' || personname.charAt(i) == ' '))
                return 0;
        }
        
        return 1;
    }
    
//    @Override
//    public boolean  passwordValidation(String password) {
//        if(password == null)
//            return false;
//        String pattern = "(?=.*[0-9])";
//       return (password.matches(pattern));       
//    }

    
}
