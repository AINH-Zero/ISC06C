package Carro;

public class Auto extends Car {
    private final String tipoCombustible;

    public Auto(String modelo, String marca, int año, String tipoCombustible) {
        super(modelo, marca, año);
        this.tipoCombustible = tipoCombustible;
    }

    @Override
    public void arrancar() {
        System.out.println("El auto " + Modelo + " está arrancando.");
    }

    @Override
    public void frenar() {
        System.out.println("El auto " + Modelo + " está frenando.");
    }

    @Override
    public void mostrarInfo() {
        System.out.println("Información del Auto:");
        System.out.println("Modelo: " + Modelo);
        System.out.println("Marca: " + Marca);
        System.out.println("Año: " + Año);
        System.out.println("Tipo de Combustible: " + tipoCombustible);
    }
}
