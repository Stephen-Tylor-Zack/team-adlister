package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    public static String titleError = "";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
          //  response.sendRedirect("/login?from=ads-create");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String[] cats_id = request.getParameterValues("cats_id");

        Ad ad = new Ad(
                user.getId(),
                request.getParameter("title"),
                request.getParameter("description"),
                Integer.parseInt(request.getParameter("price")),
                request.getParameter("city"),
                request.getParameter("state")
        );
        if (ad.getTitle().equalsIgnoreCase("")){
            titleError = "Error: Please input a title.";
            response.sendRedirect("/ads/create");
        }
        else {
            long ads_id = DaoFactory.getAdsDao().insert(ad);
            for (String cat_id : cats_id) {
                DaoFactory.getAdsCategoriesDao().insertPivot((int)ads_id, Integer.parseInt(cat_id));
            }
            response.sendRedirect("/ads");
        }
    }
}