using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;


    public class TablaDinamica
    {
        public int Documento { get; set; }
        public string NivelEducativo { get; set; }
        public string Institucion { get; set; }
        public string TituloObtenido { get; set; }

        public TablaDinamica(int documento, string nivelEducativo, string institucion, string tituloObtenido)
        {
            Documento = documento;
            NivelEducativo = nivelEducativo;
            Institucion = institucion;
            TituloObtenido = tituloObtenido;
        }
    }

