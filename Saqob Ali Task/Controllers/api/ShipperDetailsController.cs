using Microsoft.AspNetCore.Mvc;
using Repositories;
using Saqob_Ali_Task.Repositories;

namespace Saqob_Ali_Task.Controllers.api
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShipperDetailsController : ControllerBase
    {
        private IShipperRepository _shipperRepository;
        public ShipperDetailsController( IShipperRepository shipperRepository )
        {
            _shipperRepository = shipperRepository;
        }


        [HttpGet]
        [Route("GetAllShippers")]
        public IActionResult GetAllShippers()
        {
            try
            {

                var shipperDetails = _shipperRepository.GetAllShipper();
                if ( shipperDetails == null )
                {
                    return NotFound();
                }
                return Ok(shipperDetails);
            }
            catch ( Exception ex )
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("GetAll")]
        public IActionResult GetAll(int id)
        {
            try
            {

                var shipperDetails = _shipperRepository.GetShipmentDetails(id);
                if (shipperDetails == null)
                {
                    return NotFound();
                }
                return Ok(shipperDetails);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
