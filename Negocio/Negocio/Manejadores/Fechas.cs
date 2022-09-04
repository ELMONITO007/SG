using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public static class Fechas
    {

        public static string FechaUsa(string fechaArg)


        {
            DateTime dateTime = DateTime.Parse(fechaArg);
            return dateTime.ToString("yyyy-MM-dd");
        
        
        
        
        }
        public static string FechaUsaAsnsi(string fechaArg)


        {
            DateTime dateTime = DateTime.Parse(fechaArg);
            return FormatearAAnsi( dateTime.ToString("yyyy-MM-dd"));




        }

        public static DateTime FirstDateOfWeekISO8601(int year, int weekOfYear)
        {
            DateTime jan1 = new DateTime(year, 1, 1);
            int daysOffset = DayOfWeek.Thursday - jan1.DayOfWeek;

            // Use first Thursday in January to get first week of the year as
            // it will never be in Week 52/53
            DateTime firstThursday = jan1.AddDays(daysOffset);
            var cal = CultureInfo.CurrentCulture.Calendar;
            int firstWeek = cal.GetWeekOfYear(firstThursday, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);

            var weekNum = weekOfYear;
            // As we're adding days to a date in Week 1,
            // we need to subtract 1 in order to get the right date for week #1
            if (firstWeek == 1)
            {
                weekNum -= 1;
            }

            // Using the first Thursday as starting week ensures that we are starting in the right year
            // then we add number of weeks multiplied with days
            var result = firstThursday.AddDays(weekNum * 7);

            // Subtract 3 days from Thursday to get Monday, which is the first weekday in ISO8601
            return result.AddDays(-3);
        }
        public static int ObtenerNumeroSemana(string fecha)


        {
            DateTime f = DateTime.Parse(fecha);
            DateTime v2 = new DateTime(f.Year, f.Month, f.Day);
            int x = System.Globalization.CultureInfo.CurrentUICulture.Calendar.GetWeekOfYear(v2, CalendarWeekRule.FirstDay, v2.DayOfWeek);

            return x;

        }

        public static string FormatearAFecha(string fecha)


        {

            string año = fecha.Substring(0, 4);
            string mes = fecha.Substring(4, 2);
            string dia = fecha.Substring(6, 2);

            string result = string.Concat(dia, "-", mes, "-", año);


            return result;

        }
        public static string FormatearAAnsi(string fecha)


        {

            string año = fecha.Substring(0, 4);
            string mes = fecha.Substring(5, 2);
            string dia = fecha.Substring(8, 2);

            string result = string.Concat(año, mes, dia);


            return result;

        }
    }
}
