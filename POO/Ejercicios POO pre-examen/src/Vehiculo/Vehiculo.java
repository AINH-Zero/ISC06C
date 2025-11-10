package Vehiculo;

public abstract class Vehiculo {
    public String Marca;
    public String Modelo;
    public float precioBase;

    public Vehiculo (String Marca, String Modelo, Float precioBase){
        this.Marca = Marca;
        this.Modelo = Modelo;
        this.precioBase = precioBase;
    }

    public String getMarca() {
        return Marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public Float getPrecioBase() {
        return precioBase;
    }

    public void setMarca(String marca) {
        Marca = marca;
    }

    public void setModelo(String modelo) {
        Modelo = modelo;
    }

    public void setPrecioBase(float precioBase) {
        this.precioBase = precioBase;
    }

    public abstract float calcularImpuesto();

    public String mostrarDatos(){
        return "Vehiculo marca: " + getMarca() + " modelo: " + getModelo() + " con precio base de: " + getPrecioBase();
    }
}
