package Figuras;

public class Rectangulo extends Figura {
    private final double Lado1; //El final la vuelve constante en cuanto se le asigne un valor
    private final double Lado2;

    public Rectangulo(double Lado1, double Lado2) {
        this.Lado1 = Lado1;
        this.Lado2 = Lado2;
    }

    @Override
    public double calcularArea() {
        return Lado1 * Lado2;
    }

    @Override
    public double calcularPerimetro() {
        return (Lado1 * 2) + (Lado2 * 2);
    }
}
