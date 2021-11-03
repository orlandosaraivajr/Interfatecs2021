import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.IOException;

public class industria {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        while (true) {
            String str = br.readLine();
            if (str == null)
                break;
            else {
                String[] linha = str.split(" ");
				bw.write(seleciona(Integer.parseInt(linha[0]), Integer.parseInt(linha[1])));
                bw.flush();
            }
        }

    }

    public static int seleciona(int a, int b) {
        if (a == 1)
            return 1;
        return (seleciona(a - 1, b) + b - 1) % a + 1;
    }
}
