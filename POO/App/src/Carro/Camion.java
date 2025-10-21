package Carro;

public class Camion extends Car {
    private final double capacidadCarga;

    public Camion(String modelo, String marca, int año, double capacidadCarga) {
        super(modelo, marca, año);
        this.capacidadCarga = capacidadCarga;
    }

    @Override
    public void arrancar() {
        System.out.println("El camión " + Modelo + " está arrancando.");
    }

    @Override
    public void frenar() {
        System.out.println("El camión " + Modelo + " está frenando.");
    }

    @Override
    public void mostrarInfo() {
        System.out.println("Información del Camión:");
        System.out.println("Modelo: " + Modelo);
        System.out.println("Marca: " + Marca);
        System.out.println("Año: " + Año);
        System.out.println("Capacidad de Carga: " + capacidadCarga + " toneladas");
    }
    
}
