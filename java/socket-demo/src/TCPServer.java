import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class TCPServer {

    public static void main(String argv[]) throws Exception {
        ServerSocket serverSocket = new ServerSocket(6789);

        while(true) {
            Socket connectionSocket = serverSocket.accept();
            BufferedReader inFromClient = new BufferedReader(new InputStreamReader(connectionSocket.getInputStream()));
            DataOutputStream outToClient = new DataOutputStream(connectionSocket.getOutputStream());

            String message = inFromClient.readLine();
            System.out.println("Received: " + message);
            outToClient.writeBytes(message.toUpperCase() + '\n');
        }
    }

}
