using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Business { 
 public static class Texto
    {
        public static List<string> SepararTextoPorCaracter(char separador, string texto)

        {

            List<string> result = texto.Split(separador).ToList();

            return result;


        }




        public static string seperarLetrasDeUnaCadena(string texto)


        {
            string result="" ;

            foreach (var item in texto.ToCharArray())
            {

                if (char.IsLetter(item))
                {
                    result = result + item;

                }
                else
                {
                    break;
                }
            }
        return result; 
        
        }

        public static string seperarNumeroDeUnaCadena(string texto)


        {
            string result = "";

            foreach (var item in texto.ToCharArray())
            {

                if (char.IsNumber(item))
                {
                    result = result + item;

                }
               
            }
            return result;

        }

        public static List<string> QuitarDuplicadoListaString(List<string> lista)


        { 
        
        List<string>result=lista.Distinct().ToList();

            return result ;
        
        }


        public static string QuitarTodoLosEspaciosEnBlanco(string texto)

        {
            return Regex.Replace(texto, @"\s", "");


        }
    }
}
