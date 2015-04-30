/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TTS;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Random;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sankar
 */
public class TTS {

    String PATH = "D:\\IDE_acceess\\";
    String RAW = "D:\\IDE_acceess\\";
    String ort;
    ArrayList<Integer> pon;
    static String[] PHONEME = {"a", "a0", "a1", "a10", "i", "i0", "e", "e0", "u", "u0",
        "o", "o0", "e1", "e10", "k", "k1", "g", "g1", "n2", "c",
        "c1", "j", "j1", "t0", "t10", "d0", "d10", "t", "t1", "d",
        "d1", "n", "p", "p1", "b", "b1", "m", "r", "l", "s1",
        "s", "h", "r0", "r10", "ng0", "y", "w", ",", "/", "?",
        ";", "#", "&", "."};
    int Phoneme_length = 54;
    String[] ARRANGED_PH = new String[Phoneme_length];
    int[] STATE = new int[Phoneme_length];
    ArrayList<String> token = new ArrayList<String>();
    ArrayList<Integer> ref = new ArrayList<Integer>();
    ArrayList<Integer> op = new ArrayList<Integer>();
    int SYDURATION = 4410;
    double PI = 3.14285;
    String Encoding = "utf8";
    int sampfreq = 22050;
    int TRANSITION_BAND = 100;

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

//    public static void main(String[] args) {
//        TTS s = new TTS();
//        s.deleteExistingSD();
////                    System.out.println(a);
////        s.Pon("a1b");
//    }
    public void Pon(String word) {
//        try {
        deleteExistingSD();

        UNI2PASCI U = new UNI2PASCI();
        String w = U.getNN(word);
        Initialization();
        pon = Conversion(w);
        int a = Token_Genaration(pon);
        Process_token(a);
        make_wave();
//        } catch (Exception e) {//Catch exception if any
//            System.err.println("Error: in pon" + e.getMessage());
//        }
    }

    public void deleteExistingSD() {
        File file = new File(PATH + "out");
        file.delete();
//        File tempdir = (File) event.getServletContext().getAttribute("javax.servlet.context.tempdir");
//        File tempDir = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
    }

