package Producto;

public abstract class Producto {
    private String nombre;
    private float precioUnitario;
    private int cantidad;

    public Producto(String nombre, float precioUnitario, int cantidad){
    this.nombre = nombre;
    this.precioUnitario = precioUnitario;
    this.cantidad = cantidad;
    }

    public int getCantidad() {
        return cantidad;
    }

    public String getNombre() {
        return nombre;
    }

    public float getPrecioUnitario() {
        return precioUnitario;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPrecioUnitario(float precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public float valorTotal(){
        return getPrecioUnitario() * getCantidad();
    }

    public abstract String mostrarDetalle();
}
