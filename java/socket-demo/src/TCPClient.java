import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.Socket;

class TCPClient  {

    public static void main(String argv[]) throws Exception {
        Socket clientSocket = new Socket("localhost", 6789);

        BufferedReader inFromUser = new BufferedReader( new InputStreamReader(System.in));
        BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        DataOutputStream outToServer = new DataOutputStream(clientSocket.getOutputStream());

        outToServer.writeBytes(inFromUser.readLine() + '\n');
        System.out.println("FROM SERVER: " + inFromServer.readLine());

        clientSocket.close();
    }

}