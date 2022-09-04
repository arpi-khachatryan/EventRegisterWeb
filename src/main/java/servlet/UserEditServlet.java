package servlet;

import manager.EventManager;
import manager.UserManager;
import model.Event;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/users/edit")
public class UserEditServlet extends HttpServlet {
    private UserManager userManager = new UserManager();
    private EventManager eventManager = new EventManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        User user = userManager.getById(userId);
        req.setAttribute("events", eventManager.getAll());
        req.setAttribute("user", user);
        req.getRequestDispatcher("/WEB-INF/editUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        int eventId = Integer.parseInt(req.getParameter("event_id"));
        Event event = eventManager.getById(eventId);
        int userId = Integer.parseInt(req.getParameter("id"));
        User user = User.builder()
                .name(name)
                .surname(surname)
                .email(email)
                .event(event)
                .id(userId)
                .build();
        userManager.edit(user);
        resp.sendRedirect("/users");
    }
}
