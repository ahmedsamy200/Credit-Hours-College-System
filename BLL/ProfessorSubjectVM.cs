using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProfessorSubjectVM
    {
        public int id { get; set; }
        public Nullable<int> professorID { get; set; }
        public Nullable<int> subjectID { get; set; }
        public string subjectName { get; set; }
        public string professorName { get; set; } 
        public string code { get; set; }
        public Nullable<double> creditHours { get; set; }
        public Nullable<int> preSubject { get; set; }
        public string preSubjectName { get; set; }
        public string day { get; set; }
        public string timeFrom { get; set; }
        public string timeTo { get; set; }
    }
}