    public ArrayList<Integer> Conversion(String word) {
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
                    /**
                     * *******************************
                     */
                }
                count = count + 1;
            }
            /**
             * ********************************
             */
            ln1 = word.length();
        }
        ArrayList<Integer> al = new ArrayList<Integer>();
        for (int i = 0; i <= lnx - 1; i++) {
            al.add(i, Phword[i]);
        }
        return (al);
    }

    public int Token_Genaration(ArrayList<Integer> word)// genaration of token
    {
        int first_ph, second_ph, first_w, second_w;//word no
        int no_of_code = -1, index;
        int no_of_phon_s = word.size();
        for (index = -1; index < no_of_phon_s - 1; index++)//index -1 to add silence to initial portion
        {
            if (index == -1) {
                first_ph = 80;// 80 silence
                second_ph = word.get(0);
                first_w = -1;
                second_w = word.indexOf(index + 1);
            } else {
                first_ph = word.get(index);
                second_ph = word.get(index + 1);
                first_w = word.indexOf(index);
                second_w = word.indexOf(index + 1);
            }

            switch (first_ph)//c
            {
                case 14:
                case 15:
                case 16:
                case 17:
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 38:
                case 39:
                case 40:
                case 41:
                case 42:
                case 43:
                case 44:
                    switch (second_ph)//CC
                    {
                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                        case 26:
                        case 27:
                        case 28:
                        case 29:
                        case 30:
                        case 31:
                        case 32:
                        case 33:
                        case 34:
                        case 35:
                        case 36:
                        case 37:
                        case 38:
                        case 39:
                        case 40:
                        case 41:
                        case 42:
                        case 43:
                        case 44:
                            if ((first_ph == second_ph) && ((second_ph == 12) || (second_ph == 13) || (second_ph == 14)
                                    || (second_ph == 15) || (second_ph == 27) || (second_ph == 28) || (second_ph == 22)
                                    || (second_ph == 23) || (second_ph == 32) || (second_ph == 33) || (second_ph == 29)
                                    || (second_ph == 30))) {//SPL CASE k kh,p ph, t th,T TH...
                                token.add(no_of_code, "pausec");//cc then only one burst, so initial pausec
                                ref.add(no_of_code, 1);
                                op.add(no_of_code, 1);
                            }
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);
                            ref.add(no_of_code, 1);
                            op.add(no_of_code, 1);
                            break;
                        case 0:
                        case 1:///CV
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:


                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[first_ph].concat(PHONEME[second_ph]));
                            ref.add(no_of_code, 2);
                            op.add(no_of_code, 1);

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);
                            ref.add(no_of_code, 3);
                            op.add(no_of_code, 2);
                            break;


                        case 47://coma
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "coma");
                            ref.add(no_of_code, 10);
                            op.add(no_of_code, 9);
                            break;

                        case 52:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "sp");
                            ref.add(no_of_code, 10);
                            op.add(no_of_code, 9);
                            break;


                        case 48:
                        case 49:
                        case 50:
                        case 53:

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "stop");
                            ref.add(no_of_code, 11);
                            op.add(no_of_code, 10);
                            break;
                        default:
                            break;

                    }
                    break;

                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                case 13:
                    switch (second_ph)//VC
                    {

                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                        case 26:
                        case 27:
                        case 28:
                        case 29:
                        case 30:
                        case 31:
                        case 32:
                        case 33:
                        case 34:
                        case 35:
                        case 36:
                        case 37:
                        case 38:
                        case 39:
                        case 40:
                        case 41:
                        case 42:
                        case 43:
                        case 44:


                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[first_ph].concat(PHONEME[second_ph]));
                            ref.add(no_of_code, 4);
                            op.add(no_of_code, 1);

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);
                            ref.add(no_of_code, 1);
                            op.add(no_of_code, 1);

                            break;

                        //y & V semivowels
                        case 45:
                        case 46:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[first_ph].concat(PHONEME[second_ph]));
                            ref.add(no_of_code, 4);
                            op.add(no_of_code, 1);
                            break;



                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:

                            if (first_w == second_w) {
                                no_of_code = no_of_code + 1;
                                token.add(no_of_code, PHONEME[first_ph].concat(PHONEME[second_ph]));
                                ref.add(no_of_code, 5);
                                op.add(no_of_code, 1);
                            } else {
                                no_of_code = no_of_code + 1;
                                token.add(no_of_code, PHONEME[first_ph].concat(PHONEME[second_ph]).concat("W"));//vvw wave ie wave for vowels between words
                                ref.add(no_of_code, 4);////?????????????ref ==6?
                                op.add(no_of_code, 1);

                                no_of_code = no_of_code + 1;
                                token.add(no_of_code, PHONEME[second_ph]);
                                ref.add(no_of_code, 3);
                                op.add(no_of_code, 2);

                            }
                            break;

                        case 47:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[first_ph]);
                            ref.add(no_of_code, 7);
                            op.add(no_of_code, 4);

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "coma");
                            ref.add(no_of_code, 10);
                            op.add(no_of_code, 9);
                            break;

                        case 52:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[first_ph]);//vout and thn silence
                            ref.add(no_of_code, 7);
                            op.add(no_of_code, 4);

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "sp");
                            ref.add(no_of_code, 10);
                            op.add(no_of_code, 9);
                            break;

                        case 48:
                        case 49:
                        case 50:
                        case 53:

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[first_ph]);
                            ref.add(no_of_code, 7);
                            op.add(no_of_code, 4);

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "stop");
                            ref.add(no_of_code, 11);
                            op.add(no_of_code, 10);
                            break;
                        default:
                            break;

                    }
                    break;
                case 45:
                case 46:
                    switch (second_ph) {


                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                        case 26:
                        case 27:
                        case 28:
                        case 29:
                        case 30:
                        case 31:
                        case 32:
                        case 33:
                        case 34:
                        case 35:
                        case 36:
                        case 37:
                        case 38:
                        case 39:
                        case 40:
                        case 41:
                        case 42:
                        case 43:
                        case 44:

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);//treat as consonant..cc
                            ref.add(no_of_code, 1);
                            op.add(no_of_code, 1);
                            break;

                        case 0://YV
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[first_ph].concat(PHONEME[second_ph]));//treat as CV
                            ref.add(no_of_code, 2);
                            op.add(no_of_code, 1);

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);
                            ref.add(no_of_code, 3);
                            op.add(no_of_code, 2);
                            break;

                        case 47:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "coma");
                            ref.add(no_of_code, 10);
                            op.add(no_of_code, 9);
                            break;

                        case 52:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "sp");
                            ref.add(no_of_code, 10);
                            op.add(no_of_code, 9);
                            break;

                        case 48:
                        case 49:
                        case 50:
                        case 53:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "stop");
                            ref.add(no_of_code, 11);
                            op.add(no_of_code, 10);
                            break;
                        default:
                            break;

                    }
                    break;

                case 80://silence
                    switch (second_ph)//c
                    {

                        case 14:
                        case 15:
                        case 16:
                        case 17:
                        case 18:
                        case 19:
                        case 20:
                        case 21:
                        case 22:
                        case 23:
                        case 24:
                        case 25:
                        case 26:
                        case 27:
                        case 28:
                        case 29:
                        case 30:
                        case 31:
                        case 32:
                        case 33:
                        case 34:
                        case 35:
                        case 36:
                        case 37:
                        case 38:
                        case 39:
                        case 40:
                        case 41:
                        case 42:
                        case 43:
                        case 44:
                        case 45:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);//c
                            ref.add(no_of_code, 1);
                            op.add(no_of_code, 1);
