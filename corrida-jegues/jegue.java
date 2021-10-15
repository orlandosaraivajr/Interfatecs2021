import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

public class jegue {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        Map<Integer, String> venc_t1 = new TreeMap<Integer, String>();
        Map<Integer, String> venc_t2 = new TreeMap<Integer, String>();
        Map<Integer, String> venc_chegada = new TreeMap<Integer, String>();

        while (true) {
            String str = br.readLine();
            if (str == null)
                break;
            else {
                String[] linha = str.split(" ");
                venc_t1.put(Integer.parseInt(linha[1]), linha[0]);
                venc_t2.put(Integer.parseInt(linha[2]), linha[0]);
                venc_chegada.put(Integer.parseInt(linha[3]), linha[0]);
            }
        }
        bw.write(telemetria(venc_t1,venc_t2,venc_chegada));
        bw.flush();
    }

    public static String telemetria(Map<Integer, String> t1, Map<Integer, String> t2, Map<Integer, String> cheg) {
        return String.format("%s%s%s", ordenar("T1", t1), ordenar("T2", t2), ordenar("CHEGADA", cheg));
    }

    public static String ordenar(String checkpoint, Map<Integer, String> map) {
        return String.format("%s %s %s %s\n", checkpoint, map.values().toArray()[0], map.values().toArray()[1],
                map.values().toArray()[2]);
    }
}