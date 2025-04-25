package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OrderDAO;
import Model.Order;
import Model.Purchase;
//import DAO.PurchaseDAO;
import DAO.ProductDAO;
import Model.Product;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDAO orderDAO;

	public void init() {
		orderDAO = new OrderDAO();
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
			case "/newOrder":
				showNewForm(request, response);
				break;
			case "/insertOrder":
				insertOrder(request, response);
//				showNewForm(request, response);
				break;
			case "/deleteOrder":
				deleteOrder(request, response);
				break;
			case "/editOrder":
				showEditForm(request, response);
				break;
			case "/updateOrder":
				updateOrder(request, response);
				break;
			default:
				listOrder(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	// list purchase
	private void listOrder(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Order> listOrders = orderDAO.selectAllOrders();
		request.setAttribute("listOrders", listOrders);
		RequestDispatcher dispatcher = request.getRequestDispatcher("orders.jsp");
		dispatcher.forward(request, response);
	}

	// show new purchase form
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Read purchase product Name
		List<Purchase> listPurchase = orderDAO.selectPurchaseName();
		request.setAttribute("listPurchase", listPurchase);

		RequestDispatcher dispatcher = request.getRequestDispatcher("order-form.jsp");
		dispatcher.forward(request, response);
	}

	// show edit purchase form
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Order existingOrder = orderDAO.selectOrder(id);
		
		// Read purchase product Name
		List<Purchase> listPurchase = orderDAO.selectPurchaseName();
		request.setAttribute("listPurchase", listPurchase);

		RequestDispatcher dispatcher = request.getRequestDispatcher("order-form.jsp");
		request.setAttribute("order", existingOrder);
		dispatcher.forward(request, response);
	}

	
	private void insertOrder(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		try {
			String products = request.getParameter("purchase");
			int qty = Integer.parseInt(request.getParameter("qty"));
			String date = request.getParameter("date");
			
			ProductDAO productDAO = new ProductDAO();
			Product productOb = productDAO.selectProduct(products);
		//	float total = Float.parseFloat(request.getParameter("total")); - auto total set up done, this is unnecessary 
			double total = Integer.parseInt(request.getParameter("qty")) * productOb.getPrice();
			
			if(qty<1)
			{
				throw new IllegalArgumentException();
			}
			
			Order newOrder = new Order(products, qty, date, total);
			orderDAO.insertOrder(newOrder);
			this.listOrder(request, response);
		} 
		catch (NumberFormatException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
		catch (IllegalArgumentException e)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("errorIFV.jsp");
			dispatcher.forward(request, response);
		}
	}

	
	private void updateOrder(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String products = request.getParameter("purchase");
		int qty = Integer.parseInt(request.getParameter("qty"));
		String date = request.getParameter("date");
		//float total = Float.parseFloat(request.getParameter("total"));
		ProductDAO productDAO = new ProductDAO();
		Product productOb = productDAO.selectProduct(products);
		double total = Integer.parseInt(request.getParameter("qty")) * productOb.getPrice();
		Order editOrder = new Order(id, products, qty, date, total);
		orderDAO.updateOrder(editOrder);
		this.listOrder(request, response);
	}

	// delete purchase product
	private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		orderDAO.deleteOrder(id);
		this.listOrder(request, response);
	}
}
