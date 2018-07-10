package com.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Info.InputInformation;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/result")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String name;
	int gender, smoking, alcohol;
	int age, bloodPressure1, bloodPressure2, cholesterol;

	int history, diabetes;
	List<InputInformation> list = new ArrayList<>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		name = request.getParameter("fname");

		age = Integer.parseInt(request.getParameter("age"));

		gender = Integer.parseInt(request.getParameter("gender"));

		smoking = Integer.parseInt(request.getParameter("smoking"));

		alcohol = Integer.parseInt(request.getParameter("alcohol"));

		bloodPressure1 = Integer.parseInt(request.getParameter("bloodPressure1"));

		bloodPressure2 = Integer.parseInt(request.getParameter("bloodPressure2"));

		cholesterol = Integer.parseInt(request.getParameter("cholesterol"));

		history = Integer.parseInt(request.getParameter("history"));

		diabetes = Integer.parseInt(request.getParameter("diabetes"));

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/learningheart", "root", "");
			String sql = "INSERT into user_info(Name,Age,Gender,Blood_pressure,Cholesterol,Family_History,Tobacco_Use,Alcohol_Use,Diabetes)"
					+ " values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setInt(2, age);
			stmt.setInt(3,gender);
			stmt.setString(4,bloodPressure1+"/"+bloodPressure2);
			stmt.setInt(5,cholesterol);
			stmt.setInt(6,history);
			stmt.setInt(7,smoking);
			stmt.setInt(8,alcohol);
			stmt.setInt(9,diabetes);
			
			stmt.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}
		InputInformation in = new InputInformation();

		in.setName(name);
		in.setAge(age);
		in.setGender(gender);
		in.setAlcohol(alcohol);
		in.setBloodPressure1(bloodPressure1);
		in.setBloodPressure2(bloodPressure2);
		in.setCholesterol(cholesterol);
		in.setDiabetes(diabetes);
		in.setHistory(history);
		in.setSmoking(smoking);

		list.add(in);

		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
		dispatcher.forward(request, response);

	}

}
