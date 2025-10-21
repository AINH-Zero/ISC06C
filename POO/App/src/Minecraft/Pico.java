package Minecraft;

//CLASE PICO
//Heredar de Herramienta -- Herencia
//PoOLIMORFISMO -- Redefinir comportamientos 
class Pico extends Herramienta{
    private  String material; //Atributo propio o diferente de padre

    public Pico(String material,String nombre, int durabilidad){
        // super llama al constructor de herramienta
        super("Pico", durabilidad);
        this.material = material;
    }

    //Getters y Setters
    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    //METODO PROPIO comportamiento especifico de la clase hija
    public void minarBloque(String bloque){
        if (getDurabilidad() > 0){
            System.out.println("Minando Bloque de "+ bloque +" con un "+ nombre);
        }else {
            System.out.println("El pico esta roto.no se puede minar");
        }
    }
}