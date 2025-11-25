import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;





public class App  extends Application{
    @Override
    public void start(Stage stage){

        Label mensaje = new Label("presiona el boton");

        //Boton para saludar 
        Button btnSaludar = new Button("Saludar");
        btnSaludar.setOnAction(e -> mensaje.setText("hola :)"));

        //Boton de limpiar
        Button btnLimpiar = new Button("Limpiar");
        btnLimpiar.setOnAction(e -> mensaje.setText(""));

        TableView<Persona> tabla = new TableView<>();

        //Crear Columnas
        TableColumn<Persona, String> colNombre = new TableColumn<>("Nombre");
        colNombre.setCellValueFactory(new PropertyValueFactory<>("nombre"));
        
        TableColumn<Persona, Integer> colEdad = new TableColumn<>("Edad");
        colEdad.setCellValueFactory(new PropertyValueFactory<>("edad"));

        //Agregar columnas a la tabla
        tabla.getColumns().addAll(colNombre, colEdad);

        //Crear Lista de datos
        ObservableList<Persona> datos = FXCollections.observableArrayList(
            new Persona("Daniel", 24),
            new Persona("Dante", 20),
            new Persona("Poncho", 22)
        );

        //Asignar valores a la tabla
        tabla.setItems(datos);

        //VBox root  = new VBox(tabla);
        VBox root = new VBox(30);
        root .getChildren().addAll(mensaje, btnSaludar, btnLimpiar);
        //escena
        Scene scene = new Scene (root,300,200);
        stage.setScene(scene);
        stage.setTitle("Ejemplo de botones ");
        stage.show();

        /*Label label = new Label ("Hola desde JAvaFX");
        Scene scene = new Scene (label, 400, 200);
        stage.setTitle("Ejemplo JavaFX");
        stage.setScene(scene);
        stage.show();*/
    }
    public static void main(String[] args) throws Exception {
        launch();
    }
}