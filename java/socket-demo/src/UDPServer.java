import java.net.DatagramPacket;
import java.net.DatagramSocket;

class UDPServer  {

    public static void main(String args[]) throws Exception {
        DatagramSocket serverSocket = new DatagramSocket(9876);
        byte[] receiveData = new byte[1024];

        while(true) {
            DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);

            serverSocket.receive(receivePacket);
            String message = new String(receivePacket.getData());
            System.out.println("RECEIVED: " + message);

            byte[] sendData = message.toUpperCase().getBytes();
            DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length,
                receivePacket.getAddress(), receivePacket.getPort());
            serverSocket.send(sendPacket);
        }
    }

}