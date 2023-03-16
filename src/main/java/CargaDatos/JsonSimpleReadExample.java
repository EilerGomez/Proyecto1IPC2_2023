package CargaDatos;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class JsonSimpleReadExample {

    public static void main(String[] args) {

        JSONParser parser = new JSONParser();

        try {

            Object obj = parser.parse(new FileReader("C:\\Users\\HP\\Documents\\NetBeansProjects\\Proyecto1Ipc22023\\src\\main\\webapp\\entrada.json"));
            
            JSONObject jsonObject = (JSONObject) obj;
            System.out.println(jsonObject);

            long codigo = (Long) jsonObject.get("codigo");
            System.out.println(codigo);

            String age = (String) jsonObject.get("nombre");
            System.out.println(age);
            
            double costo = (double) jsonObject.get("costo");
            System.out.println(costo);
            
            long precio = (long) jsonObject.get("precio");
            System.out.println(precio);
            
            long existencias = (Long) jsonObject.get("existencias");
            System.out.println(existencias);

            /*  // loop array
            JSONArray msg = (JSONArray) jsonObject.get("messages");
            Iterator<String> iterator = msg.iterator();
            while (iterator.hasNext()) {
            System.out.println(iterator.next());
            }*/

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }

}