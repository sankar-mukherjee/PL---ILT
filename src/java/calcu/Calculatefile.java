/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calcu;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;

/**
 *
 * @author Sankar
 */
public class Calculatefile {

    String ort;
    String lan;
    String lan1;
    String multitext;

    public void setOrtC(String value) throws UnsupportedEncodingException {
        Charset utf8 = Charset.forName("utf8");
        byte[] encoded = value.getBytes("ISO-8859-1");
        String decoded = new String(encoded, utf8);
        ort = decoded;
    }

    public String getOrtC() {
        return ort;
    }

    public void setLan(String value) {
        lan = value;
    }

    public String getLan() {
        if (lan.equals("bangla")) {
            lan1 = "Bangla";
        } else if (lan.equals("hindi")) {
            lan1 = "Hindi";
        } else {
            lan1 = "a";
        }
        return lan1;
    }

    public String setmultitextC() {
        return multitext;
    }

    public String[] getmultitextC() {
        String delimiter = "[\\s,;]+";              //for any white space,;.
        String[] temp;
        temp = multitext.split(delimiter);


        return temp;
    }
}
