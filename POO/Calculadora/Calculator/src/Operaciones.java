public class Operaciones {
    private double n1;
    private double n2;
    private double res;

    public Operaciones(double num1, double num2){
        this.n1 = num1;
        this.n2 = num2;
    }

    public double getN1() {
        return n1;
    }
    public void setN1(double n1) {
        this.n1 = n1;
    }

    public double getN2() {
        return n2;
    }
    public void setN2(double n2) {
        this.n2 = n2;
    }

    public double getRes() {
        return res;
    }
    private void setRes(double res) {
        this.res = res;
    }

    public void Sumar() {
        setRes(n1 + n2);
    }
    public void Restar() {
        setRes(n1 - n2);
    }
    public void Multiplicar() {
        setRes(n1 * n2);
    }
    public void Dividir() {
        setRes(n1 / n2);
    }

    public void Potencia() {
        setRes(Math.pow(n1, n2));
    }

    public void Raiz() {
        setRes(Math.sqrt(n1));
    }

    public void Seno() {
        setRes(Math.sin(Math.toRadians(n1)));
    }

    public void Coseno() {
        setRes(Math.cos(Math.toRadians(n1)));
    }

    public void Tangente() {
        setRes(Math.tan(Math.toRadians(n1)));
    }

    public void Logaritmo() {
        setRes(Math.log(n1));
    }

    public void Factorial() {
        double f = 1;
        for (int i = 1; i <= n1; i++) {
            f *= i;
        }
        setRes(f);
    }
}