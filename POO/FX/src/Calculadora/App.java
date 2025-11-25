package Calculadora;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class App extends Application{
    @Override
    public void start(Stage stage){
        Button Suma = new Button("Suma");
        Button Resta = new Button("Resta");
        Button Multiplicacion = new Button("Multiplicacion");
        Button Division = new Button("Division");
        Label Resultado = new Label("Resultado");
        TextField num1 = new TextField();
        TextField num2 = new TextField();


        VBox root = new VBox(30); // 30 pixels de espacio entre elementos
        root.getChildren().addAll(num1, num2, Suma, Resta, Multiplicacion, Division, Resultado); // Agregar todos los elementos al VBox
        Scene scene = new Scene(root, 300, 200); // Crear la escena con el VBox como raíz para poder visualizar los elementos en una ventana de 300x200 píxeles
        stage.setScene(scene);
        stage.setTitle("Calculadora Simple AINH");
        stage.show();
    }

    public static void main(String[] args) {
    }
}
