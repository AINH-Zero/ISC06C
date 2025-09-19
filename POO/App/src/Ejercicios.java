import java.util.Arrays;

public class Ejercicios {
    public static void main(String[] args) {
        /*Imprimir n veces "Hola" */
        int n1 = 7;
        for (int i=1; i<=n1; i++){
            System.out.println(String.valueOf(i) + " Hola");
        }
        /*Imprimir si un numero es "par" o "impar" */
        int num = 47;
        if (num%2 == 0) {
            System.out.println("Par");
        } else {
            System.out.println("Impar");
        }
        /*Contar cuantos positivos, negativos y ceros hay en el arreglo*/
        int arreglo []= {-2,0,3,-1,5};
        int positivos = 0;
        int negativos = 0;
        int cero = 0;
        for (int i=0; i < arreglo.length;i++){
            if (arreglo[i] < 0){
                negativos++;
            } else if (arreglo[i] > 0){
                positivos++;
            } else if (arreglo[i] == 0){
                cero++;
            }
        }
        System.out.println("Son: " + String.valueOf(positivos) + " positivos, "+ String.valueOf(negativos) + " negativos y "+ String.valueOf(cero) + " ceros");
        /*Invertir arreglo */
        int array[] = {10,20,30,40};
        for (int i = array.length -1; i >= 0; i--){
            if (i > 0){
                System.out.print(String.valueOf(array[i])+", ");
            } else {
                System.out.println(String.valueOf(array[i]));
            }
        }
        /*Dado n, imprimir un triangulo de altura n usando * */
        int n2 = 7;
        int temp = 1;
        for (int i = 1; i <= n2; i++){
            for (int j = 1; j <= temp; j++){
                System.out.print("*");
            }
            System.out.print("\n");
            temp++;
        }
        /*Invertir arreglo y guardarlo en otro */
        int array1[] = {10,20,30,40};
        int array2[] = new int[array1.length];
        int recorrido = 0;
        for (int i = array1.length -1; i >= 0; i--){
            array2[recorrido] = array1[i];
            recorrido++;
        }
        System.out.println(Arrays.toString(array2));
    }
}
