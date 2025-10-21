package Minecraft;

class Espada extends Herramienta{
    private String material;

    public Espada(String material, String nombre, int durabilidad){
        super("Espada", durabilidad);
        this.material = material;
    }

    //Getters y Setters
    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public void atacar(String enemigo){
        if(durabilidad > 0){
            System.out.println("Atacando a "+ enemigo + " con una " + nombre);
        } else {
            System.out.println("La espada esta rota, no se puede atacar");
        }
    }
}
