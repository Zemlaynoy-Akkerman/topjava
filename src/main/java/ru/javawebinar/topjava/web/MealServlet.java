package ru.javawebinar.topjava.web;

import org.slf4j.Logger;
import ru.javawebinar.topjava.model.UserMeal;
import ru.javawebinar.topjava.repository.UserMealRepository;
import ru.javawebinar.topjava.repository.UserMealRepositoryImpl;
import ru.javawebinar.topjava.util.UserMealsUtil;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Objects;

import static org.slf4j.LoggerFactory.getLogger;

public class MealServlet extends HttpServlet {

    private UserMealRepository repository;
    private static final Logger LOG = getLogger(MealServlet.class);

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        repository = new UserMealRepositoryImpl();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if(action == null){
            LOG.info("get All meal");
            req.setAttribute("mealsList",UserMealsUtil.getWithExceeded(repository.getAll(),2000));
            req.getRequestDispatcher("/show_meals.jsp").forward(req,resp);
        } else if (action.equals("delete")){
            int id = getId(req);
            LOG.info("delete {}", id);
            repository.delete(id);
            resp.sendRedirect("meals");
        } else {
            final UserMeal userMeal = action.equals("create") ?
                    new UserMeal(LocalDateTime.now(), "",1000) :
                    repository.getById(getId(req));
            req.setAttribute("meal",userMeal);
            req.getRequestDispatcher("/editMeal.jsp").forward(req,resp);
        }
    }

    private int getId(HttpServletRequest req) {
        String stringId = Objects.requireNonNull(req.getParameter("id"));
        return Integer.parseInt(stringId);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
