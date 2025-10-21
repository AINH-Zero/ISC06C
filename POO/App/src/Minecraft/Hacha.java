package Minecraft;

class Hacha extends Herramienta{
    private String material;

    public Hacha(String material, String nombre, int durabilidad){
        super("Hacha", durabilidad);
        this.material = material;
    }

    //Getters y Setters
    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public void talarArbol(String arbol){
        if(durabilidad > 0){
            System.out.println("Talanddo un arbol de "+ arbol + " con un " + nombre);
        } else {
            System.out.println("El hacha esta roto, no se puede talar");
        }
    }
}
