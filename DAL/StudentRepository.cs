using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModels;
using BLL;

namespace DAL
{
    interface IStudentRepository
    {
        bool Add(Student std);
        bool Update(StudentVM std);
        bool Delete(int id);
        StudentVM GetByID(int id);
        IEnumerable<StudentVM> GetAll();
        bool CheckLogin(Student std);
    }

   public class StudentRepository : IStudentRepository
    {
        UniversityEntities db = new UniversityEntities();

        public bool Add(Student std)
        {
            try
            {
                if(std != null)
                {
                    var validNatID = db.Students.Where(x => x.nationalID == std.nationalID).SingleOrDefault();
                    if (validNatID == null)
                    {
                        db.Students.Add(std);
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

        public bool CheckLogin(Student std)
        {
           
            var obj = db.Students.Where(x => x.nationalID == std.nationalID).SingleOrDefault();
            var check = db.Students.Select(x => x.nationalID).Contains(std.nationalID);
            if (check)
            {
                if (obj.password == std.password)
                {
                    return true;
                }
            }

            return false;
        }

        public bool Delete(int id)
        {
            try
            {
                if (id > 0)
                {
                    Student obj = db.Students.FirstOrDefault(x => x.studentID == id);
                    if (obj != null)
                    {
                        db.Students.Remove(obj);
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

        public IEnumerable<StudentVM> GetAll()
        {
            List<StudentVM> std = new List<StudentVM>();
            foreach (var item in db.Students)
            {
                StudentVM obj = new StudentVM();
                obj.fullName = item.firstName + " " + item.midName + " " + item.lastName;
                obj.firstName = item.firstName;
                obj.midName = item.midName;
                obj.lastName = item.lastName;
                obj.deptId = item.deptId;
                obj.genderID = item.genderID;
                obj.image = item.image;
                obj.isActive = item.isActive;
                obj.levelID = item.levelID;
                obj.mobile = item.mobile;
                obj.nationalID = item.nationalID;
                obj.deptName = item.Department.deptName;
                obj.studentID = item.studentID;
                std.Add(obj);
            }
            return std;
        }

        public StudentVM GetByID(int id)
        {
            Student std = db.Students.FirstOrDefault(x => x.studentID == id);
            StudentVM obj = new StudentVM();  
            obj.fullName = std.firstName + " " + std.midName + " " + std.lastName;
            obj.firstName = std.firstName ;
            obj.deptId = std.deptId;
            obj.genderID = std.genderID;
            obj.genderName = std.Gender.gender1;
            obj.image = std.image;
            obj.isActive = std.isActive;
            obj.levelID = std.levelID;
            obj.levelName = std.Level.levelName;
            obj.mobile = std.mobile;
            obj.nationalID = std.nationalID;
            obj.password = std.password;
            obj.deptName = std.Department.deptName;
            obj.studentID = std.studentID;
            return obj;
        }

        public bool Update(StudentVM std)
        {
            try
            {
                Student obj = db.Students.FirstOrDefault(x => x.studentID == std.studentID);
                if (obj != null)
                {
                    obj.firstName = std.firstName;
                    obj.lastName = std.lastName;
                    obj.midName = std.midName;
                    obj.deptId = std.deptId;
                    obj.genderID = std.genderID;
                    obj.image = std.image;
                    obj.isActive = std.isActive;
                    obj.levelID = std.levelID;
                    obj.mobile = std.mobile;
                    obj.nationalID = std.nationalID;
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
