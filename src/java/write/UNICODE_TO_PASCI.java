package write;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import TTS.TTS;
import TTS.Copy;
import java.io.IOException;

/***
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Sankar
 */
public class UNICODE_TO_PASCI {

    //String ort;
    //String pos;
    ///String mea;
    //String lan;
    String lan1;
    String make2;
    String type2;
    String make3;
    String type3;
    String atr;
    String multitext;
    ArrayList<Integer> pon;
    ArrayList<Integer> ion;
    String[] byline;
    String[] byword;
    int nn;
    static String[] PHONEME = {
        "A", "A0", "A1", "A10", "A2", "A20", "I", "I0", "I2", "I20", "I1", "I10", "I3", "I30", "U", "U0", //16
        "U1", "U10", "U2", "U20", "U3", "U30", "R2", "R3", "E", "E0", "E3", "E30", "E4", "E40", "E5", "E50", //16
        "O", "O0", "O2", "O20", "O1", "O10", "O3", "O30", "E1", "E2", "E10", "E20", "K", "K1", "G", "G1", "N2", "C",//18
        "C1", "J", "J1", "N3", "T0", "T10", "D0", "D10", "N1", "T", "T1", "D", "D1", "N", "P", "P1", //16
        "B", "B1", "M", "J2", "R", "L", "S1", "S", "S3", "H", "Y", "R0", "R10", "N4", "H1", "N5", "NG0", "W", "-", "Z1", "N6"//21
    };
    static String[] PHONEME_H = {
        "P", "B", "P1", "B1", "T", "D", "T1", "D1", "T0", "D0", "T10", "D10", "C", "J",//14
        "C1", "J1", "K", "G", "K1", "G1", "K2", "M", "N", "N1", "P2", "S", "J2", "S1",//14
        "K12", "G2", "H", "W", "Y", "R", "L", "I", "I2", "A", "U", "U2", "I1", "I3", "E",//15
        "E3", "A1", "A2", "O", "O2", "A3", "A4", "U1", "U3", "E4", "E5", "O1", "O3", "-"//14
    };
    int Phoneme_length = 87;
    String[] ARRANGED_PH = new String[Phoneme_length];
    int[] STATE = new int[Phoneme_length];
    int Phoneme_length_H = 57;
    String[] ARRANGED_PH_H = new String[Phoneme_length_H];
    int[] STATE_H = new int[Phoneme_length_H];

    public String UNI2PASCI(String Uword, int wordlen) {
        int index, second_char;
        int first_char = 0;
        String Pw = "";
        Uword = Uword.concat("a");
        for (index = 0; index <= wordlen; index++) {
            if (index == 0) {
                first_char = 32;
                second_char = (int) Uword.charAt(index);
            } else {
                second_char = (int) Uword.charAt(index);
            }

            switch (first_char) {

                case 2433:
                    Pw = Pw.concat("N5");
                    break;
                case 2434:
                    Pw = Pw.concat("N4");
                    break;
                case 2435:
                    Pw = Pw.concat("H1");
                    break;
                case 2437:
                    Pw = Pw.concat("A");
                    break;
                case 2438:
                    Pw = Pw.concat("A1");
                    break;
                case 2494:
                    Pw = Pw.concat("A2");
                    break;
                case 2439:
                    Pw = Pw.concat("I");
                    break;
                case 2495:
                    Pw = Pw.concat("I2");
                    break;
                case 2440:
                    Pw = Pw.concat("I1");
                    break;
                case 2496:
                    Pw = Pw.concat("I3");
                    break;
                case 2441:
                    Pw = Pw.concat("U");
                    break;
                case 2442:
                    Pw = Pw.concat("U1");
                    break;
                case 2497:
                    Pw = Pw.concat("U2");
                    break;
                case 2498:
                    Pw = Pw.concat("U3");
                    break;
                case 2443:
                    Pw = Pw.concat("R2");
                    break;
                case 2499:
                    Pw = Pw.concat("R3");
                    break;
                case 2447:
                    Pw = Pw.concat("E");
                    break;
                case 2503:
                    Pw = Pw.concat("E3");
                    break;
                case 2448:
                    Pw = Pw.concat("E4");
                    break;
                case 2504:
                    Pw = Pw.concat("E5");
                    break;
                case 2451:
                    Pw = Pw.concat("O");
                    break;
                case 2507:
                    Pw = Pw.concat("O2");
                    break;
                case 2452:
                    Pw = Pw.concat("O1");
                    break;
                case 2508:
                    Pw = Pw.concat("O3");
                    break;
                ///////////////////////////k/////////////////////
                case 2453:
                    Pw = Pw.concat("K");
                    break;
                case 2454:
                    Pw = Pw.concat("K1");
                    break;
                case 2455:
                    Pw = Pw.concat("G");
                    break;
                case 2456:
                    Pw = Pw.concat("G1");
                    break;
                case 2457:  // modified on 02.02.09 by J.Basu
                    if ((int) Uword.charAt(index) != 2509) {
                        Pw = Pw.concat("N2");
                    } else if ((int) Uword.charAt(index) == 2509 && (int) Uword.charAt(index + 1) == 2455) {  // for N2-G
                        Pw = Pw.concat("N6");
                        second_char = (int) Uword.charAt(index + 2);
                        index = index + 2;
                    } else {
                        Pw = Pw.concat("N2"); // added dt 03.03.10
                    }
                    break;

                //////////////////////c///////////////////////
                case 2458:
                    Pw = Pw.concat("C");
                    break;
                case 2459:
                    Pw = Pw.concat("C1");
                    break;
                case 2460:
                    Pw = Pw.concat("J");
                    break;
                case 2461:
                    Pw = Pw.concat("J1");
                    break;
                case 2462:
                    Pw = Pw.concat("N3");
                    break;
                ///////////////////T0///////////////////////
                case 2463:
                    Pw = Pw.concat("T0");
                    break;
                case 2464:
                    Pw = Pw.concat("T10");
                    break;

                case 2465:
                    if (second_char == 2492) {
                        Pw = Pw.concat("R0");
                    } else {
                        Pw = Pw.concat("D0");
                    }
                    break;
                case 2524:
                    Pw = Pw.concat("R0");
                    break;

                case 2466:
                    if (second_char == 2492) {
                        Pw = Pw.concat("R10");
                    } else {
                        Pw = Pw.concat("D10");
                    }
                    break;

                case 2525:
                    Pw = Pw.concat("R10");
                    break;

                case 2467:
                    Pw = Pw.concat("N1");
                    break;
                /////////////////////////T//////////////
                case 2468:
                    Pw = Pw.concat("T");
                    break;
                case 2469:
                    Pw = Pw.concat("T1");
                    break;
                case 2470:
                    Pw = Pw.concat("D");
                    break;
                case 2471:
                    Pw = Pw.concat("D1");
                    break;
                case 2472:
                    Pw = Pw.concat("N");
                    break;
                ////////////////////P/////////////
                case 2474:
                    Pw = Pw.concat("P");
                    break;
                case 2475:
                    Pw = Pw.concat("P1");
                    break;

                case 2476:
                    if (second_char == 2492) {
                        Pw = Pw.concat("R");
                    } else {
                        Pw = Pw.concat("B");
                    }
                    break;

                case 2477:
                    Pw = Pw.concat("B1");
                    break;
                case 2478:
                    Pw = Pw.concat("M");
                    break;

                ////////////////j-S1//////////////
                case 2479:
                    if (second_char == 2492) {
                        Pw = Pw.concat("Y");
                    } else {
                        Pw = Pw.concat("J2");
                    }
                    break;
                case 2480:
                    Pw = Pw.concat("R");
                    break;
                case 2482:
                    Pw = Pw.concat("L");
                    break;
                case 2486:
                    Pw = Pw.concat("S1");
                    break;
                case 2487:
                    Pw = Pw.concat("S3");
                    break;
                //////////////////
                case 2488:
                    Pw = Pw.concat("S");
                    break;
                case 2489:
                    Pw = Pw.concat("H");
                    break;
                case 2510:
                    Pw = Pw.concat("T-");
                    break;


                case 2527:
                    Pw = Pw.concat("Y");
                    break;
                case 2509:
                    Pw = Pw.concat("-");
                    break;
                case 8204:
                    Pw = Pw.concat("Z1");
                    break;  // Non Zero ; by J.Basu

            }//end of switch
            first_char = second_char;
        }//end of for
        return Pw;
    }

    public void Initialization() {

        int no_of_phonemes = 0, index, length, len;
        for (length = 3; length > 0; length--) {
            for (index = 0; index < Phoneme_length; index++) {
                len = PHONEME[index].length();
                if (len == length) {
                    ARRANGED_PH[no_of_phonemes] = PHONEME[index];
                    STATE[no_of_phonemes] = index;
                    no_of_phonemes = no_of_phonemes + 1;
                }
            }
        }

    }

    public void Initialization_H() {

        int no_of_phonemes = 0, index, length, len;
        for (length = 3; length > 0; length--) {
            for (index = 0; index < Phoneme_length_H; index++) {
                len = PHONEME_H[index].length();
                if (len == length) {
                    ARRANGED_PH_H[no_of_phonemes] = PHONEME_H[index];
                    STATE_H[no_of_phonemes] = index;
                    no_of_phonemes = no_of_phonemes + 1;
                }
            }
        }

    }

//    public void setOrt(String value) throws UnsupportedEncodingException {
////        Charset utf8 = Charset.forName("utf8");
////        byte[] encoded = value.getBytes("ISO-8859-1");
////        String decoded = new String(encoded, utf8);
//        ort = value;
//    }
//    public void setMea(String value) {
//        mea = value;
//    }
    public void setMake2(String value) {
        make2 = value;
    }

    public void setType2(String value) {
        type2 = value;
    }

    public void setMake3(String value) {
        make3 = value;
    }

    public void setType3(String value) {
        type3 = value;
    }

    public void setatr(String value) {
        atr = value;
    }

