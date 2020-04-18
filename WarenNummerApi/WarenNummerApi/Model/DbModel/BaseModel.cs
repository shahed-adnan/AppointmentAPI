using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WarenNummerApi.Model.DbModel
{
    public class BaseModel
    {
        public long Id { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
        public bool IsRemoved { get; set; }

    }
}
