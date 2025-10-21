package Minecraft;

class Arco extends Herramienta{
    private String material;

    public Arco(String material, String nombre, int durabilidad){
        super("Arco", durabilidad);
        this.material = material;
    }

    //Getters y Setters
    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public void lanzarFlecha(String objetivo){
        if(durabilidad > 0){
            System.out.println("Lanzando flecha a "+ objetivo + " con un " + nombre);
        } else {
            System.out.println("El arco esta roto, no se puede lanzar flecha");
        }
    }
}