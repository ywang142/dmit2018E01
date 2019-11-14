using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using ChinookSystem.Data.Entities;
using ChinookSystem.Data.DTOs;
using ChinookSystem.Data.POCOs;
using ChinookSystem.DAL;
using System.ComponentModel;
using DMIT2018Common.UserControls;
#endregion

namespace ChinookSystem.BLL
{
    public class EmployeeController
    {
        public List<string> Employees_GetTitles()
        {
            using(var context = new ChinookContext())
            {
                var results = (from x in context.Employees
                               select x.Title).Distinct();
                return results.ToList();
            }

        }
    }
}
