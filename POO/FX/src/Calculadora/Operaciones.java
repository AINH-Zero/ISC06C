public class Operaciones {
    float n1;
    float n2;
    float res;

    Operaciones(float num1, float num2){
        this.n1 = num1;
        this.n2 = num2;
    }

    public float getN1() {
        return n1;
    }

    public void setN1(float n1) {
        this.n1 = n1;
    }

    public float getN2() {
        return n2;
    }

    public void setN2(float n2) {
        this.n2 = n2;
    }

    public float getRes() {
        return res;
    }

    public void setRes(float res) {
        this.res = res;
    }

    public void Sumar(){
        setRes(getN1() + getN2());
    }

    public void Restar(){
        setRes(getN1() - getN2());
    }

    public void Multiplicar(){
        setRes(getN1() * getN2());
    }

    public void Dividir(){
        setRes(getN1() / getN2());
    }
}
