package Figuras;

public class Triangulo extends Figura {
    private final double Base;
    private final double Lado1;
    private final double Lado2;
    private final double Altura;

    public Triangulo(double Base, double Altura, double Lado1, double Lado2) {
        this.Base = Base;
        this.Altura = Altura;
        this.Lado1 = Lado1;
        this.Lado2 = Lado2;
    }

    @Override
    public double calcularArea() {
        return (Base * Altura) / 2;
    }

    @Override
    public double calcularPerimetro() {
        return Base + Lado1 + Lado2;
    }
}
