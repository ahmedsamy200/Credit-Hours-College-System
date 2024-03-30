using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModels;
using BLL;

namespace DAL
{
    interface ISubjectRepository
    {
        bool Add(Subject sub);
        bool Update(SubjectVM sub);
        bool Delete(int id);
        SubjectVM GetByID(int id);
        SubjectVM CountHours(int id);
        IEnumerable<SubjectVM> GetAll();
        IEnumerable<SubjectVM> GetDptSubjects(int id);
        bool CheckIfAvailable(SubjectVM sub, int stdID);
    }

   public class SubjectRepository : ISubjectRepository
    {
        UniversityEntities db = new UniversityEntities();

        public bool Add(Subject sub)
        {
            try
            {
                if (sub != null)
                {

                    db.Subjects.Add(sub);
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

        public bool CheckIfAvailable(SubjectVM sub , int stdID)
        {
            var result = db.StudentSubjects.Where(x => x.studentID == stdID).ToList();
            if(result.Count == 0)
                sub.IsAvailable = true;
            foreach (var item in result)
            {
                if (item.Subject.day == sub.day)
                {
                    if(item.Subject.timeFrom == sub.timeFrom && item.Subject.timeTo == sub.timeTo)
                    {
                        sub.IsAvailable = false;
                        return false;
                    }

                }
                else
                {
                    sub.IsAvailable = true;
                   
                }
                    
            }
            if (sub.IsAvailable == true)
                return true;
            else
                return false;
        }

        public SubjectVM CountHours(int id)
        {
          
            ProfessorSubject std = db.ProfessorSubjects.FirstOrDefault(x => x.id == id);
            SubjectVM obj = new SubjectVM();

            obj.creditHours = std.Subject.creditHours;

            return obj;
        }

        public bool Delete(int id)
        {
            try
            {
                if (id > 0)
                {
                    Subject obj = db.Subjects.FirstOrDefault(x => x.subID == id);
                    if (obj != null)
                    {
                        db.Subjects.Remove(obj);
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

        public IEnumerable<SubjectVM> GetAll()
        {
            List<SubjectVM> std = new List<SubjectVM>();
            foreach (var item in db.Subjects)
            {
                SubjectVM obj = new SubjectVM();
                obj.subjectName = item.subjectName;
                obj.preSubject = item.preSubject;
                obj.deptID = item.deptID;
                obj.code = item.code;
                obj.creditHours = item.creditHours;
                obj.day = item.day;
                obj.timeFrom = item.timeFrom;
                obj.timeTo = item.timeTo;
                std.Add(obj);
            }
            return std;
        }


        public SubjectVM GetByID(int id)
        {
            Subject std = db.Subjects.FirstOrDefault(x => x.subID == id);
            SubjectVM obj = new SubjectVM();  
            obj.subjectName = std.subjectName;
            obj.preSubject = std.preSubject;
            obj.deptID = std.deptID;
            obj.code = std.code;
            obj.creditHours = std.creditHours;
            obj.day = std.day;
            obj.timeFrom = std.timeFrom;
            obj.timeTo = std.timeTo;
            return obj;
        }

        public IEnumerable<SubjectVM> GetDptSubjects(int id)
        {
           
            List<SubjectVM> std = new List<SubjectVM>();
            List<Subject> sub = db.Subjects.Where(x => x.deptID == id).ToList();

                             
            foreach (var item in sub)
            {
                SubjectVM obj = new SubjectVM();
                obj.subjectName = item.subjectName;
                obj.preSubject = item.preSubject;
                obj.deptID = item.deptID;
                obj.code = item.code;   
                obj.creditHours = item.creditHours;
                obj.day = item.day;
                obj.timeFrom = item.timeFrom;
                obj.timeTo = item.timeTo;
                std.Add(obj);
            }
            return std;
        }

        public bool Update(SubjectVM std)
        {
            try
            {
                Subject obj = db.Subjects.FirstOrDefault(x => x.subID == std.subID);
                if (obj != null)
                {
                    obj.subjectName = std.subjectName;
                    obj.preSubject = std.preSubject;
                    obj.deptID = std.deptID;
                    obj.code = std.code;
                    obj.creditHours = std.creditHours;
                    obj.day = std.day;
                    obj.timeFrom = std.timeFrom;
                    obj.timeTo = std.timeTo;
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
