using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ShipperShipment
    {
		public int shipment_id { get; set; }
		public string shipper_name { get; set; }
		public string carrier_name { get; set; }
		public string shipment_description { get; set; }
		public decimal shipment_weight { get; set; }
		public string shipment_rate_description { get; set; }
	}
}
