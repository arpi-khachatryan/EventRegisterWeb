package servlet;

import manager.EventManager;
import model.Event;
import model.EventType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/events/edit")
public class EventEditServlet extends HttpServlet {
    private EventManager eventManager = new EventManager();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int eventId = Integer.parseInt(req.getParameter("id"));
        Event event = eventManager.getById(eventId);
        req.setAttribute("events", event);
        req.getRequestDispatcher("/WEB-INF/editEvent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String place = req.getParameter("place");
            Boolean isOnline = Boolean.parseBoolean(req.getParameter("is_online"));
            EventType eventType = EventType.valueOf(req.getParameter("event_type"));
            Double price = Double.parseDouble(req.getParameter("price"));
            Date eventDate = sdf.parse(req.getParameter("event_date"));
            Event event = Event.builder()
                    .id(eventId)
                    .name(name)
                    .place(place)
                    .isOnline(isOnline)
                    .eventType(eventType)
                    .price(price)
                    .eventDate(eventDate)
                    .build();
            eventManager.editEvent(event);
            resp.sendRedirect("/events");
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
}
