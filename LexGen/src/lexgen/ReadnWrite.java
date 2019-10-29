/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.List;

/**
 *
 * @author jmoll
 */
public class ReadnWrite {
    public static String readAllText(String path){
        StringBuilder builder = new StringBuilder();
        try {
            List<String> lines = Files.readAllLines(new File(path).toPath(),Charset.forName("ISO-8859-1"));
            for(String s : lines){
                builder = builder.append(s).append("\n");
            }
            return builder.toString();
        } catch (IOException ex) {
            return null;
        }
    }
    
    public static void writeAllText(String path, String content) throws IOException, Exception
    {
        File archivo = new File(path);
        if(archivo.createNewFile()){
            try (FileWriter fw = new FileWriter(archivo,false)) {
                fw.write(content);
                fw.flush();
            }
        }else if(archivo.delete()) {
           archivo.createNewFile();
            try (FileWriter fw = new FileWriter(archivo,false)) {
                fw.write(content);
                fw.flush();
            }
        }else{
            throw new Exception("Can't write " + path + "in this moment" );
        }
    }
    
    public static void deleteFile(String path) throws Exception{
        File archivo = new File(path);
        if(!archivo.delete()){
            throw new Exception("Can't be deleted " + path + "in this moment" );
        }
    }
}
