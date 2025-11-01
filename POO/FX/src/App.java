import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.scene.control.Label;
import javafx.scene.control.Button;

public class App extends Application {

    @Override
    public void start(Stage stage) {

        //Crear label
        Label mensaje = new Label("Presiona un boton");

        //Boton para saludar
        Button btnSaludar = new Button("Saludar");
        btnSaludar.setOnAction(e -> mensaje.setText("Hola"));

        //Boton para limpiar
        Button btnLimpiar = new Button("Limpiar");
        btnLimpiar.setOnAction(e -> mensaje.setText(""));

        // 1. Crear una tabla
        TableView<Persona> tabla = new TableView<>();

        // 2. Crear las columnas
        TableColumn<Persona, String> colNombre = new TableColumn<>("Nombre");
        colNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));

        TableColumn<Persona, Integer> colEdad = new TableColumn<>("Edad");
        colEdad.setCellValueFactory(new PropertyValueFactory<>("edad"));
        
        // 3. Agregar las columnas a la tabla (¡Esta línea faltaba en las fotos!)
        tabla.getColumns().addAll(colNombre, colEdad);

        // 4. Crear lista de datos
        ObservableList<Persona> datos = FXCollections.observableArrayList(
                new Persona("Karime", 20),
                new Persona("Issac", 21),
                new Persona("Naoki", 25)
        );

        // 5. Asignar los datos a la tabla
        tabla.setItems(datos);

        // 6. Crear la escena
        VBox root = new VBox(tabla);
        Scene scene = new Scene(root, 300, 200);

        // 7. Configurar y mostrar el Stage (la ventana)
        stage.setTitle("Tabla de personas");
        stage.setScene(scene);
        stage.show();
    }
}