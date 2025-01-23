package application;

public class chart {
	private double total; // Changed from int to double if needed
	private String sdate;

	// Updated constructor
	public chart(String sdate, double total) {
		this.sdate = sdate;
		this.total = total;
	}

	public String getSdate() {
		return sdate;
	}

	public double getTotal() {
		return total;
	}
}
