/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

import java.io.File;
import java.util.Scanner;

/**
 *
 * @author jmoll
 */
public class LexGen {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner scan = new Scanner(System.in);
        String input;
        do{
            System.out.println("1. Compile\n2.Regenerate\nEnter an option");
            input = scan.nextLine();
            if(!input.toUpperCase().equals("1") && !input.toUpperCase().equals("2") ){
                System.out.println("ERROR");
                input = null;
            }
        }while(input == null);
        if(input.toUpperCase().equals("1")){
            System.out.println("The file has been updated");
        }else{
            System.out.println(".lex file path:");
            input = scan.nextLine();
            File archivo = new File(input);
            jflex.Main.generate(archivo);
            System.out.println("To compile, Re-Run this app");
        }
    }
}
