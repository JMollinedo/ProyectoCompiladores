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
            System.out.println("Regenerate Lexer? (Y/N)");
            input = scan.nextLine();
            if(!input.toUpperCase().equals("Y") && !input.toUpperCase().equals("N") ){
                System.out.println("ERROR");
                input = null;
            }
        }while(input == null);
        if(input.toUpperCase().equals("Y")){
            System.out.println(".lex file path:");
            input = scan.nextLine();
            File archivo = new File(input);
            jflex.Main.generate(archivo);
        }
        System.out.println("To generate .jar, use Netbeans");
    }
}
