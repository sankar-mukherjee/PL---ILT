package form;


public class GenerateXml implements java.io.Serializable{
    
	private String grapheme;
        private String phoneme;
        private String pos;
        private String meaning;
        private String morphology;

        public GenerateXml(String grapheme, String pos, String phoneme, String meaning){

               this.grapheme =  grapheme;
               this.phoneme =  phoneme;
               this.pos =  pos;
               this.meaning = meaning;
          
  
        }
public String getGrapheme() {

        return grapheme;
    }

    public String getPhoneme() {

        return phoneme;
    }
   public String getPos() {

        return pos;
    }
	public String getMeaning() {

        return meaning;
    }
       
}
