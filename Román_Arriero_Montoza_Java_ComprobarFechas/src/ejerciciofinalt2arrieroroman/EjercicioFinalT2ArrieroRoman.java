/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejerciciofinalt2arrieroroman;

import java.util.Scanner;

/**
 *
 * @author rouma
 */
public class EjercicioFinalT2ArrieroRoman {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
   
        // Introduciomos las variables.
        int dia,mes,año;
        
        // Activacion del scanner para que el usuario pueda meter datos.
        Scanner entrada = new Scanner(System.in);
        //Salida de texto a la consola de java y entrada datos del usuario.
        System.out.print("Introduzca día: ");
        dia = entrada.nextInt();
        System.out.print("Introduzca mes: ");
        mes = entrada.nextInt();
        System.out.print("Introduzca año: ");
        año = entrada.nextInt();
        
        // Usamos sentecia if/else.No son validos años negativos ni 0.
        if (año<=0){
            System.out.println("Fecha incorrecta");
            }else{
        // Febrero se hace aparte por tener 28 dias.
        if(mes==2 && (dia>=1 && dia<=28)){
            System.out.println(dia + "/" + mes + "/" + año+": Fecha correcta");
            }else{
        // Mese que tienen 30 dias.
        if((mes==4 || mes==6 || mes==9 || mes==11) && (dia>=1 && dia<=30)){
            System.out.println(dia + "/" + mes + "/" + año+": Fecha correcta");
            }else{
        // Mese que tienen 31 dias.
        if((mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12) && (dia>=1 && dia<=31)){
            System.out.println(dia + "/" + mes + "/" + año+": Fecha correcta");
            }else{
        // Si no se da ninguno de los casos anteriores.
            System.out.println("Fecha incorrecta");
        }     
            }
            }
        }
        
        
        
    }
    
}
