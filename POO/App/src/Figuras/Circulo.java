package Figuras;

public class Circulo extends Figura {
    private final double PI = 3.1416; //El final la vuelve constante en cuanto se le asigne un valor
    private final double radio;

    public Circulo(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return PI * radio * radio;
    }

    @Override
    public double calcularPerimetro() {
        return PI * (radio * 2);
    }
}
