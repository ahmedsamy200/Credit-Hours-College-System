using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using DataModels;
using DAL;
using System.IO;

namespace UI.Controllers
{
    public class StudentController : Controller
    {
        StudentRepository stdRepo = new StudentRepository();
        SubjectRepository subRepo = new SubjectRepository();
        UniversityEntities db = new UniversityEntities();
        StdSubjectRepository stdSubRepo = new StdSubjectRepository();
        ProfessorSubjectRepository ProfRepo = new ProfessorSubjectRepository();

        public ActionResult AddSubjects()
        {
            if (Session["UserID"] == null)
                return RedirectToAction("LoginPage", "Login");
            return View();
        } 
        public ActionResult MySubjects()
        {
            if (Session["UserID"] == null)
                    return RedirectToAction("LoginPage", "Login");
            return View();
        }
        public JsonResult GetUserData()
        {

            StudentVM us = stdRepo.GetByID((int)Session["UserID"]);

            //get the sum of std creditHours from db
            IEnumerable<StdSubjectVM> stdsub = stdSubRepo.GetAll();
            Session["all_creditHours"] = stdsub.Where(x => x.studentID == (int)Session["UserID"]).Select(x => x.credithours).Sum();
            return Json(us, JsonRequestBehavior.AllowGet);

        }
        public JsonResult GetDptSubjects()
        {          
            IEnumerable<ProfessorSubjectVM> sub = ProfRepo.GetDptSubjects((int)Session["dptID"]);
            return Json(sub.OrderBy(x => x.subjectName).ToList(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStudntSubjects()
        {
            IEnumerable<StdSubjectVM> sub = stdSubRepo.GetStdSubjects((int)Session["UserID"]);
            return Json(sub.OrderBy(x => x.subjectName).ToList(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult CountHours(SubjectVM s, int StdID, int id)
        {
            SubjectVM sub = subRepo.CountHours(id);
            if (subRepo.CheckIfAvailable(s, StdID))
            {
                sub.IsAvailable = true;
                sub.canChoise = true;
                sub.canChoise = true;
                Session["hours"] = (double)sub.creditHours;
                double x = Convert.ToDouble(Session["all_creditHours"]);
                Session["all_creditHours"] = x + (double)Session["hours"];
                if ((double)Session["all_creditHours"] > 18)
                {
                    Session["all_creditHours"] = (double)Session["all_creditHours"] - (double)Session["hours"];
                    sub.canChoise = false;
                }
                sub.creditHours = (double)Session["all_creditHours"];
                return Json(sub, JsonRequestBehavior.AllowGet);

            }
            else
            {
                sub.IsAvailable = false;
                sub.canChoise = false;
                return Json(sub, JsonRequestBehavior.AllowGet);
            }


        }
        public JsonResult RemoveHours(int ID)
        {
            SubjectVM sub = subRepo.CountHours(ID);
            Session["hours"] = (double)sub.creditHours;
            double x = Convert.ToDouble(Session["all_creditHours"]);

            Session["all_creditHours"] = x - (double)Session["hours"];
            if ((double)Session["all_creditHours"] > 18)
            {
                Session["all_creditHours"] = (double)Session["all_creditHours"] - (double)Session["hours"];

            }
            sub.creditHours = (double)Session["all_creditHours"];

            return Json(sub, JsonRequestBehavior.AllowGet);
        }
        public JsonResult SlectedSubjects(int ID)
        {

            IEnumerable<ProfessorSubjectVM> sub = ProfRepo.Slected(ID);
            return Json(sub, JsonRequestBehavior.AllowGet);
        }
        public JsonResult SaveSubjects(List<StudentSubject> Subjects)
        {

            //Check for NULL.
            if (Subjects == null)
            {
                Subjects = new List<StudentSubject>();
            }

            //Loop and Add records.
            foreach (StudentSubject obj in Subjects)
            {
                db.StudentSubjects.Add(obj);
            }
            int savedSubjects = db.SaveChanges();
            return Json(savedSubjects);

        }


        public JsonResult DeleteSubject(int id)
        {
            try
            {
                int userID = (int)Session["UserID"];
                var result = stdSubRepo.Delete(id , userID);
                if (result)
                {
                    return Json("success", JsonRequestBehavior.AllowGet);
                }
                return Json("failed", JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}