//                            no_of_code = no_of_code + 1;
                            break;
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);//vin thn vowel
                            ref.add(no_of_code, 8);
                            op.add(no_of_code, 3);

                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, PHONEME[second_ph]);
                            ref.add(no_of_code, 3);
                            op.add(no_of_code, 2);
                            break;

                        case 52:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "sp");
                            ref.add(no_of_code, 10);
                            op.add(no_of_code, 9);
                            break;

                        case 47:
                        case 48:
                        case 49:
                        case 50:
                        case 53:
                            no_of_code = no_of_code + 1;
                            token.add(no_of_code, "stop");
                            ref.add(no_of_code, 11);
                            op.add(no_of_code, 10);
                            break;
                        default:
                            break;

                    }
                    break;
                default:
                    break;
            }
        }
        no_of_code = token.size();
        return (no_of_code);
    }

    public void Process_token(int code_no)// processing of token
    {
        int k;
        for (k = 0; k <= code_no - 1; k++)//pass each token to generate speech
        {
            Genarate_Speech(k, code_no);
        }
    }

    public int getlength_of_file(String name)//function converts file in binary format to wav
    {
        int length, duration = 0;
        try {
            InputStream in = new FileInputStream(RAW+"raw/" + name + ".wav");
            byte[] bytes = new byte[(int) in.available()];
            length = bytes.length;
            duration = (length - 44) / 2;
            in.close();
        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: in getlengthofgile" + e.getMessage());
        }
        return (duration);
    }

    public int get_vowel_duration(int y, int total_code) {
        int current_ref, prev_ref, next_ref, vowellength, length1, length2;
        int duration, vowel_p = 0, vowel_len;
        current_ref = ref.get(y);
        if (y - 1 >= 0) {
            prev_ref = ref.get(y - 1);
        } else {
            prev_ref = -1;
        }
        if (y + 1 <= total_code - 1) {
            next_ref = ref.get(y + 1);
        } else {
            next_ref = -1;
        }

        if ((current_ref == 3) && (prev_ref == 8) && (next_ref == 4)) //Vin V VC
        {
            duration = getlength_of_file(token.get(y - 1));
            length1 = duration * 10;
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }
        if ((current_ref == 3) && (prev_ref == 8) && (next_ref == 5)) //Vin V VV
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration * 10;
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }
        if ((current_ref == 3) && (prev_ref == 8) && (next_ref == 7)) //Vin V Vout
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration * 10;
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration * 10;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }


        if ((current_ref == 3) && (prev_ref == 2) && (next_ref == 4)) //CV V VC
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration;

            duration = getlength_of_file(token.get(y));
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }

        if ((current_ref == 3) && (prev_ref == 6) && (next_ref == 4)) //VVW V VC
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration;

            duration = getlength_of_file(token.get(y));
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }

        if ((current_ref == 3) && (prev_ref == 6) && (next_ref == 5)) //VVW V VV
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration;

            duration = getlength_of_file(token.get(y));
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }

        if ((current_ref == 3) && (prev_ref == 2) && (next_ref == 6)) //cv V VVW
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration;

            duration = getlength_of_file(token.get(y));
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }

        if ((current_ref == 3) && (prev_ref == 6) && (next_ref == 7)) //VVW V VOUT
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration;

            duration = getlength_of_file(token.get(y));
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration * 10;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }

        if ((current_ref == 3) && (prev_ref == 2) && (next_ref == 7)) //CV V VOUT
        {

            duration = getlength_of_file(token.get(y - 1));
            length1 = duration;

            duration = getlength_of_file(token.get(y));
            vowel_len = duration;

            duration = getlength_of_file(token.get(y + 1));
            length2 = duration * 10;

            vowellength = SYDURATION - (length1 + length2);

            vowel_p = vowellength / vowel_len;

        }
        return (vowel_p);
    }

    public int Genarate_vowel(int period, int p, int codeno, int v_len, int Flag_s) //genarate the vowel portion
    {
        short[] data1 = new short[500];
        short[] data2 = new short[500];
        short[] datat = new short[5000];
        int current_ref, prev_ref, next_ref, prlen, m, k;
        int erreorflag = 0;

        current_ref = ref.get(p);//
        if (p - 1 >= 0) {
            prev_ref = ref.get(p - 1);
        } else {
            prev_ref = -1;
        }
        if (p + 1 <= codeno - 1) {
            next_ref = ref.get(p + 1);
        } else {
            next_ref = -1;
        }

        for (m = 0; m < 100; m++) {
            data1[m] = 0;
            data2[m] = 0;
        }
        try {
//prev(1-8),next(1-7)vin canot occurer in next ref
            if ((current_ref == 3) && (prev_ref > 1 && prev_ref <= 8) && (next_ref > 1 && next_ref <= 7)) {//ref except 10 and 11 ....not comma , stops
                if (prev_ref == 8)//Vin
                {
                    datat = BytetoShort(Read_File(token.get(p + 1)));
                    if (datat != null) {

                        for (m = 0; m < v_len; m++) {
                            data1[m] = datat[m];
                            data2[m] = datat[m];
                        }
                    } else {
                        erreorflag = 1;
                    }
                } else {
                    datat = BytetoShort(Read_File(token.get(p - 1)));
                    if (datat != null) {

                        prlen = datat.length;
                        for (k = v_len; k > 0; k--) {
                            data1[v_len - k] = datat[prlen - k];//(data1+prlen-k);
                        }
                    } else {
                        erreorflag = 1;
                    }
                }

                if (next_ref == 7) {
                    datat = BytetoShort(Read_File(token.get(p - 1)));
                    if (datat != null) {

                        prlen = datat.length;
                        for (k = v_len; k > 0; k--) {
                            data2[v_len - k] = datat[prlen - k];
                            data1[v_len - k] = datat[prlen - k];//(data1+prlen-k);
                        }
                    } else {
                        erreorflag = 1;
                    }
                } else {
                    datat = BytetoShort(Read_File(token.get(p + 1)));
                    if (datat != null) {

                        for (m = 0; m < v_len; m++) {
                            data2[m] = datat[m];
                        }
                    } else {
                        erreorflag = 1;
                    }
                }

            } else if (current_ref == 7) {
                if (prev_ref == 5) {
                    datat = BytetoShort(Read_File(token.get(p - 1)));
                } else {
                    datat = BytetoShort(Read_File(token.get(p - 2)));
                }
                if (datat != null) {

                    prlen = datat.length;
                    for (k = v_len; k > 0; k--) {
                        data2[v_len - k] = datat[prlen - k];
                        data1[v_len - k] = datat[prlen - k];//(data1+prlen-k);
                    }
                } else {
                    erreorflag = 1;
                }
            } else if (current_ref == 8) {

                datat = BytetoShort(Read_File(token.get(p + 2)));
                if (datat != null) {

                    prlen = datat.length;
                    for (m = 0; m < v_len; m++) {
                        data1[m] = datat[m];
                        data2[m] = datat[m];
                    }
                } else {
                    erreorflag = 1;
                }
            } else if ((current_ref == 3) && (prev_ref == 8) && (next_ref == 7)) {
                datat = BytetoShort(Read_File(token.get(p)));
                if (datat != null) {

                    prlen = datat.length;
                    for (m = 0; m < v_len; m++) {
                        data1[m] = datat[m];
                        data2[m] = datat[m];
                    }
                } else {
                    erreorflag = 1;
                }
            }
        } catch (Exception e) {
            System.err.println("error in generate vowel" + e);
        }
        if (erreorflag == 0) {
            Interpolation(data1, data2, period, v_len, Flag_s);
        }
        return (0);
    }

    public void Genarate_Speech(int x, int code_no)//genaration of sound file as per the token
    {
        int oparation, period, vowellength, Flag, p;

        File file = new File(PATH + "out");

        try {
            FileOutputStream Output = new FileOutputStream(file, true);
            byte[] Input;

            oparation = op.get(x);
            switch (oparation) {
                case 1://operation 1 Consonant
                    Input = Read_File(token.get(x));
                    if (Input != null) {
                        Output.write(Input);
                    } else {
                        System.out.println("error");
                    }
                    break;
                case 2:	//if vowel
                    Flag = 0;//to identify case.
                    vowellength = getlength_of_file(token.get(x));
                    period = get_vowel_duration(x, code_no);
                    Genarate_vowel(period, x, code_no, vowellength, Flag);
                    break;
                case 3:
                    Flag = 1;
                    vowellength = getlength_of_file(token.get(x));
                    period = 10;
                    Genarate_vowel(period, x, code_no, vowellength, Flag);
                    break;
                case 4:
                    Flag = 2;
                    vowellength = getlength_of_file(token.get(x));

                    period = 10;
                    Genarate_vowel(period, x, code_no, vowellength, Flag);
                    break;
                case 9:
                    Input = Read_File(token.get(x));
                    if (Input != null) {
                        Output.write(Input);
                    } else {
                        System.out.println("error");
                    }
                    break;
                case 10:
                    Input = Read_File(token.get(x));
                    if (Input != null) {
                        for (p = 0; p < 4; p++) {
                            Output.write(Input);
                        }
                    } else {
                        System.out.println("error");
                    }
                    break;
            }
            Output.close();
        } catch (Exception e) {
            System.err.println("error in generate speech" + e);
        }
    }

    void Interpolation(short val1[], short val2[], int no_of_piriod, int lenght_of_vowel, int flg) {
        int loop, zeter, k, seeds, no_of_sample, p;
        double[] W = new double[500];
        float a1, a2;
        double simar, fac = 0;
        short[] dataf = new short[500];
        int P = no_of_piriod;//lenght_of_vowel*5;
        int x = 0;
        for (loop = 1; loop < P; loop++) {
            Random rn = new Random();//generates random numbers
            zeter = rn.nextInt() % 4;

            no_of_sample = lenght_of_vowel + zeter;//sample length is varied by + or -1
            Win(no_of_sample, W);
            for (p = 0; p < zeter; p++) {
                val1[lenght_of_vowel + p] = (short) (val1[p] * 0.40);
                val2[lenght_of_vowel + p] = (short) (val2[p] * 0.40);
            }

            if (flg == 1) {
                fac = Math.sin(PI * loop / (2 * 10));
            } else if (flg == 2) {
                fac = Math.cos(PI * loop / (2 * 10));
            } else if (flg == 0) {
                fac = 1.0;
            }

            for (k = 0; k < no_of_sample; k++) {

                Random rn1 = new Random();//generates random numbers
                seeds = rn1.nextInt() % 4;//random number generation, to make complex wave

                simar = (1 + (float) seeds / 100);//shimmer
                a1 = (float) (val1[k] * (float) (P - loop) / P);
                a2 = (float) (val2[k] * (float) loop / P);
                dataf[k] = (short) (a1 + a2);//the percentage to be added
                dataf[k] = (short) (dataf[k] * W[k] * simar * fac);
            }
            for (int y = 0; y <= dataf.length; y++) {
                if (dataf[y] != 0 && dataf[y + 1] == 0 && dataf[y + 2] == 0) {
                    x = y;
                    break;
                }
            }
            short newdataf[] = new short[x];
            for (int z = 0; z <= newdataf.length - 1; z++) {
                newdataf[z] = dataf[z];
            }
            byte[] bytes2 = new byte[newdataf.length * 2];
            ByteBuffer.wrap(bytes2).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer().put(newdataf);
            try {
//                File root = android.os.Environment.getExternalStorageDirectory();
//                File dir = new File(root.getAbsolutePath() + "/download");
//                dir.mkdirs();
//                File file = new File(dir, "out");
                File file = new File(PATH + "out");
                FileOutputStream Output2 = new FileOutputStream(file, true);

                Output2.write(bytes2);
                Output2.close();
            } catch (Exception e) {//Catch exception if any
                System.err.println("Error: in interpolation" + e.getMessage());
            }
        }
    }

    void make_wave() /// convert to wave format
    {

        try {
            File file = new File(PATH + "wave.wav");
            FileOutputStream Output = new FileOutputStream(file);

            File file1 = new File(PATH + "out");
            FileInputStream in1 = new FileInputStream(file1);

            int filesize1 = in1.available();
            in1.skip(44);
            byte[] tempId1 = new byte[in1.available()];
            in1.read(tempId1);

            InputStream in2 = new FileInputStream(RAW+"raw/i.wav");
            byte[] riff = new byte[4];
            in2.read(riff);
            Output.write(riff);

            String hex1 = Integer.toHexString(filesize1);
            byte[] s1 = HextoByte(hex1);
            Output.write(s1);

            in2.skip(4);
            byte[] wave = new byte[32];
            in2.read(wave);
            Output.write(wave);

            String hex2 = Integer.toHexString(filesize1 - 44);
            byte[] s2 = HextoByte(hex2);
            Output.write(s2);

            Output.write(tempId1);


            in2.close();
            in1.close();
            Output.close();
        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: in makewave" + e.getMessage());
        }
    }

    void Win(int len, double W[]) {
        int N1, N2, N3, k;

        N1 = len;
        N2 = (int) (len * 0.125);
        N3 = N1 - N2;


        for (k = 0; k < N2; k++) {
            W[k] = (1 - Math.cos(PI * k / (N2 - 1))) / 2;
        }

        for (k = N2; k < N3; k++) {
            W[k] = 1.0;
        }

        for (k = N3; k < N1; k++) {
            W[k] = (1 + Math.cos(PI * (k - N3) / (N1 - N3 - 1))) / 2;
        }

    }

    public byte[] Read_File(String name) {
        byte[] tempId = null;
        try {
            InputStream in = new FileInputStream(RAW+"raw/" + name + ".wav");
            in.skip(44);
            tempId = new byte[in.available()];
            in.read(tempId);
            in.close();

        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: in read file" + e.getMessage());
        }
        return tempId;
    }

    public String Short_to_String(short[] name) {

        String id2 = null;
        byte[] bytes2 = new byte[name.length * 2];
        ByteBuffer.wrap(bytes2).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer().put(name);
        try {
            id2 = new String(bytes2, "utf8");
        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: in short to string" + e.getMessage());
        }
        return id2;

    }

    public byte[] HextoByte(String hex1) {

        String hex3 = "";
        String hex2 = "0";
        if (hex1.length() % 2 != 0) {
            hex2 = hex2.concat(hex1);
        } else {
            hex2 = hex1;
        }

        for (int st = hex2.length(); st > 0; st -= 2) {
            String thisByte = hex2.substring(st - 2, st);
            hex3 = hex3.concat(thisByte);
        }
        String s = hex3;
        byte[] s1 = new byte[4];
        int len = s.length();
        for (int i = 0; i < len; i += 2) {
            s1[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4) + Character.digit(s.charAt(i + 1), 16));
        }
        return s1;
    }

    public short[] BytetoShort(byte[] tempId) {
        short[] shorts = null;
        shorts = new short[tempId.length / 2];
        ByteBuffer.wrap(tempId).order(ByteOrder.LITTLE_ENDIAN).asShortBuffer().get(shorts);
        return shorts;
    }

    public void onInit(int arg0) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
