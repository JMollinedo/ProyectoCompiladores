/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            System.out.println("1. Regenerate JFlex File");
            System.out.println("2. Regenerate JCup File");
            System.out.println("3. Close");
            input = scan.nextLine();
            if(!input.equals("1") && !input.equals("2") && !input.equals("3")){
                System.out.println("ERROR");
                input = null;
            }
        }while(input == null);
        File archivo;
        switch(input){
            case "1":
                System.out.println(".lex file path:");
                input = scan.nextLine();
                archivo = new File(input);
                jflex.Main.generate(archivo);
                break;
            case "2":
                System.out.println(".lex file path:");
                input = scan.nextLine();
                archivo = new File(input);
                jflex.Main.generate(archivo);
                System.out.println(".cup file path:");
                input = scan.nextLine();
                String[] r = {"-parser","Sintax",input};
                try {
                    java_cup.Main.main(r);
                    System.out.println("Syntax.java generated file path:");
                    input = scan.nextLine();
                    System.out.println("Syntax.java destiny file path:");
                    Files.copy(Paths.get(input),Paths.get(scan.nextLine()),StandardCopyOption.REPLACE_EXISTING);
                    Files.delete(Paths.get(input));
                    System.out.println("Sym.java generated file path:");
                    input = scan.nextLine();
                    System.out.println("Sym.java destiny file path:");
                    Files.copy(Paths.get(input),Paths.get(scan.nextLine()),StandardCopyOption.REPLACE_EXISTING);
                    Files.delete(Paths.get(input));
                } catch (IOException ex) {
                    Logger.getLogger(LexGen.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(LexGen.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "3":
                System.out.println("To generate .jar, use Netbeans");
                break;
        }
    }
}