    public String getatr() {
//        String[] results = atr.split(",\\s*");
//        Set<String> set = new HashSet<String>();
//
//    for(int i=0; i < results.length; i++){
//      if(set.contains(results[i])){
//        System.out.println("Duplicate string found at index " + i);
//      } else {
//        set.add(results[i]);
//      }
//    }
//String a = set.toString();

        return atr;
    }

    public String getMake2() {
        return make2;
    }

    public String getType2() {
        return type2;
    }

    public String getMake3() {
        return make3;
    }

    public String getType3() {
        return type3;
    }

    public String getLanguage(String ortho, String lang) throws SQLException {
        int index = 0;
        String sss = "";
        String connectionURL = "jdbc:mysql://localhost:3306/ide?useUnicode=true&characterEncoding=UTF-8";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        ArrayList<Integer> grapheme = new ArrayList<Integer>();
        ArrayList<String> ipa = new ArrayList<String>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = (Connection) DriverManager.getConnection(connectionURL, "root", "root");
            String resultString = "SELECT * FROM " + lang + "_g2p";
            statement = (Statement) connection.createStatement();
            rs = statement.executeQuery(resultString);
            while (rs.next()) {
                char s = rs.getString(3).charAt(0);
                int code = (int) s;
                grapheme.add(code);
                ipa.add(rs.getString(2));
            }
        } catch (Exception ex) {
            System.out.println("Unable to connect to Database." + ex.getMessage());
            //System.out.println(rs);
        } finally {
            rs.close();
            statement.close();
            connection.close();
        }

