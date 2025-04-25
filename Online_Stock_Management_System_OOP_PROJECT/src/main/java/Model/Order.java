package Model;

public class Order {

	protected int id;
	protected String product;
	protected int qty;
	protected String date;
	protected double total;
	
	public Order(int id, String product, int qty, String date, double total) {
		super();
		this.id = id;
		this.product = product;
		this.qty = qty;
		this.total = total;
		this.date = date;
	}
	
	public Order(String product, int qty, String date, double total) {
		super();
		this.product = product;
		this.qty = qty;
		this.total = total;
		this.date = date;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
