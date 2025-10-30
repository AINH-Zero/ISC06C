import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

// 1. Define tu clase principal que extiende de Application
public class MainApp extends Application {

    // 2. Este es el método 'start', el punto de entrada de JavaFX
    @Override
    public void start(Stage primaryStage) {
        
        primaryStage.setTitle("Mi Primera Tabla en JavaFX");

        // 3. Crea la Tabla
        TableView<Person> table = new TableView<>();

        // 4. Crea las Columnas
        TableColumn<Person, String> nameCol = new TableColumn<>("Nombre");
        nameCol.setMinWidth(150);
        // 'firstName' DEBE coincidir con el método getFirstName() de la clase Person
        nameCol.setCellValueFactory(new PropertyValueFactory<>("firstName")); 

        TableColumn<Person, String> lastNameCol = new TableColumn<>("Apellido");
        lastNameCol.setMinWidth(150);
        // 'lastName' DEBE coincidir con el método getLastName() de la clase Person
        lastNameCol.setCellValueFactory(new PropertyValueFactory<>("lastName"));

        // 5. Agrega los datos a la tabla
        table.setItems(getPersonData());
        table.getColumns().addAll(nameCol, lastNameCol);

        // 6. Crea la escena y muestra la ventana
        VBox layout = new VBox(10); // Un layout vertical con 10px de espacio
        layout.setPadding(new Insets(10, 10, 10, 10));
        layout.getChildren().add(table);

        Scene scene = new Scene(layout, 320, 300); // Ancho y alto de la ventana
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    // 7. Método para obtener los datos de ejemplo
    public ObservableList<Person> getPersonData() {
        ObservableList<Person> people = FXCollections.observableArrayList();
        people.add(new Person("Ana", "García"));
        people.add(new Person("Juan", "Pérez"));
        people.add(new Person("Luis", "Mendoza"));
        people.add(new Person("Zero", "Núñez")); // ¡Te agregué a la lista!
        return people;
    }

    // 8. Este es el método 'main' que lanza la aplicación
    public static void main(String[] args) {
        launch(args);
    }

    // --- CLASE DE DATOS (MODELO) ---
    // Esta clase representa cada fila de la tabla.
    // Puede estar aquí adentro como 'static' o en su propio archivo Person.java
    public static class Person {
        private String firstName;
        private String lastName;

        public Person(String firstName, String lastName) {
            this.firstName = firstName;
            this.lastName = lastName;
        }

        // --- GETTERS ---
        // PropertyValueFactory los necesita para funcionar.
        public String getFirstName() {
            return firstName;
        }

        public String getLastName() {
            return lastName;
        }

        // --- SETTERS ---
        public void setFirstName(String firstName) {
            this.firstName = firstName;
        }

        public void setLastName(String lastName) {
            this.lastName = lastName;
        }
    }
}