        System.out.println(ipa.get(0) + "///////" + ortho.charAt(0));
        for (int i = 0; i < ortho.length(); i++) {
            char p = ortho.charAt(i);
            int code1 = (int) p;
            index = printIndexes(grapheme, code1);
            System.out.println(index + "----");
            sss = sss.concat(ipa.get(index));
        }
        System.out.println(sss);
        return sss;
    }

    private int printIndexes(ArrayList<Integer> grapheme, int ch) {
        int index = 0;
        for (int i = 0; i < grapheme.size(); i++) {
            if (ch == grapheme.get(i)) {
                index = i;
                break;
            }
        }
        return index;
    }

    public String getPon(String ortho, String pos, String lang) throws SQLException, IOException {
        String ss = null;
        if (lang.equals("bangla")) {
            String w = UNI2PASCI(ortho, ortho.length());
            Initialization();
            pon = Conversion(w);
            int a = pon.size();
            a = Add_vowel_A(pon, a);
            a = rule_of_N3(pon, a);
            a = Remove_halant(pon, a);
            a = rule_of_NonZero(pon, a);
            a = rule_of_ri(pon, a);
            a = word_final_A(pon, a);
            a = rule_of_jafala(pon, a);
            a = rule_of_Cluster(pon, a);
            a = rule_of_J_N3(pon, a);
            a = rule_of_Bfala(pon, a);
            a = rule_of_Mfala(pon, a);
            a = rule_of_Rfala(pon, a);
            a = rule_of_Ha(pon, a);
            a = rule_of_KS3(pon, a);
            a = rule_of_Sh(pon, a);
            a = rule_of_Bisarga(pon, a);
            a = rule_of_Onasar(pon, a);
            a = rule_of_Aspirated(pon, a);
            a = rule_of_A(pon, a);
            a = rule_of_AA(pon, a);
            a = rule_of_Candrabindu(pon, a);
            a = rule_of_N6(pon, a);
            a = rule_of_Adj(pon, a, pos);
            a = rule_of_verb(pon, a, pos);
            a = rule_of_ioito(pon, a);
            a = rule_of_Y(pon, a);
//        int yy = rule_of_oya(pon, xx);
            ArrayList aa = Num2Ipa(pon);
            ss = Arraylist2String(aa);
//            TTS TTS1 = new TTS();
//            TTS1.Pon(ortho);
//            Copy copy = new Copy();
//            Copy.copyFileUsingStream();
            
        } //        else if (lang.equals("hindi")) {
        //            String w = UNI2PASCI_H(ortho, ortho.length());
        //            Initialization_H();
        //            pon = Conversion_H(w);
        //            int a = Add_vowel_A_H(pon, pon.size());
        //            ArrayList aa = Num2Ipa_H(pon);
        //            ss = Arraylist2String(aa);
        //        }
        else {
            ss = getLanguage(ortho, lang);

        }
        return ss;
    }

    public void setMultitext(String value) throws UnsupportedEncodingException {
//        Charset utf8 = Charset.forName("utf8");
//        byte[] encoded = value.getBytes("ISO-8859-1");
//        String decoded = new String(encoded, utf8);
        multitext = value;
    }

    public String getMultitext() {
//        String delimiter = ",";
//        mmm = multitext.split(" ") ;
//        multitext = mmm[0];

        return multitext;
    }

    public void setByline(String[] value) throws UnsupportedEncodingException {
//        Charset utf8 = Charset.forName("utf8");
//        for(int i=0;i<value.length;i++){
//            byte[] encoded = value[i].getBytes("ISO-8859-1");
//            String decoded = new String(encoded, utf8);
//            byline[i] = decoded;
//        }
//        byte[] encoded = value.getBytes("ISO-8859-1");
//        String decoded = new String(encoded, utf8);
//        ort = decoded;
        byline = value;
    }

    public String[] getByline() {
        byline = multitext.split("[\u09f7\\.]");
        return byline;
    }

    public void setByword(String[] value) {
        byword = value;
    }

    public String[] getByword() {
        byword = multitext.split("[\\s,;]+");
        return byword;
    }

    public ArrayList Num2IpaN(ArrayList<Integer> INword) {
        int len, i;
        ArrayList ipa = new ArrayList();
        len = INword.size();
        for (i = 0; i <= len - 1; i++) {
            int a = INword.get(i);
            switch (a) {

                case 0:
                case 2:
                case 4:
                    ipa.add(i, "a");                           //A2,A1
                    break;
                case 1:
                case 3:
                case 5:
                    ipa.add(i, "an");                     //A20
                    break;
                case 6:
                case 8:
                case 10:
                case 12:
                    ipa.add(i, "i");                           //I,I1,I3,I2
                    break;
                case 9:
                case 13:
                    ipa.add(i, "in");                           //I30
                    break;
                case 14:
                case 16:
                case 18:
                case 20:
                    ipa.add(i, "u");                           //U,U1,U2,U3
                    break;
                case 19:
                    ipa.add(i, "un");                           //U20
                    break;
                case 22:
                case 23:
                    ipa.add(i, "ri");                     //R2,R3
                    break;
                case 24:
                case 26:
                    ipa.add(i, "e");                           //E,E3
                    break;
                case 28:
                case 30:
                    ipa.add(i, "oi");                     //E4,E5
                    break;
                case 32:
                case 34:
                    ipa.add(i, "o");                           //O,O2
                    break;
                case 35:
                    ipa.add(i, "on");                           //O20
                    break;
                case 36:
                case 38:
                    ipa.add(i, "ou");                     //O1,O3
                    break;
                case 44:
                    ipa.add(i, "k");                           //K
                    break;
                case 45:
                    ipa.add(i, "kh");                     //K1
                    break;
                case 46:
                    ipa.add(i, "g");                           //G
                    break;
                case 47:
                    ipa.add(i, "gh");                     //G1
                    break;
                case 48:
                    ipa.add(i, "n");                           //N2
                    break;
                case 49:
                    ipa.add(i, "ch");                           //C
                    break;
                case 50:
                    ipa.add(i, "chh");                     //C1
                    break;
                case 51:
                    ipa.add(i, "j");                           //J
                    break;
                case 52:
                    ipa.add(i, "jh");                     //J1
                    break;
                case 54:
                    ipa.add(i, "t");                           //T0
                    break;
                case 55:
                    ipa.add(i, "th");                     //T10
                    break;
                case 56:
                    ipa.add(i, "d");                           //D0
                    break;
                case 57:
                    ipa.add(i, "dh");                     //D10
                    break;
                case 58:
                    ipa.add(i, "n");                           //N1
                    break;
                case 59:
                    ipa.add(i, "t");                           //T
                    break;
                case 60:
                    ipa.add(i, "th");                     //T1
                    break;
                case 61:
                    ipa.add(i, "d");                           //D
                    break;
                case 62:
                    ipa.add(i, "dh");                     //D1
                    break;
                case 63:
                    ipa.add(i, "n");                           //N
                    break;
                case 64:
                    ipa.add(i, "p");                           //P
                    break;
                case 65:
                    ipa.add(i, "ph");                     //P1
                    break;
                case 66:
                    ipa.add(i, "b");                           //B
                    break;
                case 67:
                    ipa.add(i, "bh");                     //B1
                    break;
                case 68:
                    ipa.add(i, "m");                           //M
                    break;
                case 69:
                    ipa.add(i, "j");                           //J2
                    break;
                case 70:
                    ipa.add(i, "r");                           //R
                    break;
                case 71:
                    ipa.add(i, "l");                           //L
                    break;
                case 72:
                case 74:
                case 73:
                    ipa.add(i, "s");                           // s
                    break;
                case 75:
                    ipa.add(i, "h");                           //H
                    break;
                case 76:
                    ipa.add(i, "y");                           //Y
                    break;
                case 77:
                    ipa.add(i, "r");                           //R0
                    break;
                case 78:
                    ipa.add(i, "r");                     //R10
                    break;
                case 83:
                    ipa.add(i, "o");                           //W
                    break;
                case 87:
                    ipa.add(i, "s");                     //small s
                    break;






                case 40:
                    ipa.add(i, "\u00E6");                           //E1
                    break;
                case 42:
                    ipa.add(i, "\u00E6\u0303");                     //E10
                    break;

                case 86:
                    ipa.add(i, "\u014B\u0067");                     //N6
                    break;

                default:
                    ipa.add(i, "X");
            }
            len = INword.size();
        }
        return (ipa);
    }

    public ArrayList Conversion(String word) {
        int found = 0, count = 0, lnx = 0;
        int ln1 = word.length();
        int[] Phword = new int[ln1];
        for (int c = 0; c <= ln1 - 1; c++) {
            Phword[c] = 100;
        }
        int no_of_phon = 0;
        int pos1;
        while (ln1 > 0) {
            found = 0;
            count = 0;
            while ((count < Phoneme_length) && (found == 0)) {
                pos1 = word.indexOf(ARRANGED_PH[count]);
                if (pos1 == 0) {
                    found = 1;
                    Phword[no_of_phon] = STATE[count];
                    no_of_phon = no_of_phon + 1;
                    word = word.replaceFirst(ARRANGED_PH[count], "");
                    lnx = lnx + 1;
                    /**********************************/
                }
                count = count + 1;
            }
            /***********************************/
            ln1 = word.length();
        }

        ArrayList<Integer> al = new ArrayList();

        for (int i = 0; i <= lnx - 1; i++) {
            al.add(i, Phword[i]);
        }
        return (al);
    }

    public ArrayList Conversion_H(String word) {
        int found = 0, count = 0, lnx = 0;
        int ln1 = word.length();
        int[] Phword = new int[ln1];
        for (int c = 0; c <= ln1 - 1; c++) {
            Phword[c] = 100;
        }
        int no_of_phon = 0;
        int pos1;
        while (ln1 > 0) {
            found = 0;
            count = 0;
            while ((count < Phoneme_length_H) && (found == 0)) {
                pos1 = word.indexOf(ARRANGED_PH_H[count]);
                if (pos1 == 0) {
                    found = 1;
                    Phword[no_of_phon] = STATE_H[count];
                    no_of_phon = no_of_phon + 1;
                    word = word.replaceFirst(ARRANGED_PH_H[count], "");
                    lnx = lnx + 1;
                    /**********************************/
                }
                count = count + 1;
            }
            /***********************************/
            ln1 = word.length();
        }

        ArrayList<Integer> al = new ArrayList();

        for (int i = 0; i <= lnx - 1; i++) {
            al.add(i, Phword[i]);
        }
        return (al);
    }

    public int Add_vowel_A(ArrayList<Integer> INword, int no_of_char) //Rule 000
    {
        int current, next, count;
        for (count = 0; count <= no_of_char - 1; count++) {
            current = INword.get(count);

            if ((count + 1) <= no_of_char - 1) {
                next = INword.get(count + 1);
            } else {
                next = -1;
            }

            if ((current >= 44 && current <= 78 || current == 86) && ((next >= 44 && next <= 81 || next == 86) || (next == -1)))//CC-CVC   // current!=48 ; added on 27.01.09
            {

                INword.add(count + 1, 0);


            } else if ((current >= 44 && current <= 78 || current == 86) && ((next == 2) || (next == 6) || (next == 10) || (next == 14) || (next == 16) || (next == 24) || (next == 28) || (next == 32) || (next == 36)))//CV->CVV
            {

                INword.add(count + 1, 0);

            }
            no_of_char = INword.size();
        }
        no_of_char = INword.size();

        return (no_of_char);

    }

    public int rule_of_N3(ArrayList<Integer> INword, int nochar) // Rule 5
    {
        int current, prev, j, i, next;
        for (j = 0; j <= nochar - 1; j++) {
            current = INword.get(j);

            if (j - 1 >= 0) {
                prev = INword.get(j - 1);
            } else {
                prev = -1;
            }

            if (j + 1 <= nochar - 1) {
                next = INword.get(j + 1);
            } else {
                next = -1;
            }

            if ((current == 53) && (next == 84)) {
                INword.set(j, 63); //'N'
                INword.remove(j + 1);
            }
            if ((prev != 84) && (current == 53) && (next == 4 || next == 8 || next == 12 || next == 18 || next == 20 || next == 23 || next == 26 || next == 30 || next == 34 || next == 38)) {
                INword.set(j, 76);  //'Y'
            }
            nochar = INword.size();
        }
        nochar = INword.size();
        return (nochar);
    }

    public int Remove_halant(ArrayList<Integer> INword, int no_of_letter) //Rule 001
    {
        int a = 0, i = 0;
        while (INword.contains(84)) {
            a = INword.indexOf(84);
            INword.remove(a);
            i++;
        }
        int no_of_rh = INword.size();
        return (no_of_rh);
    }

    public int rule_of_NonZero(ArrayList<Integer> INword, int noch) // Rule 21  dt 01.10.08 by J.Basu
    {
        int current, prev1, prev2, prev3, prev4, nz, i, next1, next2, next3;
        for (nz = 0; nz <= noch - 1; nz++) {
            current = INword.get(nz);
            if (nz - 1 >= 0) {
                prev1 = INword.get(nz - 1);
            } else {
                prev1 = -1;
            }

            if (nz - 2 >= 0) {
                prev2 = INword.get(nz - 2);
            } else {
                prev2 = -1;
            }

            if (nz - 3 >= 0) {
                prev3 = INword.get(nz - 3);
            } else {
                prev3 = -1;
            }

            if (nz - 4 >= 0) {
                prev4 = INword.get(nz - 4);
            } else {
                prev4 = -1;
            }

            if (nz + 1 <= noch - 1) {
                next1 = INword.get(nz + 1);
            } else {
                next1 = -1;
            }

            if (nz + 2 <= noch - 1) {
                next2 = INword.get(nz + 2);
            } else {
                next2 = -1;
            }

            if (nz + 3 <= noch - 1) {
                next3 = INword.get(nz + 3);
            } else {
                next3 = -1;
            }

            if (current == 85 && next1 == 69 && next2 == 4) // for Z1JA2   eg RE1LI2
            {

                INword.set(nz, 40);  // E1

            } else if (current == 85 && next1 == 69 && next2 != 4) // for Z1J
            {

                INword.set(nz, 40);  // E1

            } else if (current == 85) // for Z1
            {
                INword.remove(nz);
            }

            noch = INword.size();
        } // end for loop
        noch = INword.size();
        return (noch);
    }

    /************
    a)	If a consonant without any ligature is preceded by a consonant with ligature R2(ri) the hidden A becomes O.
    b)	If R2 is present in word medially then the consonant will be reduplicated
    
     */
    public int rule_of_ri(ArrayList<Integer> INword, int no_of_char) // Rule 2
    {
        int current, next, next1, next2, next3, ri, prev1, prev2;

        for (ri = 0; ri <= no_of_char - 1; ri++) {
            current = INword.get(ri);

            if (ri + 1 <= no_of_char - 1) {
                next = INword.get(ri + 1);
            } else {
                next = -1;
            }
            if (ri + 2 <= no_of_char - 1) {
                next1 = INword.get(ri + 2);
            } else {
                next1 = -1;
            }

            if (ri + 3 <= no_of_char - 1) {
                next2 = INword.get(ri + 3);
            } else {
                next2 = -1;
            }
            if (ri + 4 <= no_of_char - 1) {
                next3 = INword.get(ri + 4);
            } else {
                next3 = -1;
            }

            if (ri - 1 >= 0) {
                prev1 = INword.get(ri - 1);
            } else {
                prev1 = -1;
            }

            if (ri - 2 >= 0) {
                prev2 = INword.get(ri - 2);
            } else {
                prev2 = -1;
            }

            if (current == 23) {

                if ((next >= 44 && next <= 78 || next == 86) && (next1 == 0) && (next2 == -1)) {
                    INword.set(ri + 2, 34);

                }
                if ((next >= 44 && next <= 78 || next == 86) && (next1 >= 44 && next1 <= 78 || next1 == 86) && (next2 == 0)) {
                    INword.set(ri + 3, 34);
                }
                if ((next >= 44 && next <= 78 || next == 86) && (next1 >= 44 && next1 <= 78 || next1 == 86) && (next2 >= 44 && next2 <= 78 || next2 == 86) && (next3 == 0)) {
                    INword.set(ri + 4, 34);
                }

            }

            if ((ri != 1) && (current == 23) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (!(prev2 >= 44 && prev2 <= 78 || prev2 == 86))) {
                INword.add(ri, INword.get(ri - 1));
            }
        }
        no_of_char = INword.size();

        return (no_of_char);
    }

    /*******************************************************************************************
    a)	For the consonant having no ligature in the word final position the hidden A is omitted.
    b)	For the consonant cluster without ligature in the word final the hidden A is pronounced as O
     ****************************************************************************************/
    public int word_final_A(ArrayList<Integer> INword, int no_of_char) // Rule 1
    {
        int final_letter = 0, prev1, prev2, prev3, prev4;
        if (!INword.isEmpty()) {
            final_letter = INword.get(no_of_char - 1);
        }
        if (no_of_char - 1 > 0) {
            prev1 = INword.get(no_of_char - 2);
        } else {
            prev1 = -1;
        }

        if (no_of_char - 2 > 0) {
            prev2 = INword.get(no_of_char - 3);
        } else {
            prev2 = -1;
        }
        if (no_of_char - 3 > 0) {
            prev3 = INword.get(no_of_char - 4);
        } else {
            prev3 = -1;
        }
        if (no_of_char - 4 > 0) {
            prev4 = INword.get(no_of_char - 5);
        } else {
            prev4 = -1;
        }

        if ((final_letter == 0) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (prev2 >= 44 && prev2 <= 78 || prev2 == 86)) //CCA
        {
            INword.set(no_of_char - 1, 34);
        } else if ((final_letter == 0) && (prev1 == 75) && (!(prev2 >= 44 && prev2 <= 78 || prev2 == 86))) {
            INword.set(no_of_char - 1, 34);  //34 = 'O2)
        } else if ((final_letter == 0) && (prev1 == 53) && (!(prev2 >= 44 && prev2 <= 78 || prev2 == 86))) // final consonent N3 then the hidden A pronounced as A ;11.09.08
        {
            INword.set(no_of_char - 1, 0);  // 0 ='A'
        } else if ((final_letter == 0) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (!(prev2 >= 44 && prev2 <= 78 || prev2 == 86))) {
            INword.remove(no_of_char - 1);
        }
        no_of_char = INword.size();
        return (no_of_char);

    }

    /**********
    a)	Jafala , without any ligature when present in the middle or end of a word the hidden A becomes O
    b)	In case of H-J2 word medially or word finally H is replaced by JJ1
    c)	If a word initial consonant is written with Jafala with ligature A and Jafala with ligature A2 then the vowels becomes E1
    d)	Jafala with any ligature presents medially or finally in a word, it reduplicates the consonant if it is not in a consonant cluster. Incase of initial consonant is not reduplicates.
     */
    public int rule_of_jafala(ArrayList<Integer> INword, int noch) // Rule 3
    {
        int current, prev1, prev2, prev3, prev4, ja, i, next, next1;
        for (ja = 0; ja <= noch - 1; ja++) {
            current = INword.get(ja);
            if (ja - 1 >= 0) {
                prev1 = INword.get(ja - 1);
            } else {
                prev1 = -1;
            }

            if (ja - 2 >= 0) {
                prev2 = INword.get(ja - 2);
            } else {
                prev2 = -1;
            }

            if (ja - 3 >= 0) {
                prev3 = INword.get(ja - 3);
            } else {
                prev3 = -1;
            }

            if (ja - 4 >= 0) {
                prev4 = INword.get(ja - 4);
            } else {
                prev4 = -1;
            }

            if (ja + 1 <= noch - 1) {
                next = INword.get(ja + 1);
            } else {
                next = -1;
            }

            if (ja + 2 <= noch - 1) {
                next1 = INword.get(ja + 2);
            } else {
                next1 = -1;
            }

            if ((current == 69) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (prev2 >= 44 && prev2 <= 78 || prev2 == 86) && (prev3 >= 44 && prev3 <= 78 || prev3 == 86)) {
                if ((ja == 3) && ((next == 0) || (next == 4))) {
                    INword.remove(ja);
                    INword.set(ja, 40);

                } else if ((next == 0) && (next1 == -1)) {
                    INword.remove(ja);
                    INword.set(ja, 34);
                }
            } else if ((current == 69) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (prev2 >= 44 && prev2 <= 78 || prev2 == 86)) {
                if ((ja == 2) && ((next == 0) || (next == 4))) {
                    INword.remove(ja);
                    INword.set(ja, 40);

                } else if ((next == 0) && (next1 == -1)) {
                    INword.remove(ja);
                    INword.set(ja, 34);
                } else {
                    INword.remove(ja);
                }
            } else if ((current == 69) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86)) {
                if ((ja == 1) && ((next == 0) || (next == 4))) {
                    INword.remove(ja);
                    INword.set(ja, 40);
                } else if ((ja == 1) && ((next == 18) || (next == 20))) {
                    INword.remove(ja);
                } else if ((ja == 1) && ((next == 26))) {
                    INword.remove(ja);
                } //more to be added ri,oi,i
                else {

                    if (ja > 1) {
                        if (next == 0) {
                            INword.set(ja + 1, 34);  // if it is 40 ie E1 then few cases it will correct; dt 03.03.10
                        }
                        if (prev1 == 75) {
                            INword.set(ja - 1, 51);//j
                            INword.set(ja, 52);//j1
                        } else if (prev1 == 47) {
                            INword.set(ja - 1, 46);
                            INword.set(ja, 47);
                        } else if (prev1 == 57) {
                            INword.set(ja - 1, 56);
                            INword.set(ja, 57);
                        } else if (prev1 == 62) {
                            INword.set(ja - 1, 61);
                            INword.set(ja, 62);
                        } else if (prev1 == 67) {
                            INword.set(ja - 1, 66);
                            INword.set(ja, 67);
                        } else if (prev1 == 70) {
                            INword.set(ja - 1, 70);
                            INword.set(ja, 51);
                        } else if (prev1 == 86) {
//                            INword.set(ja - 1, 86);                //for bango with jafala last
                            INword.remove(ja);
                        } else {
                            INword.set(ja, INword.get(ja - 1));
                        }
                    }
                    if ((next == -1)) {
//                        INword.remove(ja);
                        INword.add(ja + 1, 34);
                    }
                }
            }

            noch = INword.size();
        }
        noch = INword.size();
        return (noch);

    }

    public int rule_of_Cluster(ArrayList<Integer> INword, int clnt) //Rule 4
    {
        int current, next, next1, next2, k, next3;
        for (k = 0; k <= clnt - 1; k++) {
            current = INword.get(k);
            if (k + 1 <= clnt - 1) {
                next = INword.get(k + 1);
            } else {
                next = -1;
            }

            if (k + 2 <= clnt - 1) {
                next1 = INword.get(k + 2);
            } else {
                next1 = -1;
            }
            if (k + 3 <= clnt - 1) {
                next2 = INword.get(k + 3);
            } else {
                next2 = -1;
            }
            if (k + 4 <= clnt - 1) {
                next3 = INword.get(k + 4);
            } else {
                next3 = -1;
            }


            if ((current == 72) && (next == 71) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 64) && (next == 71) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 73) && (next == 45) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 73) && (next == 64) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 73) && (next == 66) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 59) && (next == 66) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 61) && (next == 66) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 62) && (next == 66) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 72) && (next == 66) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 72) && (next == 68) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 73) && (next == 68) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 44) && (next == 74) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 59) && (next == 70) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current == 44) && (next == 70) && (next1 == 0) && (k == 0)) {
                INword.set(k + 2, 0);

            } else if ((current >= 44 && current <= 78 || current == 86) && (next == 70) && (next1 == 0) && (next2 == 76)) {
                INword.set(k + 2, 34); // dt 24.09.08 by J.Basu
            } else if ((current >= 44 && current <= 78 || current == 86) && (next >= 44 && next <= 78 || next == 86)
                    && (next1 == 0) && (k == 0) && (next2 >= 44 && next2 <= 78 || next2 == 86)
                    && ((next3 == 34) || (next3 == 8) || (next3 == 12) || (next3 == 18) || (next3 == 20) || (next3 == 26))) {
                INword.set(k + 2, 34);
            }
            clnt = INword.size();
        }
        clnt = INword.size();
        return (clnt);
    }

    /*************
    a)	J-N3 is replaced by the consonant G and the following vowel is nasalised if it is in word initial. Also if J-N3 appears word medially or finally, it will be replaced by G-G.
    b)	If J-N3 is followed by A2 word initially or medially, it is pronounced with E10 and.
     */
    public int rule_of_J_N3(ArrayList<Integer> INword, int nochar) // Rule 6
    {
        int current, prev, j, i, next;
        for (j = 0; j <= nochar - 1; j++) {
            current = INword.get(j);

            if (j - 1 >= 0) {
                prev = INword.get(j - 1);
            } else {
                prev = -1;
            }
            if (j + 1 <= nochar - 1) {
                next = INword.get(j + 1);
            } else {
                next = -1;
            }

            if ((current == 53) && (prev == 51)) {
                if (j == 1) {
                    INword.remove(j - 1);
                    INword.set(j - 1, 46);//g
                    if (next == 4) {
                        INword.set(j, 42);
                    }
                } else if (j != nochar - 1) {
                    INword.set(j - 1, 46);//g
                    INword.set(j, 46);//g
                    if (next == 4) {
                        INword.set(j + 1, 42);
                    }
                } else {
                    INword.set(j - 1, 46);//g
                    INword.set(j, 46);//g
                }
            }
            nochar = INword.size();
        }
        nochar = INword.size();
        return (nochar);
    }

    /*************
    a) For triple cluster appear whose last consonant is   /b-phala/, then   /b-phala/ is not pronounced.
    b) The   [/b-ligature/] when in cluster with other consonant present in a word initially it is not pronounced.
    d) When   [/b-ligature/] with any consonant other than   /h/, g, m present in a word medially or finally, it reduplicates the adjacent consonant and   /b/ is not pronounced.
    c) When   [/b-ligature/] with consonant   /h/ is present medially /hb/ cluster becomes /bH/ and a new vowel is introduced before /bH/. If the preceding vowel is   [/ /] or /a/, the new vowel is /o/ and if it is /i/ then the new vowel is /u/.[dipthongization]
     */
    public int rule_of_Bfala(ArrayList<Integer> INword, int bcount) //Rule 7
    {
        int ba, current, prev1, prev2, i;
        for (ba = 0; ba <= bcount - 1; ba++) {
            current = INword.get(ba);
            if (ba - 1 >= 0) {
                prev1 = INword.get(ba - 1);
            } else {
                prev1 = -1;
            }

            if (ba - 2 >= 0) {
                prev2 = INword.get(ba - 2);
            } else {
                prev2 = -1;
            }


            if ((current == 66) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (prev2 >= 44 && prev2 <= 78 || prev2 == 86)) {
                INword.remove(ba);
            } else if ((current == 66) && (ba == 1) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86)) {
                INword.remove(ba);
            } else if ((current == 66) && (ba != 1) && ((prev1 >= 44 && prev1 <= 69) || (prev1 >= 71 && prev1 <= 78) || prev1 == 86)) {
                if ((prev1 != 75) && (prev1 != 46) && (prev1 != 68)) {
                    INword.set(ba, INword.get(ba - 1));
                }
            }
            if ((current == 66) && (ba != 1) && (prev1 == 75)) {
                INword.set(ba, 67);
                if ((prev2 == 0) || (prev2 == 4) || (prev2 == 2)) {
                    INword.set(ba - 1, 32);

                }
                if ((prev2 == 8) || (prev2 == 12) || (prev2 == 6) || (prev2 == 10)) {
                    INword.set(ba - 1, 18);
                }

            }

            bcount = INword.size();
        }
        bcount = INword.size();
        return (bcount);
    }

    /************
    a)	If   [/m-ligature/] presents in a triple cluster, it is not pronounced the next vowel is nasalized.
    b)	If   [/m-ligature/] presents in a word initially, it is not pronounced the next vowel is nasalized.
    c)	If   [/m-ligature/] is present in word medially or finally with the consonants   /k/,   /t/,   /d/,   /s/,   /sh/, /dh/, the preceding consonant is geminated.
     */
    public int rule_of_Mfala(ArrayList<Integer> INword, int mcnt) //Rule 8
    {
        int ma, current, prev1, prev2, next;
        for (ma = 0; ma <= mcnt - 1; ma++) {
            current = INword.get(ma);
            if (ma - 1 >= 0) {
                prev1 = INword.get(ma - 1);
            } else {
                prev1 = -1;
            }

            if (ma - 2 >= 0) {
                prev2 = INword.get(ma - 2);
            } else {
                prev2 = -1;
            }

            if (ma + 1 <= mcnt - 1) {
                next = INword.get(ma + 1);
            } else {
                next = -1;
            }

            if ((current == 68) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (prev2 >= 44 && prev2 <= 78 || prev2 == 86)) {
                if (prev1 == 74 && prev2 == 44) {            //lokhhi khh
                    INword.set(ma - 1, 45);
                    INword.set(ma, INword.get(ma + 1) + 1);
                    INword.remove(ma + 1);
                } else {
                    INword.set(ma, INword.get(ma + 1) + 1);
                    INword.remove(ma + 1);
                }

            } else if ((current == 68) && (ma == 1) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86)) {
                if (next == 23) {
                    INword.set(ma, 23);                 // smriti  ri
                    INword.set(ma + 1, 9);
                } else {
                    INword.set(ma, INword.get(ma + 1) + 1);
                    INword.remove(ma + 1);
                }
            } else if ((current == 68) && (ma != 1) && ((prev1 == 44) || (prev1 == 59) || (prev1 == 61) || (prev1 == 73) || (prev1 == 72) || (prev1 == 62))) {
                INword.set(ma, INword.get(ma - 1));
            }
            mcnt = INword.size();
        }
        mcnt = INword.size();
        return (mcnt);
    }

    /*********
    a)	If   [/r-ligature/] presents in a word medially or finally, the preceding consonant in the cluster reduplicated.
     */
    public int rule_of_Rfala(ArrayList<Integer> INword, int rcnt) //Rule 9
    {
        int ra, current, prev1, prev2;
        for (ra = 0; ra <= rcnt - 1; ra++) {
            current = INword.get(ra);
            if (ra - 1 >= 0) {
                prev1 = INword.get(ra - 1);
            } else {
                prev1 = -1;
            }

            if (ra - 2 >= 0) {
                prev2 = INword.get(ra - 2);
            } else {
                prev2 = -1;
            }

            if ((current == 70) && (ra != 1) && (prev1 >= 44 && prev1 <= 78 || prev1 == 86) && (!(prev2 >= 44 && prev2 <= 78 || prev2 == 86))) // dt 12.11.08 by J.Basu
            {
                INword.add(ra, INword.get(ra - 1));
            }

            rcnt = INword.size();
        }
        rcnt = INword.size();

        return (rcnt);
    }

    /***************
    a)	If h present with cluster /n/,/n1/,/l/ then the h is not pronounced and the next consonant is reduplicated.
    b)	If h present with cluster,/m/ then the position of the consonant is interchange and h become /bh/
     */
    public int rule_of_Ha(ArrayList<Integer> INword, int hcnt) //Rule 10
    {
        int ha, current, prev1, next;
        for (ha = 0; ha <= hcnt - 1; ha++) {
            current = INword.get(ha);
            if (ha - 1 >= 0) {
                prev1 = INword.get(ha - 1);
            } else {
                prev1 = -1;
            }
            if (ha + 1 <= hcnt - 1) {
                next = INword.get(ha + 1);
            } else {
                next = -1;
            }


            if ((current == 75) && ((next == 71) || (next == 63) || (next == 58))) {
                INword.set(ha, INword.get(ha + 1));
            }
            if ((current == 75) && (next == 68)) {

                INword.set(ha, INword.get(ha + 1));
                INword.set(ha + 1, 67);
            }
            hcnt = INword.size();
        }
        hcnt = INword.size();
        return (hcnt);
    }

    /************
    a)	If k-sh in cluster is present then it is pronounced as k-kh non-initially and initially kh
    b)	If it is in triple cluster then k-sh become kh;
     */
    public int rule_of_KS3(ArrayList<Integer> INword, int kscnt) //Rule 11
    {

        int ksa, current, prev1, prev2, next;
        for (ksa = 0; ksa <= kscnt - 1; ksa++) {
            current = INword.get(ksa);
            if (ksa - 1 >= 0) {
                prev1 = INword.get(ksa - 1);
            } else {
                prev1 = -1;
            }
            if (ksa - 2 >= 0) {
                prev2 = INword.get(ksa - 2);
            } else {
                prev2 = -1;
            }
            if (ksa + 1 <= kscnt - 1) {
                next = INword.get(ksa + 1);
            } else {
                next = -1;
            }
            if ((current == 74) && (prev1 == 44) && (next >= 44 && next <= 78 || next == 86)) {                 //lokhhi
                INword.set(ksa, 45);
            } else if ((current == 74) && (prev1 == 44) && (prev2 >= 44 && prev2 <= 78 || prev2 == 86) && (!(next >= 44 && next <= 78 || next == 86))) {
                INword.set(ksa, 45);                                                                             //akankha
                INword.remove(ksa - 1);
            } else if ((current == 74) && (prev1 == 44) && (ksa == 1)) {
                INword.set(ksa - 1, 45);
                INword.remove(ksa);
            } else if ((current == 74) && (prev1 == 44) && (ksa != 1)) {
                INword.set(ksa, 45);
            }
            kscnt = INword.size();
        }
        kscnt = INword.size();
        return (kscnt);
    }

    /*************
    a)	In Bangla whenever S1, S3, S is there they are pronounced as S1 but if s/s1/s3 whenever in cluster with t, t1, n, r, l they will be pronounced as s and if S is there word initially in cluster with k, k1, p, p1 it will be pronounced as s.
     */
    public int rule_of_Sh(ArrayList<Integer> INword, int shcnt) //Rule 17
    {
        int sh, current, next, prev;
        for (sh = 0; sh <= shcnt - 1; sh++) {
            current = INword.get(sh);
            if (sh + 1 <= shcnt - 1) {
                next = INword.get(sh + 1);
            } else {
                next = -1;
            }

            if (sh - 1 >= 0) {
                prev = INword.get(sh - 1);
            } else {
                prev = -1;
            }
            if (((current == 73) || (current == 72)) && ((next == 59) || (next == 23) || (next == 60) || (next == 63) || (next == 70) || (next == 71))) {
                INword.set(sh, 73);     //modified for onusmriti
            } else if (((current == 73) || (current == 72)) && (sh == 0) && ((next == 44) || (next == 45) || (next == 64) || (next == 65))) {
                INword.set(sh, 73);
            } else if (((current == 73) || (current == 72) || (current == 74)) && ((next == 73) || (next == 72) || (next == 74))) {
                INword.set(sh, 72);     ////modified for onusmriti
            } else if (((current == 73) || (current == 72) || (current == 74)) && ((prev == 73) || (prev == 72) || (prev == 74))) {
                INword.set(sh, 72);     ////modified for onusmriti
            } else if ((current == 73) || (current == 72) || (current == 74)) {
                INword.set(sh, 72);     ////modified for onusmriti
            }
//exception : mofossol
            shcnt = INword.size();
        }
        shcnt = INword.size();
        return (shcnt);
    }

    /*************
    a)	If there is bisarga in the in the middle of a word, the following consonant (with out cluster) is reduplicated.
    b)	If there is bisargo at the end of a word, and the preceding consonant is with out ligature then it pronounced with O
     */
    public int rule_of_Bisarga(ArrayList<Integer> INword, int bicnt) //Rule 15
    {
        int bi, current, next, next1, next2, prev1, prev2;
        for (bi = 0; bi <= bicnt - 1; bi++) {

            current = INword.get(bi);

            if (bi + 1 <= bicnt - 1) {
                next = INword.get(bi + 1);
            } else {
                next = -1;
            }
            if (bi + 2 <= bicnt - 1) {
                next1 = INword.get(bi + 2);
            } else {
                next1 = -1;
            }

            if (bi + 3 <= bicnt - 1) {
                next2 = INword.get(bi + 3);
            } else {
                next2 = -1;
            }


            if (bi - 1 >= 0) {
                prev1 = INword.get(bi - 1);
            } else {
                prev1 = -1;
            }

            if (bi - 2 >= 0) {
                prev2 = INword.get(bi - 2);
            } else {
                prev2 = -1;
            }

            if ((current == 80) && (next >= 44 && next <= 78 || next == 86) && (!(next1 >= 44 && next1 <= 78 || next1 == 86))) {
                INword.set(bi, INword.get(bi + 1));
            } else if ((current == 80) && (next == -1)) {
                if (prev1 == 0) {
                    INword.set(bi - 1, 34);
                    INword.remove(bi);
                }
            } else if (current == 80) {
                INword.remove(bi);
            }
            bicnt = INword.size();
        }
        bicnt = INword.size();
        return (bicnt);
    }

    //It the word final is a consonant without any ligature, and onusar precedes it, then the consonant shall have /o/ as the successor vowel
    public int rule_of_Onasar(ArrayList<Integer> INword, int oncnt) //Rule 16
    {
        int f = 0, prev;
        if (!INword.isEmpty()) {
            f = INword.get(INword.size() - 1);
        }
        if (oncnt - 1 >= 0) {
            prev = INword.get(oncnt - 2);
        } else {
            prev = -1;
        }

        if ((f >= 44 && f <= 78 || f == 86) && (prev == 79)) {
            INword.add(oncnt, 34);
        }

        int a = 0, i = 0;
        while (INword.contains(79)) {
            a = INword.indexOf(79);
            INword.set(a, 48);
            i++;
        }

        oncnt = INword.size();

        return (oncnt);
    }

    /**********
    a)	In the case of gemination of aspirated consonant, like  /kH/ /gH/ /cH/ /jH/ /tH/ /dH/ /tH/ /dH/, the first component of the reduplication shall be replaced by its un-aspirated counter part /k/ /g/ /c/ /j/ /t/ /d/ /t/ /d/ respectively.
     */
    public int rule_of_Aspirated(ArrayList<Integer> INword, int ascnt) //Rule 18
    {
        int as, current, next;
        for (as = 0; as <= ascnt - 1; as++) {
            current = INword.get(as);
            if (as + 1 <= ascnt - 1) {
                next = INword.get(as + 1);
            } else {
                next = -1;
            }

            if ((current == 45) && (next == 45)) {
                INword.set(as, 44);
            }
            if ((current == 47) && (next == 47)) {
                INword.set(as, 46);
            }
            if ((current == 50) && (next == 50)) {
                INword.set(as, 49);
            }
            if ((current == 52) && (next == 52)) {
                INword.set(as, 51);
            }
            if ((current == 55) && (next == 55)) {
                INword.set(as, 54);
            }
            if ((current == 57) && (next == 57)) {
                INword.set(as, 56);
            }
            if ((current == 60) && (next == 60)) {
                INword.set(as, 59);
            }
            if ((current == 62) && (next == 62)) {
                INword.set(as, 61);
            }
            if ((current == 65) && (next == 65)) {
                INword.set(as, 64);
            }
            if ((current == 67) && (next == 67)) {
                INword.set(as, 66);
            }
            if ((current == 78) && (next == 78)) {
                INword.set(as, 77);
            }
            /*if((current==72)&&(next==72))
            {
            INword[as]=73;
            }*/

            ascnt = INword.size();
        }
        ascnt = INword.size();
        return (ascnt);
    }

    /////////////////////////////////Vowel rule////////////////////
    /**********
    a)	If A  is followed by /i/ or  /u/ (as the next vowels) or consonant cluster like    /kS/,   /dz÷ / or   [Cy == C ], it will be pronounced as   /o/.
    b)	If the word initial is /h/ and the /e-kar/ is there with the next consonant, /ha/ is pronounced with /ho/. Exception /habe/, /holo/.
     */
    public int rule_of_A(ArrayList<Integer> INword, int acnt) //Rule 13
    {
        int aa, current, next, next1, next2, next3;
        for (aa = 0; aa <= acnt - 1; aa++) {
            current = INword.get(aa);
            if (aa + 1 <= acnt - 1) {
                next = INword.get(aa + 1);
            } else {
                next = -1;
            }

            if (aa + 2 <= acnt - 1) {
                next1 = INword.get(aa + 2);
            } else {
                next1 = -1;
            }

            if (aa + 3 <= acnt - 1) {
                next2 = INword.get(aa + 3);
            } else {
                next2 = -1;
            }
            if (aa + 4 <= acnt - 1) {
                next3 = INword.get(aa + 4);
            } else {
                next3 = -1;
            }

            // modified on 22.01.09 by J.Basu

            if ((current == 0) && (next >= 44 && next <= 79 || next == 81 || next == 86) && (next1 >= 44 && next1 <= 79 || next1 == 81 || next1 == 86) && (next2 >= 44 && next2 <= 79 || next2 == 81 || next2 == 86) && ((next3 == 8) || (next3 == 12) || (next3 == 18) || (next3 == 20) || (next3 == 69))) {
                INword.set(aa, 34);
            } else if ((current == 0) && (next >= 44 && next <= 79 || next == 81 || next == 86) && (next1 >= 44 && next1 <= 79 || next1 == 81 || next1 == 86) && ((next2 == 8) || (next2 == 12) || (next2 == 18) || (next2 == 20) || (next2 == 69))) {
                INword.set(aa, 34);
            } else if ((current == 0) && (next >= 44 && next <= 79 || next == 81 || next == 86) && ((next1 == 8) || (next1 == 12) || (next1 == 18) || (next1 == 20) || (next1 == 69))) {
                INword.set(aa, 34);
            } else if ((current == 0) && (((next == 44) && (next1 == 74 || next == 81 || next == 86)) || ((next == 51) && (next1 == 53)))) {
                INword.set(aa, 34);
            } else if ((current == 0) && ((next == 6) || (next == 10) || (next == 14) || (next == 16))) {
                INword.set(aa, 34);
            }
            acnt = INword.size();
        }
        acnt = INword.size();
        return (acnt);
    }

    /*************
    a)	If a word begins with a or aa separately or with a consonant, the hidden a in the consonant grapheme in the second position without ligature becomes/o/ if the next grapheme is not a /y/.
     */
    public int rule_of_AA(ArrayList<Integer> INword, int aacnt) //Rule 14
    {

        int aaa, current, next, next1, next2, next3;
        for (aaa = 0; aaa <= aacnt - 1; aaa++) {
            current = INword.get(aaa);
            if (aaa + 1 <= aacnt - 1) {
                next = INword.get(aaa + 1);
            } else {
                next = -1;
            }

            if (aaa + 2 <= aacnt - 1) {
                next1 = INword.get(aaa + 2);
            } else {
                next1 = -1;
            }
            if (aaa + 3 <= aacnt - 1) {
                next2 = INword.get(aaa + 3);
            } else {
                next2 = -1;
            }
            if (aaa + 4 <= aacnt - 1) {
                next3 = INword.get(aaa + 4);
            } else {
                next3 = -1;
            }
            if (((current == 0) || (current == 2) || (current == 4)) && (next >= 44 && next <= 78 || next == 86) && (next1 >= 44 && next1 <= 78 || next1 == 86) && (next2 == 0) && (next3 != 76)) {
                INword.set(aaa + 3, 34);
            } else if (((current == 0) || (current == 2) || (current == 4)) && ((next >= 44 && next <= 75 || next == 86) || (next == 77) || (next == 78)) && (next1 == 0) && (next2 != 76)) {
                INword.set(aaa + 2, 34);
            }
            aacnt = INword.size();
        }
        aacnt = INword.size();
        return (aacnt);
    }

    /****************
    a)	If there is chandra bindu with a vowel the vowel will be nasalised.
     */
    public int rule_of_Candrabindu(ArrayList<Integer> word_ph, int ccnt) //Rule 20
    {
        int cc, current, prev, i;
        for (cc = 0; cc <= ccnt - 1; cc++) {
            current = word_ph.get(cc);
            if (cc - 1 >= 0) {
                prev = word_ph.get(cc - 1);
            } else {
                prev = -1;
            }
            if ((current == 81) && (prev >= 0 && prev <= 43)) {

                if (prev == 0) {
                    word_ph.set(cc - 1, 1);
                }
                if (prev == 2) {
                    word_ph.set(cc - 1, 3);
                }
                if (prev == 4) {
                    word_ph.set(cc - 1, 5);
                }
                if (prev == 6) {
                    word_ph.set(cc - 1, 7);
                }
                if (prev == 8) {
                    word_ph.set(cc - 1, 9);
                }
                if (prev == 10) {
                    word_ph.set(cc - 1, 11);
                }
                if (prev == 12) {
                    word_ph.set(cc - 1, 13);
                }
                if (prev == 14) {
                    word_ph.set(cc - 1, 15);
                }
                if (prev == 16) {
                    word_ph.set(cc - 1, 17);
                }
                if (prev == 18) {
                    word_ph.set(cc - 1, 19);
                }
                if (prev == 20) {
                    word_ph.set(cc - 1, 21);
                }
                if (prev == 24) {
                    word_ph.set(cc - 1, 25);
                }
                if (prev == 26) {
                    word_ph.set(cc - 1, 27);
                }
                if (prev == 32) {
                    word_ph.set(cc - 1, 33);
                }
                if (prev == 34) {
                    word_ph.set(cc - 1, 35);
                }
                if (prev == 40) {
                    word_ph.set(cc - 1, 42);
                }
                if (prev == 36) {
                    word_ph.set(cc - 1, 37);
                }
                if (prev == 38) {
                    word_ph.set(cc - 1, 39);
                }
                word_ph.remove(cc);
            }
            ccnt = word_ph.size();
        }
        ccnt = word_ph.size();
        return (ccnt);
    }

    public int rule_of_Y(ArrayList<Integer> INword, int ycnt) //Rule 19
    {
        int y, current, prev, next, next1, next2, i;
        for (y = 0; y <= ycnt - 1; y++) {
            current = INword.get(y);
            if (y - 1 >= 0) {
                prev = INword.get(y - 1);
            } else {
                prev = -1;
            }

            if (y + 1 <= ycnt - 1) {
                next = INword.get(y + 1);
            } else {
                next = -1;
            }

            if (y + 2 <= ycnt - 1) {
                next1 = INword.get(y + 2);
            } else {
                next1 = -1;
            }

            if (y + 3 <= ycnt - 1) {
                next2 = INword.get(y + 3);
            } else {
                next2 = -1;
            }

            if ((current == 76) && (prev == 8 || prev == 12 || prev == 26) && (next != -1)) {
                INword.remove(y);
            } else if ((current == 76) && (next == 8 || next == 12 || next == 26)) {
                INword.remove(y);
            }

            if ((current == 76) && (prev == 32 || prev == 34) && (next == 4)) {
                INword.set(y - 1, 83);
                INword.remove(y);                                                       //haoa
            }
            if ((current == 76) && (prev == 26) && (next == -1)) {
                INword.set(y, 32);
            }

//            if ((current == 76) && (y != 0)) {
//                if ((prev != 24) && (next == 24)) {
//                    INword.remove(y);
//                } else if ((prev == 32) && (next == 4) && (y != ycnt - 1)) {
//                    INword.set(y - 1, 83);
//                    INword.remove(y);
//                } else if ((prev == 0 || prev == 2 || prev == 4)) {
//                    INword.set(y, 76);
//                } else {
//                    INword.remove(y);
//                }
//            }

            ycnt = INword.size();
        }
        ycnt = INword.size();
        return (ycnt);
    }

    public int rule_of_N6(ArrayList<Integer> INword, int nochar) // Rule 22
    {

        int current, prev, j, i, next;
        for (j = 0; j <= nochar - 1; j++) {
            current = INword.get(j);
            if (j - 1 >= 0) {
                prev = INword.get(j - 1);
            } else {
                prev = -1;
            }
            if (j + 1 <= nochar - 1) {
                next = INword.get(j + 1);
            } else {
                next = -1;
            }
            if ((current == 86) && (next == -1)) {
                INword.add(j + 1, 32); //'O'
            }
        }
        nochar = INword.size();
        return (nochar);
    }
    ///////////////////// End Phonology Rule //////////////////////////////////////////////

    public int rule_of_Adj(ArrayList<Integer> Adj, int adj_len, String pos) {

        int final_letter = 0, prev1, prev2;

        if (!Adj.isEmpty()) {
            final_letter = Adj.get(adj_len - 1);
        }
        if (adj_len - 1 > 0) {
            prev1 = Adj.get(adj_len - 2);
        } else {
            prev1 = -1;
        }

        if (adj_len - 2 > 0) {
            prev2 = Adj.get(adj_len - 3);
        } else {
            prev2 = -1;
        }

        if (final_letter == 67 || final_letter == 59 && pos.equals("JJ")// for final_letter 'B1' or 'T'
                //                && prev1!=4 && prev1!=8 && prev1!=12 && prev1!=18 && prev1!=20 && prev1!=23 && prev1!=26 && prev1!=30 && prev1!=34 && prev1!=38
                ) {

            Adj.add(adj_len, 32); // O
        }

        if ((final_letter == 70 || final_letter == 68) && // for final_letter 'R' or 'M'
                (prev1 == 34) && (prev2 == 59) && pos.equals("JJ")) // prev1= A && prev2= T                     //toro and tomo
        {
            Adj.set(adj_len - 2, 0);
            Adj.add(adj_len, 32); // O
        }

        return (adj_len);
    }

    public int rule_of_verb(ArrayList<Integer> Adj, int adj_len, String pos) {

        int final_letter = 0, first_letter = 0, second_letter = 0, third_letter, fourth_letter;
        if (!Adj.isEmpty()) {
            final_letter = Adj.get(adj_len - 1);
            first_letter = Adj.get(0);
        }
        if (adj_len - 1 > 0) {
            second_letter = Adj.get(1);
        } else {
            second_letter = -1;
        }

        if (adj_len - 2 > 0) {
            third_letter = Adj.get(2);
        } else {
            third_letter = -1;
        }

        if (adj_len - 3 > 0) {
            fourth_letter = Adj.get(3);
        } else {
            fourth_letter = -1;
        }
//        third_letter = Adj.get(2);
//        fourth_letter = Adj.get(3);

        if ((final_letter == 71 || final_letter == 66 || final_letter == 50 || final_letter == 59) // for final_letter 'L' or 'B' or 'C1' or 'T'
                && pos.equals("VM")) {

            Adj.add(adj_len, 32); // O
        }

        if ((first_letter == 3 || first_letter == 2 || first_letter == 6 || first_letter == 10 || first_letter == 14 || first_letter == 16 || first_letter == 22
                || first_letter == 24 || first_letter == 28 || first_letter == 32 || first_letter == 36) // for first_letter vowel
                && (second_letter >= 44 && second_letter <= 78 || second_letter == 86) && (third_letter == 0) && pos.equals("VM")) {

            Adj.remove(2); // delete A
        }
        if ((first_letter >= 44 && first_letter <= 78 || first_letter == 86) && (third_letter >= 44 && third_letter <= 78 || third_letter == 86)
                && (fourth_letter == 0 || fourth_letter == 34) && pos.equals("VM")) {
            if (second_letter == 0) {
                Adj.set(1, 34);
            }
            Adj.remove(3);
        }
        adj_len = Adj.size();
        return (adj_len);
    }

    public int rule_of_ioito(ArrayList<Integer> Adj, int adj_len) {
        int final_letter = 0, prev1, prev2;
        if (!Adj.isEmpty()) {
            final_letter = Adj.get(adj_len - 1);
        }
        if (adj_len - 1 > 0) {
            prev1 = Adj.get(adj_len - 2);
        } else {
            prev1 = -1;
        }

        if (adj_len - 2 > 0) {
            prev2 = Adj.get(adj_len - 3);
        } else {
            prev2 = -1;
        }

        if ((final_letter == 76 || final_letter == 59) && // for final_letter 'Y' or 'T'
                (prev1 == 6 || prev1 == 8 || prev1 == 10 || prev1 == 12)) // prev1= i                    //iyo, ito
        {
            Adj.add(adj_len, 32); // O
        }
        adj_len = Adj.size();
        return (adj_len);
    }

    /////////// Number to IPA symbol conversion ///////////////////////////////////
    public ArrayList Num2Ipa(ArrayList<Integer> INword) {
        int len, i;
        ArrayList ipa = new ArrayList();
        len = INword.size();
        for (i = 0; i <= len - 1; i++) {
            int a = INword.get(i);
            switch (a) {
                case 0:
                    ipa.add(i, "\u0254");                           //A
                    break;
                case 1:
                    ipa.add(i, "\u0254\u0303");                           //A0
                    break;
                case 2:
                case 4:
                    ipa.add(i, "\u0061");                           //A2,A1
                    break;
                case 3:
                    ipa.add(i, "\u0061\u0303");                           //A2,A1
                    break;
                case 5:
                    ipa.add(i, "\u0061\u0303");                     //A20
                    break;
                case 6:
                case 8:
                case 10:
                case 12:
                    ipa.add(i, "\u0069");                           //I,I1,I3,I2
                    break;
                case 9:
                    ipa.add(i, "\u0069\u0303");                           //I20
                    break;
                case 13:
                    ipa.add(i, "\u0069\u0303");                           //I30
                    break;
                case 14:
                case 16:
                case 18:
                case 20:
                    ipa.add(i, "\u0075");                           //U,U1,U2,U3
                    break;
                case 19:
                    ipa.add(i, "\u0075\u0303");                           //U20
                    break;
                case 22:
                case 23:
                    ipa.add(i, "\u0072\u0069");                     //R2,R3
                    break;
                case 24:
                case 26:
                    ipa.add(i, "\u0065");                           //E,E3
                    break;
                case 28:
                case 30:
                    ipa.add(i, "\u006F\u0069");                     //E4,E5
                    break;
                case 32:
                case 34:
                    ipa.add(i, "\u006F");                           //O,O2
                    break;
                case 35:
                    ipa.add(i, "\u006F\u0303");                           //O20
                    break;
                case 36:
                case 38:
                    ipa.add(i, "\u006F\u0075");                     //O1,O3
                    break;
                case 40:
                    ipa.add(i, "\u00E6");                           //E1
                    break;
                case 42:
                    ipa.add(i, "\u00E6\u0303");                     //E10
                    break;
                case 44:
                    ipa.add(i, "\u006B");                           //K
                    break;
                case 45:
                    ipa.add(i, "\u006B\u02B0");                     //K1
                    break;
                case 46:
                    ipa.add(i, "\u0067");                           //G
                    break;
                case 47:
                    ipa.add(i, "\u0067\u02B0");                     //G1
                    break;
                case 48:
                    ipa.add(i, "\u014B");                           //N2
                    break;
                case 49:
                    ipa.add(i, "\u02A7");                           //C
                    break;
                case 50:
                    ipa.add(i, "\u02A7\u02B0");                     //C1
                    break;
                case 51:
                    ipa.add(i, "\u02A4");                           //J
                    break;
                case 52:
                    ipa.add(i, "\u02A4\u02B0");                     //J1
                    break;
                case 54:
                    ipa.add(i, "\u0288");                           //T0
                    break;
                case 55:
                    ipa.add(i, "\u0288\u02B0");                     //T10
                    break;
                case 56:
                    ipa.add(i, "\u0256");                           //D0
                    break;
                case 57:
                    ipa.add(i, "\u0256\u02B0");                     //D10
                    break;
                case 58:
                    ipa.add(i, "\u0272");                           //N1
                    break;
                case 59:
                    ipa.add(i, "\u0074");                           //T
                    break;
                case 60:
                    ipa.add(i, "\u0074\u02B0");                     //T1
                    break;
                case 61:
                    ipa.add(i, "\u0064");                           //D
                    break;
                case 62:
                    ipa.add(i, "\u0064\u02B0");                     //D1
                    break;
                case 63:
                    ipa.add(i, "\u006E");                           //N
                    break;
                case 64:
                    ipa.add(i, "\u0070");                           //P
                    break;
                case 65:
                    ipa.add(i, "\u0070\u02B0");                     //P1
                    break;
                case 66:
                    ipa.add(i, "\u0062");                           //B
                    break;
                case 67:
                    ipa.add(i, "\u0062\u02B0");                     //B1
                    break;
                case 68:
                    ipa.add(i, "\u006D");                           //M
                    break;
                case 69:
                    ipa.add(i, "\u02A4");                           //J2
                    break;
                case 70:
                    ipa.add(i, "\u0072");                           //R
                    break;
                case 71:
                    ipa.add(i, "\u006C");                           //L
                    break;
                case 72:
                case 74:
                    ipa.add(i, "\u0283");                           //S1,S3
                    break;
                case 73:
                    ipa.add(i, "\u0073");                           //small s
                    break;
                case 75:
                    ipa.add(i, "\u0068");                           //H
                    break;
                case 76:
                    ipa.add(i, "\u006A");                           //Y
                    break;
                case 77:
                    ipa.add(i, "\u027D");                           //R0
                    break;
                case 78:
                    ipa.add(i, "\u027D\u02B0");                     //R10
                    break;
                case 83:
                    ipa.add(i, "\u028B");                           //W
                    break;
                case 86:
                    ipa.add(i, "\u014B\u0067");                     //N6
                    break;
                case 87:
                    ipa.add(i, "\u0073");                     //small s
                    break;
                default:
                    ipa.add(i, "X");
            }
            len = INword.size();
        }
        return (ipa);
    }

    ///////////////// int ArrayList to String conversion /////////////////////////////
    public String Arraylist2String(ArrayList INword) {
        String listString = "";
        int len = INword.size();
        for (int i = 0; i <= len - 1; i++) {
            listString += INword.get(i);
        }
        return (listString);
    }

    public ArrayList Num2Ipa_H(ArrayList<Integer> INword) {
        int len, i;
        ArrayList ipa = new ArrayList();
        len = INword.size();
        for (i = 0; i <= len - 1; i++) {
            int a = INword.get(i);
            switch (a) {
                case 0:

                    ipa.add(i, "\u0070");       //p
                    break;
                case 1:

                    ipa.add(i, "\u0062");                           //B
                    break;
                case 2:

                    ipa.add(i, "\u0070\u02B0");                     //P1
                    break;
                case 3:

                    ipa.add(i, "\u0062\u02B0");                     //B1
                    break;
                case 4:

                    ipa.add(i, "\u0074");                           //T
                    break;
                case 5:

                    ipa.add(i, "\u0064");                           //D
                    break;
                case 6:

                    ipa.add(i, "\u0074\u02B0");                     //T1
                    break;
                case 7:

                    ipa.add(i, "\u0064\u02B0");                     //D1
                    break;
                case 8:

                    ipa.add(i, "\u0288");                           //T0
                    break;
                case 9:

                    ipa.add(i, "\u0256");                           //D0
                    break;
                case 10:

                    ipa.add(i, "\u0288\u02B0");                     //T10
                    break;
                case 11:

                    ipa.add(i, "\u0256\u02B0");                     //D10
                    break;
                case 12:

                    ipa.add(i, "\u02A7");                           //C
                    break;
                case 13:

                    ipa.add(i, "\u02A4");                           //J
                    break;
                case 14:

                    ipa.add(i, "\u02A7\u02B0");                     //C1
                    break;
                case 15:

                    ipa.add(i, "\u02A4\u02B0");                     //J1
                    break;
                case 16:

                    ipa.add(i, "\u006B");                           //K
                    break;
                case 17:

                    ipa.add(i, "\u0067");                           //G
                    break;
                case 18:

                    ipa.add(i, "\u006B\u02B0");                     //K1
                    break;
                case 19:

                    ipa.add(i, "\u0067\u02B0");                     //G1
                    break;
                case 20:

                    ipa.add(i, "\u0071");                           //K2
                    break;
                case 21:

                    ipa.add(i, "\u006D");                           //M
                    break;
                case 22:

                    ipa.add(i, "\u006E");                           //N
                    break;
                case 23:

                    ipa.add(i, "\u0272");                           //N1
                    break;
                case 24:

                    ipa.add(i, "\u0066");                           //P2
                    break;
                case 25:

                    ipa.add(i, "\u0073");                     //small s
                    break;
                case 26:

                    ipa.add(i, "\u007A");                       //z
                    break;
                case 27:

                    ipa.add(i, "\u0283");                           //S1
                    break;
                case 28:

                    ipa.add(i, "\u0078");                           //x
                    break;
                case 29:

                    ipa.add(i, "\u0263");                           //G2
                    break;
                case 30:

                    ipa.add(i, "\u0068");                           //H
                    break;
                case 31:

                    ipa.add(i, "\u028B");                           //W
                    break;
                case 32:

                    ipa.add(i, "\u006A");                           //Y
                    break;
                case 33:

                    ipa.add(i, "\u0072");                           //R
                    break;
                case 34:

                    ipa.add(i, "\u006C");                           //L
                    break;

                case 35:
                case 36:
                    ipa.add(i, "\u0069");                           //I,I2
                    break;

                case 37:

                    ipa.add(i, "\u01DD");                           //ǝ
                    break;
                case 38:
                case 39:
                    ipa.add(i, "\u0075");                           //U,U2
                    break;

                case 40:
                case 41:
                    ipa.add(i, "\u0069\u003A");                           //I1,I3
                    break;

                case 42:
                case 43:
                    ipa.add(i, "\u0065\u003A");                           //E,E3
                    break;

                case 44:
                case 45:
                    ipa.add(i, "\u0061\u003A");                           //A2,A1
                    break;

                case 46:
                case 47:
                    ipa.add(i, "\u006F\u003A");                           //O,O2
                    break;

                case 48:
                case 49:
                    ipa.add(i, "\u0254\u003A");                                   //A3,A4
                    break;

                case 50:
                case 51:
                    ipa.add(i, "\u0075\u003A");                           //U1,U3
                    break;

                case 52:
                case 53:
                    ipa.add(i, "\u1D02\u003A");                               //E4,E5
                    break;

                case 54:
                case 55:
                    ipa.add(i, "\u1D14\u003A");                         //O1,O3
                    break;

                default:
                    ipa.add(i, "X");
            }
            len = INword.size();
        }
        return (ipa);
    }

    public String UNI2PASCI_H(String Uword, int wordlen) {
        int index, second_char;
        int first_char = 0;
        String Pw = "";
        Uword = Uword.concat("a");
        for (index = 0; index <= wordlen; index++) {
            if (index == 0) {
                first_char = 32;
                second_char = (int) Uword.charAt(index);
            } else {
                second_char = (int) Uword.charAt(index);
            }

            switch (first_char) {
                case 2346:
                    Pw = Pw.concat("P");
                    break;
                case 2348:
                    Pw = Pw.concat("B");
                    break;
                case 2347:
                    Pw = Pw.concat("P1");
                    break;
                case 2349:
                    Pw = Pw.concat("B1");
                    break;
                case 2340:
                    Pw = Pw.concat("T");
                    break;
                case 2342:
                    Pw = Pw.concat("D");
                    break;
                case 2341:
                    Pw = Pw.concat("T1");
                    break;
                case 2343:
                    Pw = Pw.concat("D1");
                    break;
                case 2335:
                    Pw = Pw.concat("T0");
                    break;
                case 2337:
                    Pw = Pw.concat("D0");
                    break;
                case 2336:
                    Pw = Pw.concat("T10");
                    break;
                case 2338:
                    Pw = Pw.concat("D10");
                    break;
                case 2330:
                    Pw = Pw.concat("C");
                    break;
                case 2332:
                    Pw = Pw.concat("J");
                    break;
                case 2331:
                    Pw = Pw.concat("C1");
                    break;
                case 2333:
                    Pw = Pw.concat("J1");
                    break;
                case 2325:
                    Pw = Pw.concat("K");
                    break;
                case 2327:
                    Pw = Pw.concat("G");
                    break;
                case 2326:
                    Pw = Pw.concat("K1");
                    break;
                case 2328:
                    Pw = Pw.concat("G1");
                    break;
                case 2392:
                    Pw = Pw.concat("K2");
                    break;
                case 2350:
                    Pw = Pw.concat("M");
                    break;
                case 2344:
                    Pw = Pw.concat("N");
                    break;
                case 2339:
                    Pw = Pw.concat("N1");
                    break;
                case 2398:
                    Pw = Pw.concat("P2");
                    break;
                case 2360:
                    Pw = Pw.concat("S");
                    break;
                case 2395:
                    Pw = Pw.concat("J2");
                    break;
                case 2358:
                    Pw = Pw.concat("S1");
                    break;
                case 2393:
                    Pw = Pw.concat("K12");
                    break;
                case 2394:
                    Pw = Pw.concat("G2");
                    break;
                case 2361:
                    Pw = Pw.concat("H");
                    break;
                case 2357:
                    Pw = Pw.concat("W");
                    break;
                case 2351:
                    Pw = Pw.concat("Y");
                    break;
                case 2352:
                    Pw = Pw.concat("R");
                    break;
                case 2354:
                    Pw = Pw.concat("L");
                    break;
                case 2311:
                    Pw = Pw.concat("I");
                    break;
                case 2367:
                    Pw = Pw.concat("I2");
                    break;
                case 2309:
                    Pw = Pw.concat("A");
                    break;
                case 2313:
                    Pw = Pw.concat("U");
                    break;
                case 2369:
                    Pw = Pw.concat("U2");
                    break;
                case 2312:
                    Pw = Pw.concat("I1");
                    break;
                case 2368:
                    Pw = Pw.concat("I3");
                    break;
                case 2319:
                    Pw = Pw.concat("E");
                    break;
                case 2375:
                    Pw = Pw.concat("E3");
                    break;
                case 2310:
                    Pw = Pw.concat("A1");
                    break;
                case 2366:
                    Pw = Pw.concat("A2");
                    break;
                case 2323:
                    Pw = Pw.concat("O");
                    break;
                case 2379:
                    Pw = Pw.concat("O2");
                    break;
                case 2321:
                    Pw = Pw.concat("A3");
                    break;
                case 2377:
                    Pw = Pw.concat("A4");
                    break;
                case 2314:
                    Pw = Pw.concat("U1");
                    break;
                case 2370:
                    Pw = Pw.concat("U3");
                    break;
                case 2320:
                    Pw = Pw.concat("E4");
                    break;
                case 2376:
                    Pw = Pw.concat("E5");
                    break;
                case 2324:
                    Pw = Pw.concat("O1");
                    break;
                case 2380:
                    Pw = Pw.concat("O3");
                    break;
                case 2381:
                    Pw = Pw.concat("-");
                    break;
            }//end of switch
            first_char = second_char;
        }//end of for
        return Pw;
    }

    public int Add_vowel_A_H(ArrayList<Integer> INword, int no_of_char) //Rule 000
    {
        int current, next, count;
        for (count = 0; count <= no_of_char - 1; count++) {
            current = INword.get(count);

            if ((count + 1) <= no_of_char - 1) {
                next = INword.get(count + 1);
            } else {
                next = -1;
            }

            if ((current >= 0 && current <= 34) && ((next >= 0 && next <= 34) || (next == -1)))//CC-CVC   // current!=48 ; added on 27.01.09
            {

                INword.add(count + 1, 37);


            } else if ((current >= 0 && current <= 34) && ((next == 37) || (next == 44) || (next == 40) || (next == 35) || (next == 50) || (next == 38)))//CV->CVV
            {

                INword.add(count + 1, 37);

            }
            no_of_char = INword.size();
        }
        no_of_char = INword.size();

        return (no_of_char);

    }
}
