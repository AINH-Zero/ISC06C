package Minecraft;

public class Inventario {
    private Item Items[] = new Item[36];

    // Constructor vacío, ya que el inventario es simplemente un contenedor.
    public Inventario() {}

    public Item[] getItems() {
        return Items;
    }

    public void setItems(Item[] items) {
        Items = items;
    }

    public void agregarItem(Item item, int posicion) {
        if (posicion >= 0 && posicion < Items.length) {
            Items[posicion] = item;
            System.out.println("Item " + item.getNombre() + " agregado en la posición " + posicion);
        } else {
            System.out.println("Índice fuera de rango");
        }
    }

    public void eliminarItem(int posicion) {
        if (posicion >= 0 && posicion < Items.length && Items[posicion] != null) {
            System.out.println("Item " + Items[posicion].getNombre() + " eliminado de la posición " + posicion);
            Items[posicion] = null;
        } else {
            System.out.println("Índice fuera de rango o posición vacía");
        }
    }

    public void mostrarItems() {
        System.out.println("Contenido del inventario:");
        for (Item item : Items) {
            if (item != null) {
                System.out.println("Item: " + item.getNombre() + ", Tipo: " + item.getTipo() + ", Cantidad: " + item.getCantidad());
            } else {
                System.out.println("Posición vacía");
            }
        }
    }

    public void buscarItem(String nombre){
        for (Item item : Items) {
            if (item.getNombre().equalsIgnoreCase(nombre)) {
                System.out.println("Item encontrado: " + item.getNombre() + ", Tipo: " + item.getTipo() + ", Cantidad: " + item.getCantidad());
                break;
            }
        }
    }
}