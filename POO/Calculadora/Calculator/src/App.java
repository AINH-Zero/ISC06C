import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class App extends Application {
    Operaciones operacion = new Operaciones(0, 0);
    Label Resultado = new Label("Resultado:");

    @Override
    public void start(Stage stage) {
        TextField num1 = new TextField();
        num1.setPromptText("N1 / Ángulo");
        TextField num2 = new TextField();
        num2.setPromptText("N2 (si aplica)");
        Button btnSuma = new Button("+");
        Button btnResta = new Button("-");
        Button btnMulti = new Button("x");
        Button btnDiv = new Button("/");
        Button btnPow = new Button("N1^N2");
        Button btnSqrt = new Button("√ N1");
        Button btnSin = new Button("Sin(N1)");
        Button btnCos = new Button("Cos(N1)");
        Button btnTan = new Button("Tan(N1)");
        Button btnLog = new Button("ln(N1)");
        Button btnFact = new Button("N1!");
        Button btnClear = new Button("Cero");

        // Configuración de tamaño de botones con for each
        Button[] todosLosBotones = {btnSuma, btnResta, btnMulti, btnDiv, btnPow, btnSqrt, btnSin, btnCos, btnTan, btnLog, btnFact, btnClear};
        for (Button b : todosLosBotones) {
            b.setPrefWidth(60);
        }

        btnSuma.setOnAction(e -> calcular(num1, num2, "SUMA"));
        btnResta.setOnAction(e -> calcular(num1, num2, "RESTA"));
        btnMulti.setOnAction(e -> calcular(num1, num2, "MULTI"));
        btnDiv.setOnAction(e -> calcular(num1, num2, "DIV"));
        btnPow.setOnAction(e -> calcular(num1, num2, "POW"));
        btnSqrt.setOnAction(e -> calcular(num1, num2, "SQRT"));
        btnSin.setOnAction(e -> calcular(num1, num2, "SIN"));
        btnCos.setOnAction(e -> calcular(num1, num2, "COS"));
        btnTan.setOnAction(e -> calcular(num1, num2, "TAN"));
        btnLog.setOnAction(e -> calcular(num1, num2, "LOG"));
        btnFact.setOnAction(e -> calcular(num1, num2, "FACT"));
        btnClear.setOnAction(e -> {
            num1.clear();
            num2.clear();
            Resultado.setText("Resultado: ");
        });

        GridPane grid = new GridPane();
        grid.setAlignment(Pos.CENTER);
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(20));
        grid.add(new Label("N1:"), 0, 0);
        grid.add(num1, 1, 0, 3, 1); // Columna 1, Fila 0, Extiende 3 columnas, Extiende 1 fila
        grid.add(new Label("N2:"), 0, 1);
        grid.add(num2, 1, 1, 3, 1);
        grid.add(btnSuma, 0, 2);
        grid.add(btnResta, 1, 2);
        grid.add(btnMulti, 2, 2);
        grid.add(btnDiv, 3, 2);
        grid.add(btnSin, 0, 3);
        grid.add(btnCos, 1, 3);
        grid.add(btnTan, 2, 3);
        grid.add(btnPow, 3, 3);
        grid.add(btnLog, 0, 4);
        grid.add(btnSqrt, 1, 4);
        grid.add(btnFact, 2, 4);
        grid.add(btnClear, 3, 4);

        VBox root = new VBox(20);
        root.setAlignment(Pos.CENTER);
        root.getChildren().addAll(grid, Resultado);
        Scene scene = new Scene(root, 400, 350);
        stage.setScene(scene);
        stage.setTitle("Calculadora Científica - AINH_Zero");
        stage.show();
    }

    private void calcular(TextField t1, TextField t2, String tipo) {
        try {
            double v1 = Double.parseDouble(t1.getText());
            operacion.setN1(v1);
            if (!t2.getText().isEmpty()) {
                operacion.setN2(Double.parseDouble(t2.getText()));
            }

            switch (tipo) {
                case "SUMA" -> operacion.Sumar();
                case "RESTA" -> operacion.Restar();
                case "MULTI" -> operacion.Multiplicar();
                case "DIV" -> {
                    if (operacion.getN2() == 0) {
                        Resultado.setText("Error: Div por 0");
                        return;
                    }
                    operacion.Dividir();
                }
                case "POW" -> operacion.Potencia();
                case "SQRT" -> {
                    if(v1 < 0) { Resultado.setText("Error: Raíz neg"); return; }
                    operacion.Raiz();
                }
                case "SIN" -> operacion.Seno();
                case "COS" -> operacion.Coseno();
                case "TAN" -> operacion.Tangente();
                case "LOG" -> operacion.Logaritmo();
                case "FACT" -> operacion.Factorial();
            }
            Resultado.setText("Resultado: " + operacion.getRes());
        } catch (Exception ex) {
            Resultado.setText("Error");
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}