package TTS;


import java.util.ArrayList;

/***
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Sankar
 */
public class UNI2PASCI {

    //String ort;
    ArrayList<Integer> pon;
    

    public ArrayList<Integer> UNI2PASCIII(String Uword, int wordlen) {
        int index, second_char;
        int first_char = 0;
//        String Pw = "";
        ArrayList<Integer> Pw = new ArrayList<Integer>();
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
                    Pw.add(81);
                    break;
                case 2434:
                    Pw.add(79);
                    break;
                case 2435:
                    Pw.add(80);
                    break;
                case 2437:
                    Pw.add(0);
                    break;
                case 2438:
                    Pw.add(2);
                    break;
                case 2494:
                    Pw.add(4);
                    break;
                case 2439:
                    Pw.add(6);
                    break;
                case 2495:
                    Pw.add(8);
                    break;
                case 2440:
                    Pw.add(10);
                    break;
                case 2496:
                    Pw.add(12);
                    break;
                case 2441:
                    Pw.add(14);
                    break;
                case 2442:
                    Pw.add(16);
                    break;
                case 2497:
                    Pw.add(18);
                    break;
                case 2498:
                    Pw.add(20);
                    break;
                case 2443:
                    Pw.add(22);
                    break;
                case 2499:
                    Pw.add(23);
                    break;
                case 2447:
                    Pw.add(24);
                    break;
                case 2503:
                    Pw.add(26);
                    break;
                case 2448:
                    Pw.add(28);
                    break;
                case 2504:
                    Pw.add(30);
                    break;
                case 2451:
                    Pw.add(32);
                    break;
                case 2507:
                    Pw.add(34);
                    break;
                case 2452:
                    Pw.add(36);
                    break;
                case 2508:
                    Pw.add(38);
                    break;
                ///////////////////////////k/////////////////////
                case 2453:
                    Pw.add(44);
                    break;
                case 2454:
                    Pw.add(45);
                    break;
                case 2455:
                    Pw.add(46);
                    break;
                case 2456:
                    Pw.add(47);
                    break;
                case 2457:  // modified on 02.02.09 by J.Basu
                    if ((int) Uword.charAt(index) != 2509) {
                        Pw.add(48);
                    } else if ((int) Uword.charAt(index) == 2509 && (int) Uword.charAt(index + 1) == 2455) {  // for N2-G
                        Pw.add(86);
                        second_char = (int) Uword.charAt(index + 2);
                        index = index + 2;
                    } else {
                        Pw.add(48); // added dt 03.03.10
                    }
                    break;

                //////////////////////c///////////////////////
                case 2458:
                    Pw.add(49);
                    break;
                case 2459:
                    Pw.add(50);
                    break;
                case 2460:
                    Pw.add(51);
                    break;
                case 2461:
                    Pw.add(52);
                    break;
                case 2462:
                    Pw.add(53);
                    break;
                ///////////////////T0///////////////////////
                case 2463:
                    Pw.add(54);
                    break;
                case 2464:
                    Pw.add(55);
                    break;

                case 2465:
                    if (second_char == 2492) {
                        Pw.add(77);
                    } else {
                        Pw.add(56);
                    }
                    break;
                case 2524:
                    Pw.add(77);
                    break;

                case 2466:
                    if (second_char == 2492) {
                        Pw.add(78);
                    } else {
                        Pw.add(57);
                    }
                    break;

                case 2525:
                    Pw.add(78);
                    break;

                case 2467:
                    Pw.add(58);
                    break;
                /////////////////////////T//////////////
                case 2468:
                    Pw.add(59);
                    break;
                case 2469:
                    Pw.add(60);
                    break;
                case 2470:
                    Pw.add(61);
                    break;
                case 2471:
                    Pw.add(62);
                    break;
                case 2472:
                    Pw.add(63);
                    break;
                ////////////////////P/////////////
                case 2474:
                    Pw.add(64);
                    break;
                case 2475:
                    Pw.add(65);
                    break;

                case 2476:
                    if (second_char == 2492) {
                        Pw.add(70);
                    } else {
                        Pw.add(66);
                    }
                    break;

                case 2477:
                    Pw.add(67);
                    break;
                case 2478:
                    Pw.add(68);
                    break;

                ////////////////j-S1//////////////
                case 2479:
                    if (second_char == 2492) {
                        Pw.add(76);
                    } else {
                        Pw.add(69);
                    }
                    break;
                case 2480:
                    Pw.add(70);
                    break;
                case 2482:
                    Pw.add(71);
                    break;
                case 2486:
                    Pw.add(72);
                    break;
                case 2487:
                    Pw.add(74);
                    break;
                //////////////////
                case 2488:
                    Pw.add(73);
                    break;
                case 2489:
                    Pw.add(75);
                    break;
                case 2510:
                    Pw.add(5984);
                    break;


                case 2527:
                    Pw.add(76);
                    break;
                case 2509:
                    Pw.add(84);
                    break;
                case 8204:
                    Pw.add(85);
                    break;  // Non Zero ; by J.Basu

            }//end of switch
            first_char = second_char;
        }//end of for
        return Pw;
    }   

    public String word_split(String INword) {
        String ss = "";
        String F = "";
        String delimiter = "[\\s,;]+";              //for any white space,;.
        String[] temp;
        CharSequence C = ".";
        temp = INword.split(delimiter);
        for (int i = 0; i < temp.length; i++) {
            ss = getNN(temp[i]);
            if (temp[i].contains(C)) {
                F = F.concat(ss.concat("."));
            } else {
                F = F.concat(ss.concat(",b"));
            }
        }

        return (F);
    }

    public String getNN(String ort) {
        String ss = null;
        pon = UNI2PASCIII(ort, ort.length());
        int aaa = pon.size();
        int a = Add_vowel_A(pon, aaa);
        int b = rule_of_N3(pon, a);
        int c = Remove_halant(pon, b);
        int x = rule_of_NonZero(pon, c);
        int d = rule_of_ri(pon, x);
        int e = word_final_A(pon, d);
        int f = rule_of_jafala(pon, e);
        int g = rule_of_Cluster(pon, f);
        int h = rule_of_J_N3(pon, g);
        int i = rule_of_Bfala(pon, h);
        int j = rule_of_Mfala(pon, i);
        int k = rule_of_Rfala(pon, j);
        int y = rule_of_Ha(pon, k);
        int l = rule_of_KS3(pon, y);
        int m = rule_of_Sh(pon, l);
        int n = rule_of_Bisarga(pon, m);
        int o = rule_of_Onasar(pon, n);
        int p = rule_of_Aspirated(pon, o);
        int u = rule_of_A(pon, p);
        int q = rule_of_AA(pon, u);
        int r = rule_of_Candrabindu(pon, q);
        int t = rule_of_N6(pon, r);
        // int v = rule_of_Adj(pon, t);
        // int ww = rule_of_verb(pon, v);
        int xx = rule_of_ioito(pon, t);
//        int yy = rule_of_oya(pon, xx);
        int yy = rule_of_Y(pon, xx);
        // ArrayList aa = Num2IpaN(pon);
        ss = Arraylist2String(Num2IpaN(pon));

        return ss;
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
        int current, prev, j, next;
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
        int current, nz, next1, next2;
        for (nz = 0; nz <= noch - 1; nz++) {
            current = INword.get(nz);

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
        int final_letter, prev1, prev2;
        final_letter = INword.get(no_of_char - 1);
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
        int current, prev1, prev2, prev3, ja, next, next1;
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
        int current, prev, j, next;
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
        int ba, current, prev1, prev2;
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
        int ha, current, next;
        for (ha = 0; ha <= hcnt - 1; ha++) {
            current = INword.get(ha);

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
        int bi, current, next, next1, prev1;
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


            if (bi - 1 >= 0) {
                prev1 = INword.get(bi - 1);
            } else {
                prev1 = -1;
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
        int f, prev;
        f = INword.get(oncnt - 1);

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
        int cc, current, prev;
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
        int y, current, prev, next;
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
            ycnt = INword.size();
        }
        ycnt = INword.size();
        return (ycnt);
    }

    public int rule_of_N6(ArrayList<Integer> INword, int nochar) // Rule 22
    {

        int current, j, next;
        for (j = 0; j <= nochar - 1; j++) {
            current = INword.get(j);

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

    public int rule_of_ioito(ArrayList<Integer> Adj, int adj_len) {
        int final_letter, prev1;

        final_letter = Adj.get(adj_len - 1);
        if (adj_len - 1 > 0) {
            prev1 = Adj.get(adj_len - 2);
        } else {
            prev1 = -1;
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
   public ArrayList<String> Num2IpaN(ArrayList<Integer> INword) {
        int len, i;
        ArrayList<String> ipa = new ArrayList<String>();
        len = INword.size();
        for (i = 0; i <= len - 1; i++) {
            int a = INword.get(i);
            switch (a) {

                case 0:
                    ipa.add(i, "a");                           //A
                    break;
                case 2:
                case 4:
                    ipa.add(i, "a1");                           //A2,A1
                    break;
                case 1:
                    ipa.add(i, "a0");                           //A0
                    break;
                case 3:
                case 5:
                    ipa.add(i, "a10");                     //A20
                    break;
                case 6:
                case 8:
                case 10:
                case 12:
                    ipa.add(i, "i");                           //I,I1,I3,I2
                    break;
                case 9:
                case 13:
                    ipa.add(i, "i0");                           //I30
                    break;
                case 14:
                case 16:
                case 18:
                case 20:
                    ipa.add(i, "u");                           //U,U1,U2,U3
                    break;
                case 19:
                    ipa.add(i, "u0");                           //U20
                    break;
                case 22:
                case 23:
                    ipa.add(i, "ri");                     //R2,R3
                    break;
                case 24:
                case 26:
                    ipa.add(i, "e");                           //E,E3
                    break;
                case 25:
                case 27:
                    ipa.add(i, "e0");                           //E,E3
                    break;
                case 28:
                case 30:
                    ipa.add(i, "oi");                     //E4,E5
                    break;
                case 32:
                case 34:
                    ipa.add(i, "o");                           //O,O2
                    break;
                case 33:
                case 35:
                    ipa.add(i, "o0");                           //o0,O20
                    break;
                case 36:
                case 38:
                    ipa.add(i, "ou");                     //O1,O3
                    break;
                case 40:
                    ipa.add(i, "e1");                           //E1
                    break;
                case 42:
                    ipa.add(i, "e10");                     //E10
                    break;
                case 44:
                    ipa.add(i, "k");                           //K
                    break;
                case 45:
                    ipa.add(i, "k1");                     //K1
                    break;
                case 46:
                    ipa.add(i, "g");                           //G
                    break;
                case 47:
                    ipa.add(i, "g1");                     //G1
                    break;
                case 48:
                    ipa.add(i, "n2");                           //N2
                    break;
                case 49:
                    ipa.add(i, "c");                           //C
                    break;
                case 50:
                    ipa.add(i, "c1");                     //C1
                    break;
                case 51:
                case 69:
                    ipa.add(i, "j");                           //J
                    break;
                case 52:
                    ipa.add(i, "j1");                     //J1
                    break;
                case 54:
                    ipa.add(i, "t0");                           //T0
                    break;
                case 55:
                    ipa.add(i, "t10");                     //T10
                    break;
                case 56:
                    ipa.add(i, "d");                           //D0
                    break;
                case 57:
                    ipa.add(i, "dh");                     //D10
                    break;
//                case 58:
//                    ipa.add(i, "n");                           //N1
//                    break;
                case 59:
                    ipa.add(i, "t");                           //T
                    break;
                case 60:
                    ipa.add(i, "t1");                     //T1
                    break;
                case 61:
                    ipa.add(i, "d");                           //D
                    break;
                case 62:
                    ipa.add(i, "d1");                     //D1
                    break;
                case 63:
                case 58:
                    ipa.add(i, "n");                           //N
                    break;
                case 64:
                    ipa.add(i, "p");                           //P
                    break;
                case 65:
                    ipa.add(i, "p1");                     //P1
                    break;
                case 66:
                    ipa.add(i, "b");                           //B
                    break;
                case 67:
                    ipa.add(i, "b1");                     //B1
                    break;
                case 68:
                    ipa.add(i, "m");                           //M
                    break;
//                case 69:
//                    ipa.add(i, "j");                           //J2
//                    break;
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
                    ipa.add(i, "r0");                           //R0
                    break;
                case 78:
                    ipa.add(i, "r10");                     //R10
                    break;
                case 83:
                    ipa.add(i, "w");                           //W
                    break;
                case 87:
                    ipa.add(i, "s");                     //small s
                    break;







                case 86:
                    ipa.add(i, "ng0");                     //N6
                    break;

                default:
                    ipa.add(i, "X");
            }
            len = INword.size();
        }
        return (ipa);
    }

    ///////////////// int ArrayList to String conversion /////////////////////////////
    public String Arraylist2String(ArrayList<String> INword) {
        String listString = "";
        int len = INword.size();
        for (int i = 0; i <= len - 1; i++) {
            listString += INword.get(i);
        }
        return (listString);
    }
}
