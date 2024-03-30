using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using DataModels;
using DAL;

namespace UI.Controllers
{
    public class LoginController : Controller
    {
        StudentRepository repo = new StudentRepository();
        StdSubjectRepository stdrepo = new StdSubjectRepository();
        UniversityEntities db = new UniversityEntities();
        public ActionResult LoginPage()
        {
            return View();
        }

        public JsonResult CheckForStudent(Student std)
        {
            if (repo.CheckLogin(std))
            {
                IEnumerable<StudentVM> us = repo.GetAll();  
                Session["UserID"] = us.Where(x => x.nationalID == std.nationalID).Select(x => x.studentID).FirstOrDefault();
                Session["dptID"] = us.Where(x => x.nationalID == std.nationalID).Select(x => x.deptId).FirstOrDefault();              
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
            else
                return Json("erorr", JsonRequestBehavior.AllowGet);
        }
        public JsonResult AddNewStudent(Student std)
        {
            
            if (repo.Add(std))
            {
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
            else
                return Json("erorr", JsonRequestBehavior.AllowGet);
        }
        public JsonResult LoadDepartments()
        {
            var dpt = from obj in db.Departments
                      select new
                      {
                          dptID = obj.depID,
                          dptName = obj.deptName
                      };
            return Json(dpt.ToList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult LoadLevels()
        {
            var lvl = from obj in db.Levels
                      select new
                      {
                          lvlID = obj.levelID,
                          lvlName = obj.levelName
                      };
            return Json(lvl.ToList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult LoadGender()
        {
            var gnd = from obj in db.Genders
                      select new
                      {
                          genderID = obj.genderID,
                          genderName = obj.gender1
                      };
            return Json(gnd.ToList(), JsonRequestBehavior.AllowGet);
        }
    }
}