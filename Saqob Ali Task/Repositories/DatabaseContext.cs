using Microsoft.EntityFrameworkCore;
using Models;
using Saqob_Ali_Task.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Repositories
{
    public class DatabaseContext : DbContext
    {
        public DatabaseContext( DbContextOptions<DatabaseContext> options ) : base(options)
        {
        }
        public DbSet<ShipperModel> Shipper { get; set; }


        // Override OnModelCreating to map the stored procedure
        protected override void OnModelCreating( ModelBuilder modelBuilder )
        {
            modelBuilder.Entity<ShipperShipment>().HasNoKey();

            modelBuilder.Entity<ShipperModel>().HasNoKey();

        }
    }
}
