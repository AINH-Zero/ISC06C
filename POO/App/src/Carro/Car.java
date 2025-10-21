package Carro;

abstract class Car {
    public final String Modelo;
    public final String Marca;
    public final int Año;

    public Car(String modelo, String marca, int año) {
        this.Modelo = modelo;
        this.Marca = marca;
        this.Año = año;
    }

    public abstract void arrancar();
    public abstract void frenar();
    public abstract void mostrarInfo();
}
