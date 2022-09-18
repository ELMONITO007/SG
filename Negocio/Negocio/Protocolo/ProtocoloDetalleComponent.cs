using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Entities;
namespace Business.Negocio.Protocolo
{
    public class ProtocoloDetalleComponent
    {
        public ProtocoloDetalle Create(ProtocoloDetalle entity)

        { ProtocoloDetalleDAC protocoloDetalleDAC = new ProtocoloDetalleDAC();
            return protocoloDetalleDAC.Create(entity);
        }

        public List<ProtocoloDetalle> ReadbyProtocolo(int id_protocolo)
        {
            ProtocoloDetalleDAC protocoloDetalleDAC = new ProtocoloDetalleDAC();
            return protocoloDetalleDAC.ReadbyProtocolo(id_protocolo);
        }
        public ProtocoloDetalle ReadBy(int id)
        {
            ProtocoloDetalleDAC protocoloDetalleDAC = new ProtocoloDetalleDAC();
            return protocoloDetalleDAC.ReadBy(id);
        }
    }
}
