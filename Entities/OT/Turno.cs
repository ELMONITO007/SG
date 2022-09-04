
using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace Entities {
	public class Turno : EntityBase {

		public override int Id { get; set; }
		public int CantidadOT { get; set; }



		[DataType(DataType.Date), Required]
		[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]

		public string FechaRecepcionMateriales { get; set; }


		[DataType(DataType.Date), Required]
		[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
		public string FechaComienzoDeEnsayo  { get; set; }

		[DataType(DataType.Date), Required]
		[DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
		public string FechaFinDeEnsayo { get; set; }
        public OrdenTrabajo orden { get; set; }
        public Turno(OrdenTrabajo _orden){
			orden =  _orden;
		}
        public Turno()
        {

        }

	}

	

}