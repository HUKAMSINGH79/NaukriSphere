package com.naukrisphere.controller;
import com.naukrisphere.dao.CompanyDao;
import com.naukrisphere.model.Company;
import com.naukrisphere.model.Job;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private JobDAO jobDAO;

    @Override
    public void init() {
        jobDAO = new JobDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Job> jobs = jobDAO.getAllJobs();
        request.setAttribute("jobs", jobs);
        
        List<Company> companies = CompanyDao.getTopCompanies();
        request.setAttribute("companies", companies);

        request.getRequestDispatcher("/Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);  
    }
}
