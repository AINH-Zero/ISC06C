package Vehiculo;

public class Moto extends Vehiculo {
    public final float impuesto = 1.03f;

    public Moto(String Marca, String Modelo, Float precioBase){
        super(Marca,Modelo,precioBase);
    }

    @Override
    public float calcularImpuesto(){
        return getPrecioBase() * impuesto;
    }

    @Override
    public String mostrarDatos(){
        return "Vehiculo marca: " + getMarca() + " modelo: " + getModelo() + " con un impuesto de: " + Math.round((impuesto - 1)*100) + "% con precio base de: " + getPrecioBase();
    }
}
