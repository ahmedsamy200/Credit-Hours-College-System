using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SubjectVM
    {
        public int subID { get; set; }
        public string subjectName { get; set; }
        public string professorName { get; set; }
        public Nullable<int> professorID { get; set; }
        public Nullable<int> deptID { get; set; }
        public string code { get; set; }
        public Nullable<double> creditHours { get; set; }
        public Nullable<int> preSubject { get; set; }
        public string preSubjectName { get; set; }
        public string day { get; set; }
        public Nullable<System.TimeSpan> timeFrom { get; set; }
        public Nullable<System.TimeSpan> timeTo { get; set; }
        public bool canChoise { get; set; }
        public bool IsAvailable { get; set; }
    }
}
