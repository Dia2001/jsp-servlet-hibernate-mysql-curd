package com.employeemanage.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name="employee")
public class Employee {
 
    @Id // Khóa
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    protected int id;
 
    @Column(name="name")
    protected String name;
    
    @Column(name="password")
    protected String password;
    
    @Column(name="email")
    protected String email;
 
    @Column(name="country")
    protected String country;
    
    //https://stackjava.com/hibernate/cascade-trong-jpa-hibernate-la-gi-cac-loai-cascadetype.html
    @OneToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name = "departmentid")
    private Department department;

	public Employee() {
    	
    }  
    
    public  Employee(String name,String password, String email, String country,Department department) {
        super();
        this.name = name;
        this.email = email;
        this.password=password;
        this.country = country;
        this.department=department;
    }

    public Employee(int id, String name, String password,String email, String country,Department department) {
        super();
        this.id = id;
        this.name = name;
        this.password=password;
        this.email = email;
        this.country = country;
        this.department=department;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.name =password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    } 
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
}