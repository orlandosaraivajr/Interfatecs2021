import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.IOException;

public class squarecity {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        while (true) {
            String str = br.readLine();
            if (str == null) {
                break;
            } else {
                bw.write(numeroCasas(str));
                bw.flush();
            }
        }
    }

    public static String numeroCasas(String strX) {
        try {
            int x = Integer.parseInt(strX);
            int c = (int) (Math.ceil(Double.parseDouble(strX) / 2) - 1);
            String[][] m = new String[x][x];
            for (int i = 0; i < m.length; i++) {
                for (int j = 0; j < m.length; j++) {
                    int d = Math.max(Math.abs(i - c), Math.abs(j - c));
                    m[i][j] = Integer.toString(d);
                }
            }

            int cont = 0;
            for (int i = 0; i < m.length; i++) {
                for (int j = 0; j < m.length; j++) {
                    if (Integer.parseInt(m[i][j]) % 2 != 0) {
                        m[i][j] = "C";
                    } else {
                        m[i][j] = "R";
                    }
                    if (i == j) {
                        m[i][j] = "A";
                    }
                    if (m[i][j].equals("C")) {
                        cont++;
                    }
                }
            }
            return Integer.toString(cont);
        } catch (Exception erro) {
            return "ERRO";
        }
    }
}