package abbreviating;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Solucao do problema "abbreviating" da maratona interfatecs 2020
 */
public class abbreviating {

	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

		List<String> list = new ArrayList<>();
		while (true) {
			String str = br.readLine();
			if (str == null)
				break;
			else {
				String[] data = str.split(" ");
				list.add(abbrev(data));
			}
		}

		Collections.sort(list);

		String out = list.toString().replace("[", "").replace("]", "").replace(", ", "\n")+"\n";
		bw.write(out);
		bw.flush();
	}

	private static String abbrev(String[] data) {
		if (data.length == 1)
			return data[0];
		StringBuffer sb = new StringBuffer();
		for (int i = 1; i < data.length - 1; i++) {
			sb.append(data[i].charAt(0) + ". ");
		}
		return data[0] + " " + sb.toString() + data[data.length - 1];
	}

}
