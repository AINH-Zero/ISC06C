package Figuras;

public class App {
    public static void main(String[] args) {
        Circulo circulo = new Circulo(10);
        circulo.calcularArea();
        circulo.calcularPerimetro();

        Triangulo triangulo = new Triangulo(10,10,10,10);
        triangulo.calcularArea();
        triangulo.calcularPerimetro();

        Rectangulo rectangulo = new Rectangulo(10,5);
        rectangulo.calcularArea();
        rectangulo.calcularPerimetro();
    }
}
