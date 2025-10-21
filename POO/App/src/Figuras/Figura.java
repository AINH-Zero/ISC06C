package Figuras;
// Solo hereda
abstract class Figura {
    private String nombreFigura;

    public void setNombre(String nombreFigura){
        this.nombreFigura = nombreFigura;
    }
    public String getNombre(){
        return this.nombreFigura;
    }

    public abstract double calcularArea();

    public abstract double calcularPerimetro();
}
