package com.employeemanage.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name="department")
public class Department {
	@Id // Khóa
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="departmentid")
	private int departmentid;
	
	@Column(name="name")
	private String name;
	
//	 @OneToMany(mappedBy = "parent", fetch = FetchType.LAZY, 
//		      cascade = {CascadeType.REMOVE, CascadeType.PERSIST})
//		   @Cascade({org.hibernate.annotations.CascadeType.SAVE_UPDATE})

	public int getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(int departmentid) {
		this.departmentid = departmentid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public Department() {
		
	}
	public Department(int departmentid, String name) {
		super();
		this.departmentid = departmentid;
		this.name = name;
	}
}
