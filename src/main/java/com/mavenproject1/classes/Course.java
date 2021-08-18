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
public final class Course implements Cloneable, Serializable {

    String coursename;
    String coursedescription;
    int coursefee;
    int courseduration;

    
    public Course(String coursename, String coursedescription, int coursefee, int courseduration) {
        this.setCoursename(coursename);
        this.coursedescription = coursedescription;
        this.coursefee = coursefee;
        this.courseduration = courseduration;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        if (coursename == null)
            return;
        else
        {
            for (int i =0;  i < coursename.length(); i++)
            {
                 if(!((coursename.charAt(i)>='a' && coursename.charAt(i)<='z') || (coursename.charAt(i)>='A' && coursename.charAt(i)<='Z') || coursename.charAt(i) == ' '))
                 {
                      return;
                 }
            } 
            this.coursename=coursename;
        }
    }

    public String getCoursedescription() {
        return coursedescription;
    }

    public void setCoursedescription(String coursedescription) {
        this.coursedescription = coursedescription;
    }

    public int getCoursefee() {
        return coursefee;
    }

    public void setCoursefee(int coursefee) {
        this.coursefee = coursefee;
    }

    public int getCourseduration() {
        return courseduration;
    }

    public void setCourseduration(int courseduration) {
        this.courseduration = courseduration;
    }
    
    
    
}
