package servlet;

import manager.EventManager;
import model.Event;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/events/delete")
public class DeleteEventServlet extends HttpServlet {
    private EventManager eventManager = new EventManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Event> eventsList = eventManager.getAll();
        req.setAttribute("events", eventsList);
        req.getRequestDispatcher("/WEB-INF/deleteEvent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        eventManager.deleteEventById(id);
        resp.sendRedirect("/events");
    }
}
