import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.IOException;

public class fluxonator {
	public static final int L = 0;
	public static final int R = 1;
	public static final char A = 'A';
	public static final char B = 'B';
	public static final char C = 'C';
	public static final char D = 'D';
	public static final char E = 'E';

	public static int INV(int x) {
		return (x + 1) % 2;
	}

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		string entrada;
		int n, l1, l2, l3, i; 

		n = Integer.parseInt(br.readLine());
		for (i = 0; i < n; i++) {
			entrada = br.readLine();
			for (char e: entrada) {
				if(e == A) {
					if(l1 == L) bw.write(D);
					else {
						if(l2 == L) bw.write(D);
						else bw.write(E);
						l2 = INV(l2);
					}
					l1 = INV(l1);
				} else if(e == B) {
					if(l2 == L) bw.write(D);
					else bw.write(E);
					l2 = INV(l2);
				} else /*e==C*/{
					if(l3 == L) {
						if(l2 == L) bw.write(D);
						else bw.write(E);
						l2 = INV(l2);
					} else bw.write(E);
					l3 = INV(l3);
			}
			bw.newLine();
		}
    }
}
