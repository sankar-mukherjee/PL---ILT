/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calcu;

/**
 *
 * @author Sankar
 */
public class language_identification {

    String[] UNI = {"0980", "09FF", "0900", "097F", "0A00", "0A7F", "0A80", "0AFF", "0B00", "0B7F"};

    /**
    Devanagari (0900-097F) [ Range ]
    Bengali (0980-09FF) [ Range ]
    Gurmukhi (0A00-0A7F) [ Range ]
    Gujarati (0A80-0AFF) [ Range ]
    Oriya (0B00-0B7F) [ Range ]
    Tamil (0B80-0BFF) [ Range ]
    Telugu (0C00-0C7F) [ Range ]
    Kannada (0C80-0CFF) [ Range ]
    Malayalam (0D00-0D7F) [ Range ]
    Sinhala (0D80-0DFF) [ Range ]
     * **/
    public String language_identity(String multitext) {

        String lan = null;

        String[] LL = multitext.split("[\\s,;]+");
        String ss = LL[0].substring(0, 1);
        char s = ss.charAt(0);
        int code = (int) s;

        if (isBetween(code, 2432, 2559)) {
            lan = "bangla";
        } else if (isBetween(code, 2304, 2431)) {
            lan = "hindi";
        }else if (isBetween(code, 2560,2687)) {
            lan = "gurmukhi";
        }else if (isBetween(code, 2688,2815)) {
            lan = "gujarati";
        }else if (isBetween(code, 2816, 2943)) {
            lan = "oriya";
        }else if (isBetween(code, 2944, 3071)) {
            lan = "tamil";
        }else if (isBetween(code, 3072,3199)) {
            lan = "telugu";
        }else if (isBetween(code, 3200, 3327)) {
            lan = "kannada";
        }else if (isBetween(code, 3328, 3455)) {
            lan = "malayalam";
        }else if (isBetween(code, 3456, 3583)) {
            lan = "sinhala";
        }else{
            lan = "ERROR";
        }
        return lan; 
    
    }

    public boolean isBetween(int x, int lower, int upper) {
        return lower <= x && x <= upper;
    }

    public static String native2ascii(String str) {
        String out = "";
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) < 0x80) {
                out += str.charAt(i);
            } else {
                //char[] a = str.charAt(i);
                String u = "" + str.charAt(i);
                // String u = "" + str.charAt(i).toString(16);
                out += (u.length() == 2 ? "00" + u : u.length() == 3 ? "0" + u : u);
            }
        }
        return out;
    }
}
