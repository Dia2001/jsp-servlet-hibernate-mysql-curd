package com.employeemanage.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.employeemanage.model.Department;
import com.employeemanage.model.Employee;
import com.employeemanage.util.HibernateUtil;

public class DepartmentDAO {
	
	public DepartmentDAO() {

	}

	public Department getDepartment(int id) {

		Transaction transaction = null;
		Department department = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			department = session.get(Department.class, id);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return department;
	}

	/**
	 * Get all Employees
	 * 
	 * @return
	 */
	// Bỏ qua các cảnh báo
	@SuppressWarnings("unchecked")
	public List<Department> getAllDepartment() {

		Transaction transaction = null;
		List<Department> listOfDepartment = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object

			listOfDepartment = session.createQuery("from Department").getResultList();

			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return listOfDepartment;
	}
}
