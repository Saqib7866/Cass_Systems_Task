using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Protocols;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using Models;
using Saqob_Ali_Task.Repositories;
using Microsoft.EntityFrameworkCore;
using System.Data;
using Microsoft.Extensions.Options;
using Saqob_Ali_Task.Models;

namespace Repositories
{
    public class ShipperRepository : IShipperRepository
    {
        private readonly IConfiguration _config;
        private readonly DatabaseContext _databaseContext;

        public ShipperRepository( IConfiguration config, DatabaseContext databaseContext )
        {
            _config = config;
            _databaseContext = databaseContext;
        }

        public List<ShipperModel> GetAllShipper() 
        {
            var shipper_details = _databaseContext.Shipper.Where(x => x.shipper_name != null || x.shipper_name != "").ToList();
            return shipper_details;
        }

        public List<ShipperShipment> GetShipmentDetails( int shipper_id )
        {
            string dbConnectionString = _config.GetConnectionString("DefaultConnection");

            List<ShipperShipment> shipmentDetailsList = new List<ShipperShipment>();
            using ( SqlConnection connection = new SqlConnection(dbConnectionString) )
            {
                SqlCommand command = new SqlCommand("Shipper_Shipment_Details", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@shipper_id", shipper_id);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while ( reader.Read() )
                {
                    ShipperShipment shipmentDetails = new ShipperShipment();
                    shipmentDetails.shipment_id = Convert.ToInt32(reader["shipment_id"]);
                    shipmentDetails.shipper_name = reader["shipper_name"].ToString();
                    shipmentDetails.carrier_name = reader["carrier_name"].ToString();
                    shipmentDetails.shipment_description = reader["shipment_description"].ToString();
                    shipmentDetails.shipment_weight = Convert.ToDecimal(reader["shipment_weight"]);
                    shipmentDetails.shipment_rate_description = reader["shipment_rate_description"].ToString();
                    shipmentDetailsList.Add(shipmentDetails);
                }
                reader.Close();
            }
            return shipmentDetailsList;
        }
    }
}
