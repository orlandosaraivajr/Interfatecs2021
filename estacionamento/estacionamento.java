import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class estacionamento {

    public static void main(String[] args) throws IOException {
        var br = new BufferedReader(new InputStreamReader(System.in));
        var bw = new BufferedWriter(new OutputStreamWriter(System.out));

        List<String> list = new ArrayList<>();
        while (true) {
            String str = br.readLine();
            if (str == null)
                break;
            else {
                list.add(str);
            }
        }
        bw.write(encontrarVaga(list));
        bw.flush();
    }

    public static String encontrarVaga(List<String> lista){

        Map<Integer,String> vagas = new HashMap<Integer,String>();

        final int TOTAL_VAGAS = 15;
        for(String s : lista){
            int posicao = 0;
            for(char c : s.toCharArray()){
                posicao += (int)c;
            }
            posicao = (posicao % TOTAL_VAGAS)+1;
            if (vagas.containsKey(posicao) == false){
                vagas.put(posicao, s);
            }
        }

        String res = "";
        for (Map.Entry<Integer,String> e : vagas.entrySet()) {
            res += String.format("%s %s \n",e.getKey(),e.getValue());
        }
        return res;
    }
}