package Carro;

public class Moto extends Car {
    private final boolean tieneCajuela;

    public Moto(String modelo, String marca, int año, boolean tieneCajuela) {
        super(modelo, marca, año);
        this.tieneCajuela = tieneCajuela;
    }

    @Override
    public void arrancar() {
        System.out.println("La moto " + Modelo + " está arrancando.");
    }

    @Override
    public void frenar() {
        System.out.println("La moto " + Modelo + " está frenando.");
    }

    @Override
    public void mostrarInfo() {
        System.out.println("Información de la Moto:");
        System.out.println("Modelo: " + Modelo);
        System.out.println("Marca: " + Marca);
        System.out.println("Año: " + Año);
        System.out.println("Tiene Cajuela: " + (tieneCajuela ? "Sí" : "No"));
    }
    
}
