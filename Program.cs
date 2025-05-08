using MySqlConnector;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Projekt_adatbázis
{
    internal class Program
    {
        static void Main(string[] args)
        {

            bool exit = false;

            while (!exit)
            {
                Console.WriteLine("6 = kilépés");
                Console.Write("Válasszon egy feladatot(1-5): ");
                

                string input = Console.ReadLine();
                Console.Clear();

                switch (input)
                {
                    case "1":
                        string kapcsolat = "Server=localhost;User ID=root;Password=mysql;Database=foci2";
                        var foci_connection = new MySqlConnection(kapcsolat);
                        
                        foci_connection.Open();

                        MenuPont1(foci_connection);

                        foci_connection.Close();
                        break;
                    case "2":
                        string kapcsolat2 = "Server=localhost;User ID=root;Password=mysql;Database=foci2";
                        var foci2_connection = new MySqlConnection(kapcsolat2);
                        
                        foci2_connection.Open();

                        MenuPont2(foci2_connection);

                        foci2_connection.Close();
                        break;
                    case "3":
                        string kapcsolat3 = "Server=localhost;User ID=root;Password=mysql;Database=íjjászat";
                        var íjjászat_connection = new MySqlConnection(kapcsolat3);
                        íjjászat_connection.Open();

                        MenuPont3(íjjászat_connection);

                        íjjászat_connection.Close();
                        break;
                    case "4":
                        string kapcsolat4 = "Server=localhost;User ID=root;Password=mysql;Database=íjjászat";
                        var íjjászat2_connection = new MySqlConnection(kapcsolat4);
                        íjjászat2_connection.Open();
                        

                        MenuPont4(íjjászat2_connection);

                        íjjászat2_connection.Close();
                        break;
                    case "5":

                        string kapcsolat5 = "Server=localhost;User ID=root;Password=mysql;Database=kézilabda";
                        var kezi_connection = new MySqlConnection(kapcsolat5);
                        kezi_connection.Open();


                        MenuPont5(kezi_connection);

                        kezi_connection.Close();
                        break;
                    case "6":
                        exit = true;
                        break;
                    default:
                        Console.WriteLine("Érvénytelen választás, próbálja újra.");
                        break;
                }
            }
        }

        static void MenuPont1(MySqlConnection connection)
        {

            Console.WriteLine("1. feladat:");
            var command = new MySqlCommand("SELECT jatekos_id, nev\r\nFROM jatekosok\r\nWHERE kapus = TRUE;\r\n", connection);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(reader.GetInt64(0) + " "+ reader.GetString(1));
            }
            reader.Close();
           

        }
        static void MenuPont2(MySqlConnection connection)
        {

            Console.WriteLine("2. feladat:");
            var command = new MySqlCommand("SELECT jatekosok.nev\r\nFROM jatekosok\r\nWHERE jatekosok.kezdo = FALSE;\r\n", connection);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(reader.GetString(0));
            }
            reader.Close();

        }
        static void MenuPont3(MySqlConnection connection)
        {

            Console.WriteLine("3 feladat:");
            var command = new MySqlCommand("SELECT versenyzok.nev, eredmenyek.hibak_szama\r\nFROM versenyzok\r\nJOIN eredmenyek ON versenyzok.versenyzo_id = eredmenyek.versenyzo_id\r\nWHERE eredmenyek.osszpontszam > 270;\r\n", connection);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(reader.GetString(0) + " " + reader.GetInt64(1));
            }
            reader.Close();

        }
        static void MenuPont4(MySqlConnection connection)
        {

            Console.WriteLine("4. feladat:");
            var command = new MySqlCommand("SELECT CONCAT(tipus, ': ', leiras) AS tipus_es_leiras\r\nFROM megjegyzesek;\r\n", connection);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(reader.GetString(0));
            }
            reader.Close();

        }
        static void MenuPont5(MySqlConnection connection)
        {

            Console.WriteLine("5. feladat:");
            var command = new MySqlCommand("SELECT versenyzok.nev, eredmenyek.osszpontszam\r\nFROM versenyzok\r\nJOIN eredmenyek ON versenyzok.versenyzo_id = eredmenyek.versenyzo_id\r\nWHERE eredmenyek.tiszta_talalat > 20;\r\n", connection);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(reader.GetString(0) + " " +reader.GetInt64(1) );
            }
            reader.Close();

        }
    }

}
/*
1. feladat: Fociból ki írja a kapusok nevét és az ID-t.(1 gomb)

2. feladat: Íjászatban írd ki azok hibáinak számát, akiknek a pontja 270 fölött van.(2 gomb)

3. feladat: Kézilabdában írd ki a pontszámát azoknak, akiknek a tiszta találata több mint 20.(3 gomb)

4. feladat: íjjászat ból irja ki a megjegyzések tipusát és annak a leirását .(4 gomb)

5. feladat: Íjászatban a szenior korosztályú lány játékosok edzőinek nevét írd ki és az összpontámát.(5 gomb)

6 gomb a kilépés
*/