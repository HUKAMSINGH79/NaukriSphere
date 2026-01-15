package com.naukrisphere.apicall;

import com.naukrisphere.model.Job;
import com.google.gson.*; // Add Gson library
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class Search_Job_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String APP_ID = "6562fcd6";   
    private static final String APP_KEY = "7aceb11fcb3c73a444aab0c1144cd3a2";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().isEmpty()) {
            keyword = "Software"; // Default job type
        }

        List<Job> jobs = fetchJobsFromAdzuna(keyword);

        request.setAttribute("jobs", jobs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
        dispatcher.forward(request, response);
    }

    private List<Job> fetchJobsFromAdzuna(String keyword) {
        List<Job> jobs = new ArrayList<>();

        try {
            String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
            String apiUrl =
                "https://api.adzuna.com/v1/api/jobs/in/search/1"
                + "?app_id=" + APP_ID
                + "&app_key=" + APP_KEY
                + "&what=" + encodedKeyword
                + "&results_per_page=20"
                + "&content-type=application/json";

            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            BufferedReader br = new BufferedReader(
                new InputStreamReader(conn.getInputStream())
            );

            JsonObject responseJson = JsonParser.parseReader(br).getAsJsonObject();
            JsonArray resultArray = responseJson.getAsJsonArray("results");

            for (JsonElement element : resultArray) {
                JsonObject jobData = element.getAsJsonObject();

                String title = jobData.get("title").getAsString();
                String company = jobData.getAsJsonObject("company").get("display_name").getAsString();
                String location = jobData.getAsJsonObject("location").get("display_name").getAsString();
                String salary = jobData.has("salary_min") ? jobData.get("salary_min").getAsString() : "Not specified";
                
                String applyUrl = jobData.get("redirect_url").getAsString();

                Job job = new Job(0, title, company, location, salary, "Full-Time");
                job.setApplyLink(applyUrl);
                jobs.add(job);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jobs;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
    }
}

