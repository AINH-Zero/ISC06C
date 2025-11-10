package Producto;

public class Alimento extends Producto {
    String fechaCaducidad;

    public Alimento(String nombre, float precioUnitario, int cantidad, String fechaCaducidad){
        super(nombre, precioUnitario, cantidad);
        this.fechaCaducidad = fechaCaducidad;
    }

    public String getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(String fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }

    @Override
    public String mostrarDetalle() {
        return "Nombre: " + getNombre() + " precio unitario: " + getPrecioUnitario() + " cantidad: " + getCantidad() + " fecha de caducidad: " + getFechaCaducidad();
    }
}
