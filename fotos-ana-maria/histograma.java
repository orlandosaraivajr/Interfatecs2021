import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class histograma {

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
        bw.write(calcHist(list));
        bw.flush();
    }

    public static String calcHist(List<String> lista){
        double soma = 0;
        for(String s : lista){
            soma += Double.parseDouble(s);
        }
        List<String> h = new ArrayList<>();
        for(String s : lista){
            double v = Double.parseDouble(s)/soma;
            h.add(String.format("%.3f",v).replace(',', '.'));
        }
        return h.toString().replace("[", "").replace("]", "").replace(", ", "\n")+"\n";
    }
}