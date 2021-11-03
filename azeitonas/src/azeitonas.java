import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.IOException;

public class azeitonas {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        while (true) {
            String str = br.readLine();
            if (str == null)
                break;
            else {
                String[] data = str.split(" ");
                bw.write(simetria(data[0], data[1]));
                bw.flush();
            }
        }
    }

    public static String simetria(String v1, String v2){

        try{
            int x = Integer.parseInt(v1);
            int y = Integer.parseInt(v2);

            if (x <= 0 || y <= 0 || (x==y))
                return "ERRO";

            return String.format("%s %s\n%s %s\n%s %s\n%s %s\n%s %s\n%s %s\n%s %s\n%s %s",
                x,y,
                y,x,
                y,-x,
                x,-y,
                -x,-y,
                -y,-x,
                -y,x,
                -x,y
            );

        }catch(Exception erro){
            return "ERRO";
        }

    }
}