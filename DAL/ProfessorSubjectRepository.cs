using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModels;
using BLL;

namespace DAL
{
    interface IProfessorSubjectRepository
    {
        bool Add(ProfessorSubject sub);
        bool Update(ProfessorSubjectVM sub);
        bool Delete(int id);
        ProfessorSubjectVM GetByID(int id);
        IEnumerable<ProfessorSubjectVM> GetAll();
        IEnumerable<ProfessorSubjectVM> GetDptSubjects(int id);
    }

    public class ProfessorSubjectRepository : IProfessorSubjectRepository
    {
        UniversityEntities db = new UniversityEntities();

        public bool Add(ProfessorSubject pro)
        {
            try
            {
                if (pro != null)
                {

                    db.ProfessorSubjects.Add(pro);
                    db.SaveChanges();
                    return true;
                }
                else
                    return false;
            }
            catch
            {

                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                if (id > 0)
                {
                    ProfessorSubject obj = db.ProfessorSubjects.FirstOrDefault(x => x.id == id);
                    if (obj != null)
                    {
                        db.ProfessorSubjects.Remove(obj);
                        db.SaveChanges();
                        return true;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }

        public IEnumerable<ProfessorSubjectVM> GetAll()
        {
            List<ProfessorSubjectVM> std = new List<ProfessorSubjectVM>();
            foreach (var item in db.ProfessorSubjects)
            {
                ProfessorSubjectVM obj = new ProfessorSubjectVM();
                obj.subjectName = item.Subject.subjectName;
                obj.preSubject = item.Subject.preSubject;
                obj.code = item.Subject.code;
                obj.creditHours = item.Subject.creditHours;
                obj.day = item.Subject.day;
                obj.timeFrom = item.Subject.timeFrom.ToString();
                obj.timeTo = item.Subject.timeTo.ToString();
                obj.professorName = item.Professor.name;
                obj.professorID = item.professorID;
                obj.subjectID = item.subjectID;

                std.Add(obj);
            }
            return std;
        }

        public ProfessorSubjectVM GetByID(int id)
        {
            ProfessorSubject std = db.ProfessorSubjects.FirstOrDefault(x => x.id == id);
            ProfessorSubjectVM obj = new ProfessorSubjectVM();
            obj.professorName = std.Professor.name;
            obj.subjectID = std.subjectID;
            obj.code = std.Subject.code;
            obj.creditHours = std.Subject.creditHours;
            obj.day = std.Subject.day;
            obj.timeFrom = std.Subject.timeFrom.ToString();
            obj.timeTo = std.Subject.timeTo.ToString();
            obj.subjectName = std.Subject.subjectName;
            obj.preSubject = std.Subject.preSubject;
            obj.id = std.id;
            return obj;
        }

        public IEnumerable<ProfessorSubjectVM> Slected(int id)
        {
            List<ProfessorSubjectVM> std = new List<ProfessorSubjectVM>();
            var result = db.ProfessorSubjects.Where(x => x.id == id).ToList();
            foreach (var item in result)
            {
                ProfessorSubjectVM obj = new ProfessorSubjectVM();
                obj.subjectName = item.Subject.subjectName;
                obj.preSubject = item.Subject.preSubject;
                obj.preSubjectName = item.Subject.Subject2 == null ? "-" : item.Subject.Subject2.subjectName;
                obj.code = item.Subject.code;
                obj.creditHours = item.Subject.creditHours;
                obj.day = item.Subject.day;
                obj.timeFrom = item.Subject.timeFrom.ToString();
                obj.timeTo = item.Subject.timeTo.ToString();
                obj.professorName = item.Professor.name;
                obj.professorID = item.professorID;
                obj.subjectID = item.subjectID;
                obj.id = item.id;
                if (std.Select(x => x.id).Contains(obj.id))
                {

                }
                else
                    std.Add(obj);
            }
            return std;
        }

        public IEnumerable<ProfessorSubjectVM> GetDptSubjects(int id)
        {
            List<ProfessorSubjectVM> std = new List<ProfessorSubjectVM>();
            List<ProfessorSubject> sub = db.ProfessorSubjects.Where(x => x.Subject.deptID == id).ToList();
            foreach (var item in sub)
            {
                ProfessorSubjectVM obj = new ProfessorSubjectVM();
                obj.subjectName = item.Subject.subjectName;
                obj.preSubject = item.Subject.preSubject;
                obj.preSubjectName = item.Subject.Subject2 == null ? "-" : item.Subject.Subject2.subjectName;
                obj.code = item.Subject.code;
                obj.creditHours = item.Subject.creditHours;
                obj.day = item.Subject.day;
                obj.timeFrom = item.Subject.timeFrom.ToString();
                obj.timeTo = item.Subject.timeTo.ToString();
                obj.professorName = item.Professor.name;
                obj.professorID = item.professorID;
                obj.subjectID = item.subjectID;
                obj.id = item.id;
                std.Add(obj);
            }
            return std;
        }

        public bool Update(ProfessorSubjectVM sub)
        {
            try
            {
                ProfessorSubject obj = db.ProfessorSubjects.FirstOrDefault(x => x.id == sub.id);
                if (obj != null)
                {
                    obj.Professor.name = sub.professorName;
                    obj.subjectID = sub.subjectID;
                    obj.Subject.code = sub.code;
                    obj.Subject.creditHours = sub.creditHours;
                    obj.Subject.day = sub.day;
                    obj.Subject.preSubject = sub.preSubject;
                    db.SaveChanges();
                    return true;
                }
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }
    }
    
}
