package com.naukrisphere.controller;

import javax.servlet.*;

public class AppContextListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent event) {
        try {
            JobAlertScheduler.startScheduler();
            System.out.println("Scheduler Started...");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void contextDestroyed(ServletContextEvent event) {}
}
