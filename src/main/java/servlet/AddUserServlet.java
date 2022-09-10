package servlet;

import manager.EventManager;
import manager.UserManager;
import model.Event;
import model.User;
import model.UserRole;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;


@WebServlet(urlPatterns = "/users/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, //1MB
        maxFileSize = 1024 * 1024 * 10,      //10MB
        maxRequestSize = 1024 * 1024 * 100   //100MB
)
public class AddUserServlet extends HttpServlet {
    private UserManager userManager = new UserManager();
    private EventManager eventManager = new EventManager();
    private static final String imagePath = "/Users/annakhachatryan/Library/Application Support/JetBrains/EventRegisterWeb/projectImages/";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<Event> eventList = eventManager.getAll();
//        req.setAttribute("event", eventList);
        req.getRequestDispatcher("/WEB-INF/addUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        if (userManager.getUserByEmail(email) != null) {
            req.setAttribute("msg", "User already exists");
            req.getRequestDispatcher("/WEB-INF/addUser.jsp").forward(req, resp);
        } else {
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            String password = req.getParameter("password");
            UserRole userRole = UserRole.valueOf(req.getParameter("user_role"));
//        int id = Integer.parseInt(req.getParameter("event_id"));
//        Event event = eventManager.getById(id);
            Part profilePicPart = req.getPart("profilePic");
            String fileName = null;
            if (profilePicPart != null) {
                long nanoTime = System.nanoTime();
                fileName = nanoTime + "_" + profilePicPart.getSubmittedFileName();
                profilePicPart.write(imagePath + fileName);
            }
            User user = User.builder()
                    .name(name)
                    .surname(surname)
                    .email(email)
                    .password(password)
                    .userRole(userRole)
//                .event(event)
                    .profilePic(fileName)
                    .build();
            userManager.add(user);
            resp.sendRedirect("/login");
        }
    }
}
