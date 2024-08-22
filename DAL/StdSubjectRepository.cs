using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModels;
using BLL;

namespace DAL
{
    interface IStdSubjectRepository
    {
        bool Add(StudentSubject sub);
        bool Update(StdSubjectVM sub);
        bool Delete(int id , int StudentID);
        StdSubjectVM GetByID(int id);
        IEnumerable<StdSubjectVM> GetAll();
        IEnumerable<StdSubjectVM> GetStdSubjects(int id);
    }

    public class StdSubjectRepository : IStdSubjectRepository
    {
        UniversityEntities db = new UniversityEntities();

        public bool Add(StudentSubject sub)
        {
            try
            {
                if (sub != null)
                {

                    db.StudentSubjects.Add(sub);
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


        public bool Delete(int id , int studentID)
        {
            try
            {
                if (id > 0)
                {
                    StudentSubject obj = db.StudentSubjects.FirstOrDefault(x => x.id == id && x.studentID == studentID);
                    if (obj != null)
                    {
                        db.StudentSubjects.Remove(obj);
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

        public IEnumerable<StdSubjectVM> GetAll()
        {
            List<StdSubjectVM> std = new List<StdSubjectVM>();
            foreach (var item in db.StudentSubjects)
            {
                StdSubjectVM obj = new StdSubjectVM();
                obj.id = item.id;
                obj.studentID = item.studentID;
                obj.subjectID = item.subjectID;
                obj.isPassed = item.isPassed;
                obj.credithours = item.Subject.creditHours;
                std.Add(obj);
            }
            return std;
        }
        public IEnumerable<StdSubjectVM> GetStdSubjects(int id)
        {
            List<StdSubjectVM> std = new List<StdSubjectVM>();
            var result = db.StudentSubjects.Where(x => x.studentID == id).ToList();
            foreach (var item in result)
            {
                StdSubjectVM obj = new StdSubjectVM();
                obj.id = item.id;
                obj.studentID = item.studentID;
                obj.subjectID = item.subjectID;
                obj.isPassed = item.isPassed;
                obj.credithours = item.Subject.creditHours;
                obj.subjectName = item.Subject.subjectName;
                obj.preSubject = item.Subject.preSubject;
                obj.preSubjectName = item.Subject.Subject2 == null ? "-" : item.Subject.Subject2.subjectName;
                obj.code = item.Subject.code;
                obj.day = item.Subject.day;
                obj.timeFrom = item.Subject.timeFrom.ToString();
                obj.timeTo = item.Subject.timeTo.ToString();
                
                std.Add(obj);
            }
            return std;
        }
        public StdSubjectVM GetByID(int id)
        {
            StudentSubject std = db.StudentSubjects.FirstOrDefault(x => x.id == id);
            StdSubjectVM obj = new StdSubjectVM();
            obj.id = std.id;
            obj.studentID = std.studentID;
            obj.subjectID = std.subjectID;
            obj.isPassed = std.isPassed;
            return obj;
        }

        public bool Update(StdSubjectVM sub)
        {
            try
            {
                StudentSubject obj = db.StudentSubjects.FirstOrDefault(x => x.id == sub.id);
                if (obj != null)
                {
                    obj.studentID = sub.studentID;
                    obj.subjectID = sub.subjectID;
                    obj.isPassed = sub.isPassed;
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

