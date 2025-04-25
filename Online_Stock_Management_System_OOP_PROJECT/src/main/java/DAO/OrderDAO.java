package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Order;
import Model.Purchase;

public class OrderDAO {
	private String dbLoc = "jdbc:mysql://localhost:3306/stockfinal";
	private String username = "root";
	private String password = "sahan";

	private static final String addOrderQuery = "INSERT INTO orders (product, qty, total, date) VALUES (?,?,?,?);";
	private static final String selectOrderQuery = "SELECT id, product, qty, total, date FROM orders WHERE id = ?;";
	private static final String deleteOrderQuery = "DELETE FROM orders WHERE id = ?;";
	private static final String displayOrdersQuery = "SELECT * FROM orders;";
	private static final String updateOrderQuery = "UPDATE orders set product = ?, qty = ?, total = ?, date = ? WHERE id = ?;";
	private static final String selectProductsQuery = "SELECT products, supplier FROM purchase_products;";


	public OrderDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(dbLoc, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	//list all orders dao - 11.45 10/10
	public List<Order> selectAllOrders() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Order> orders = new ArrayList<>();

		// Step 1: Establishing a Connection
		try { 
			Connection connection = getConnection();
			PreparedStatement ps = connection.prepareStatement(displayOrdersQuery);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("id");
				String product = rs.getString("product");
				int qty = rs.getInt("qty");
				float total = rs.getFloat("total");
				String date = rs.getString("date");
				orders.add(new Order(id, product, qty, date, total));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return orders;
	}

	
	//insert order
	public void insertOrder(Order order) throws SQLException {
		System.out.println(addOrderQuery);
		
		try {
			Connection connection = getConnection();
			PreparedStatement ps = connection.prepareStatement(addOrderQuery);
			ps.setString(1, order.getProduct());
			ps.setInt(2, order.getQty());
			ps.setDouble(3, order.getTotal());
			ps.setString(4, order.getDate());
			System.out.println(ps);
			ps.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	//Select Product Name - Order Form 
	public List<Purchase> selectPurchaseName() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Purchase> purchase = new ArrayList<>();

		try (Connection connection = getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(selectProductsQuery);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String products = rs.getString("products");
				String supplier = rs.getString("supplier");
				purchase.add(new Purchase(products, supplier));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return purchase;
	}
	
	public Order selectOrder(int id)
	{
		Order order = null;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(selectOrderQuery);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				String product = rs.getString("product");
				int qty = rs.getInt("qty");
				float total = rs.getFloat("total");
				String date = rs.getString("date");
				order = new Order(id, product, qty, date, total);
			}
		}
		catch(SQLException e)
		{
			printSQLException(e);
		}
		
		return order;
	}

	public boolean deleteOrder(int id) throws SQLException 
	{
		boolean delStatus;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(deleteOrderQuery);
			ps.setInt(1, id);
			delStatus = ps.executeUpdate() > 0;
		}
		finally
		{	
		}
		return delStatus;
	}
	
	public boolean updateOrder(Order order) throws SQLException 
	{
		boolean updStatus;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement(updateOrderQuery);
			ps.setString(1,  order.getProduct());
			ps.setInt(2, order.getQty());
			ps.setDouble(3, order.getTotal());
			ps.setString(4, order.getDate());
			ps.setInt(5,  order.getId());
			
			updStatus = ps.executeUpdate() > 0;
		}
		finally
		{
		}
		return updStatus;
	}
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
	


}
