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
        StudentRepository std = new StudentRepository();
        SubjectRepository repo = new SubjectRepository();
        UniversityEntities db = new UniversityEntities();
        StdSubjectRepository stdrepo = new StdSubjectRepository();
        ProfessorSubjectRepository Profrepo = new ProfessorSubjectRepository();

        public ActionResult My_Account()
        {
            return View();
        }
        public JsonResult GetUserData()
        {

            StudentVM us = std.GetByID((int)Session["UserID"]);

            //get the sum of std creditHours from db
            IEnumerable<StdSubjectVM> stdsub = stdrepo.GetAll();
            Session["all_creditHours"] = stdsub.Where(x => x.studentID == (int)Session["UserID"]).Select(x => x.credithours).Sum();
            return Json(us, JsonRequestBehavior.AllowGet);

        }
        public JsonResult GetDptSubjects()
        {          
            IEnumerable<ProfessorSubjectVM> sub = Profrepo.GetDptSubjects((int)Session["dptID"]);
            return Json(sub.OrderBy(x => x.subjectName).ToList(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult CountHours(SubjectVM s, int StdID, int id)
        {
            SubjectVM sub = repo.CountHours(id);
            if (repo.CheckIfAvailable(s, StdID))
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
            SubjectVM sub = repo.CountHours(ID);
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

            IEnumerable<ProfessorSubjectVM> sub = Profrepo.Slected(ID);
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
    }
}