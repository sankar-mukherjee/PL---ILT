/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TTS;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 *
 * @author Sankar
 */
public class Copy {

    public static void copyFileUsingStream() throws IOException {
        File source = new File("D:\\IDE_acceess\\wave.wav");
        File dest = new File("C:\\Users\\Sankar\\Desktop\\IDEWEB necessary\\IDEWeb_31.07.13\\web\\sound\\wave.wav");
        if(dest.exists()){
            dest.delete();
        }
        InputStream is = null;
        OutputStream os = null;
        try {
            is = new FileInputStream(source);
            os = new FileOutputStream(dest);
            byte[] buffer = new byte[1024];
            int length;
            while ((length = is.read(buffer)) > 0) {
                os.write(buffer, 0, length);
            }
        } finally {
            is.close();
            os.close();
        }
    }
    
}
