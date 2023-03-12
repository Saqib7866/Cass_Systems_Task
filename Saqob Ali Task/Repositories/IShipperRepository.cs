using Models;

namespace Saqob_Ali_Task.Repositories
{
    public interface IShipperRepository
    {
        List<ShipperModel> GetAllShipper();
        List<ShipperShipment> GetShipmentDetails( int shipper_id );
    }
}
