package com.employeemanage.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employeemanage.dao.DepartmentDAO;
import com.employeemanage.dao.EmployeeDAO;
import com.employeemanage.model.Department;
import com.employeemanage.model.Employee;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/")
public class EmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO empDao;
    private DepartmentDAO depDao;

    public void init() {
        empDao = new EmployeeDAO();
        depDao=new DepartmentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertUser(request, response);
                    break;
                case "/delete":
                    deleteEmployee(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateEmployee(request, response);
                    break;
                default:
                    listEmployee(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < Employee > listEmployee = empDao.getAllEmployee();
        request.setAttribute("listEmp", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee_list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee_form.jsp");
        List<Department> departments=depDao.getAllDepartment();
        request.setAttribute("departments", departments);
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee =empDao.getEmployee(id);
        List<Department> departments=depDao.getAllDepartment();
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee_form.jsp");
        request.setAttribute("employee", existingEmployee);
        request.setAttribute("departments", departments);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int departmentid =Integer.parseInt(request.getParameter("department"));
        Department department=depDao.getDepartment(departmentid);
        Employee newEmp = new Employee(name,password, email, country,department);
        empDao.saveEmployee(newEmp);
        response.sendRedirect("list");
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int departmentid =Integer.parseInt(request.getParameter("department"));
        Department department=depDao.getDepartment(departmentid);
        Employee emp = new Employee(id, name,password, email, country,department);
        empDao.updateEmployee(emp);
        response.sendRedirect("list");
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        empDao.deleteEmployee(id);
        response.sendRedirect("list");
    }
}