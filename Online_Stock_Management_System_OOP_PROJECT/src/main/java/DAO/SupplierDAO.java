package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Supplier;

public class SupplierDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/stockfinal?suppliers=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "sahan";

	private static final String INSERT_SUPPLIERS_SQL = "INSERT INTO suppliers" + "  (name, address, email, phone) VALUES "
			+ " (?, ?, ?, ?);";

	private static final String SELECT_SUPPLIER_BY_ID = "select id,name,address,email,phone from suppliers where id =?";
	private static final String SELECT_ALL_SUPPLIERS = "select * from suppliers";
	private static final String DELETE_SUPPLIERS_SQL = "delete from suppliers where id = ?;";
	private static final String UPDATE_SUPPLIERS_SQL = "update suppliers set name = ?,address= ?, email= ?, phone =? where id = ?;";

	public SupplierDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public void insertSupplier(Supplier supplier) throws SQLException {
		System.out.println(INSERT_SUPPLIERS_SQL);
		
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SUPPLIERS_SQL)) {
			preparedStatement.setString(1, supplier.getName());
			preparedStatement.setString(2, supplier.getAddress());
			preparedStatement.setString(3, supplier.getEmail());
			preparedStatement.setString(4, supplier.getPhone());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Supplier selectSupplier(int id) {
		Supplier supplier = null;
		//  Establishing a Connection
		try (Connection connection = getConnection();

				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SUPPLIER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);

			//  Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			//  Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				supplier = new Supplier(id, name, address, email, phone);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return supplier;
	}

	public List<Supplier> selectAllSuppliers() {

		// using try-with-resources to avoid closing resources (boiler plate code) 
		List<Supplier> suppliers = new ArrayList<>();  //store objects

		// Establishing a Connection
		try (Connection connection = getConnection();

				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SUPPLIERS);) {
			System.out.println(preparedStatement);

			//  Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			//  Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				suppliers.add(new Supplier(id, name, address, email, phone));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return suppliers;
	}

	// delete supplier
	public boolean deleteSupplier(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_SUPPLIERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	// update supplier
	public boolean updateSupplier(Supplier supplier) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_SUPPLIERS_SQL);) {
			statement.setString(1, supplier.getName());
			statement.setString(2, supplier.getAddress());
			statement.setString(3, supplier.getEmail());
			statement.setString(4, supplier.getPhone());
			statement.setInt(5, supplier.getId());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {                         //this ensures only handle SQLexception
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();    //retrieves the cause of the current exception
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
