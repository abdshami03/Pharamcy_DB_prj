package application;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Rectangle2D;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Screen;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;
import java.util.ResourceBundle;

public class scene implements Initializable {

	@FXML
	private TableView<Customer> Customertable;

	@FXML
	private LineChart<String, Number> graph;

	@FXML
	private TextField EMP_t;
	@FXML
	private TextField SUPP_t;
	@FXML
	private TextField Customers_t;
	@FXML
	private TableColumn<Medicine, String> mType;
	@FXML
	private TableView<Medicine> Date;
	@FXML
	private TableView<sales> invoicemed;
	@FXML
	private CategoryAxis xAxis;
	@FXML
	private NumberAxis yAxis;
	@FXML
	private TableColumn<Invoice_med, Integer> invid;
	@FXML
	private TableColumn<sales, Integer> quantity;
	@FXML
	private TableColumn<sales, String> medid;
	@FXML
	private TableColumn<Medicine, String> Exp;
	@FXML
	private TableColumn<Medicine, String> type;
	@FXML
	private TableColumn<Medicine, Integer> mid;
	@FXML
	private TableColumn<Customer, Integer> cid;
	@FXML
	private TableColumn<Customer, String> name;
	@FXML
	private TableColumn<Customer, Integer> age;
	@FXML
	private TableColumn<Customer, String> gender;
	@FXML
	private TableColumn<Customer, Integer> insid;
	@FXML
	private TableColumn<Customer, Long> phone;

	@FXML
	void dash(ActionEvent event) {

	}

	private void populateLineChart(LineChart<String, Number> lineChart, CategoryAxis xAxis, NumberAxis yAxis,
			ArrayList<chart> chartData) {
		XYChart.Series<String, Number> series = new XYChart.Series<>();

		for (chart data : chartData) {
			series.getData().add(new XYChart.Data<>(data.getSdate(), data.getTotal()));
		}

		lineChart.getData().add(series);
	}

	@Override
	public void initialize(URL url, ResourceBundle resourceBundle) {
		// Set up table columns for Customer data (unchanged)
		cid.setCellValueFactory(new PropertyValueFactory<Customer, Integer>("cid"));
		name.setCellValueFactory(new PropertyValueFactory<Customer, String>("cname"));
		age.setCellValueFactory(new PropertyValueFactory<Customer, Integer>("age"));
		gender.setCellValueFactory(new PropertyValueFactory<Customer, String>("gender"));
		phone.setCellValueFactory(new PropertyValueFactory<Customer, Long>("phone"));
		insid.setCellValueFactory(new PropertyValueFactory<Customer, Integer>("insid"));

		// Set counts in TextFields (unchanged)
		EMP_t.setText(String.valueOf(Data.pharm_count));
		SUPP_t.setText(String.valueOf(Data.m_count));
		Customers_t.setText(String.valueOf(Data.Cust_count));

		// Table setup for Medicines and Sales (unchanged)
		mid.setCellValueFactory(new PropertyValueFactory<Medicine, Integer>("mid"));
		mType.setCellValueFactory(new PropertyValueFactory<Medicine, String>("mType"));
		Exp.setCellValueFactory(new PropertyValueFactory<Medicine, String>("expiryDate"));
		medid.setCellValueFactory(new PropertyValueFactory<sales, String>("mType"));
		quantity.setCellValueFactory(new PropertyValueFactory<sales, Integer>("totalAmount"));

		// Initialize observable lists with null checks
		ObservableList<Customer> people = FXCollections
				.observableArrayList(Data.dataCustomer != null ? Data.dataCustomer : new ArrayList<>());
		ObservableList<Medicine> expiry = FXCollections
				.observableArrayList(Data.datadates != null ? Data.datadates : new ArrayList<>());
		ObservableList<sales> sale = FXCollections
				.observableArrayList(Data.medicineResults != null ? Data.medicineResults : new ArrayList<>());

		// Set table items
		invoicemed.setItems(sale);
		Customertable.setItems(people);
		Date.setItems(expiry);

		// Initialize XYChart.Series for the line chart with correct types: String for
		// X, Number for Y
		XYChart.Series<String, Number> series = new XYChart.Series<>();
		series.setName("Data Series");

		// Populate the series with data points from Data.chart
		if (Data.chart != null) {
			for (chart dataPoint : Data.chart) {
				// Get the x and y values from the chart class
				String xValue = dataPoint.getSdate(); // Get date as String for x-axis
				Number yValue = dataPoint.getTotal(); // Get total as Number for y-axis

				// Create a new data point and add it to the series
				XYChart.Data<String, Number> point = new XYChart.Data<>(xValue, yValue);
				series.getData().add(point);
			}
		}

		// Add the series to the line chart
		graph.getData().add(series);
	}

	public void callRecord(javafx.event.ActionEvent actionEvent)
			throws IOException, SQLException, ClassNotFoundException {
		Data.getdata();
		Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("csutomer.fxml")));
		Rectangle2D screenBounds = Screen.getPrimary().getVisualBounds();

		System.out.println(screenBounds.getWidth());
		System.out.println(screenBounds.getHeight());
		Scene scene = new Scene(root);
		Data.stage.setScene(scene);
		Data.stage.show();

	}

	public void callorder(javafx.event.ActionEvent actionEvent) throws IOException {

		Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("order.fxml")));
		Rectangle2D screenBounds = Screen.getPrimary().getVisualBounds();

		System.out.println(screenBounds.getWidth());
		System.out.println(screenBounds.getHeight());
		Scene scene = new Scene(root);
		Data.stage.setScene(scene);
		Data.stage.show();

	}

	public void callnew(javafx.event.ActionEvent actionEvent) throws IOException {

		Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("sell.fxml")));
		Rectangle2D screenBounds = Screen.getPrimary().getVisualBounds();

		System.out.println(screenBounds.getWidth());
		System.out.println(screenBounds.getHeight());
		Scene scene = new Scene(root);
		Data.stage.setScene(scene);
		Data.stage.show();

	}

	public void exit(javafx.event.ActionEvent actionEvent) throws IOException {

		Data.stage.close();

	}

}
