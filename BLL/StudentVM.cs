using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BLL
{
    public class StudentVM
    {
        public int studentID { get; set; }
        public Nullable<decimal> nationalID { get; set; }
        public string password { get; set; }
        public string firstName { get; set; }
        public string midName { get; set; }
        public string lastName { get; set; }
        public string fullName { get; set; }
        public Nullable<int> deptId { get; set; }
        public string deptName { get; set; }
        public string image { get; set; }
        public string mobile { get; set; }
        public Nullable<int> genderID { get; set; }
        public string genderName { get; set; }
        public Nullable<int> levelID { get; set; }
        public string levelName { get; set; }
        public Nullable<bool> isActive { get; set; }
    }
}
