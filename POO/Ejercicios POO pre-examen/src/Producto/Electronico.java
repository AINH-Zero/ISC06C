package Producto;

public class Electronico extends Producto {
    int garantiaMeses;

    public Electronico(String nombre, float precioUnitario, int cantidad, int garantiaMeses){
        super(nombre, precioUnitario, cantidad);
        this.garantiaMeses = garantiaMeses;
    }

    public int getgarantiaMeses() {
        return garantiaMeses;
    }

    public void setgarantiaMeses(int garantiaMeses) {
        this.garantiaMeses = garantiaMeses;
    }

    @Override
    public String mostrarDetalle() {
        return "Nombre: " + getNombre() + " precio unitario: " + getPrecioUnitario() + " cantidad: " + getCantidad() + " meses de garantia: " + getgarantiaMeses();
    }
}
