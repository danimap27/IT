/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parking;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import parking.Coche;
import java.util.Date;

/**
 *
 * @author Dani
 */
public class Parking {

    public static List<Coche> obtenerCoches() throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");

        List<Coche> coches = new ArrayList<Coche>(10);
        coches.add(new Coche("12784HIH", "BMW", dateFormat.parse("10:05"), null, 30));
        coches.add(new Coche("76234AAC", "Toyota", dateFormat.parse("10:07"), dateFormat.parse("10:35"), 30));
        coches.add(new Coche("32162BAQ", "Audi", dateFormat.parse("10:45"), null, 90));
        coches.add(new Coche("87823CDA", "Mercedes", dateFormat.parse("10:46"), dateFormat.parse("11:05"), 15));

        return coches;
    }
}
