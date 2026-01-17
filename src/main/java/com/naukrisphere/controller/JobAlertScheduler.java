package com.naukrisphere.controller;

import java.util.List;

import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import com.naukrisphere.dao.AlertDAO;

public class JobAlertScheduler implements Job {

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        AlertDAO dao = new AlertDAO();
        List<String> emails = dao.getAllSubscribedEmails();

        for (String email : emails) {
            SendMail.sendEmail(email, 
                    "New Job Alerts - NaukriSphere",
                    "Hello,\n\nCheck new job opportunities on NaukriSphere.\nVisit Now!");
        }
    }

    public static void startScheduler() throws Exception {

        Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();

        if (!scheduler.isStarted()) {
            scheduler.start();
        }

        JobKey jobKey = new JobKey("jobAlert", "group1");

        if (!scheduler.checkExists(jobKey)) {

            JobDetail job = JobBuilder.newJob(JobAlertScheduler.class)
                    .withIdentity(jobKey)
                    .build();

            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity("jobAlertTrigger", "group1")
                    .withSchedule(
                        CronScheduleBuilder.cronSchedule("0 0 9 * * ?")
                    )
                    .build();

            scheduler.scheduleJob(job, trigger);
        }
    }
}

