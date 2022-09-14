package manager;

import db.DBConnectionProvider;
import model.Event;
import model.EventType;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class EventManager {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public void add(Event event) {
        String sql = "insert into event(name,place,is_online,event_type,price,event_date) values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, event.getName());
            ps.setString(2, event.getPlace());
            ps.setBoolean(3, event.isOnline());
            ps.setString(4, event.getEventType().name());
            ps.setDouble(5, event.getPrice());
            ps.setString(6, sdf.format(event.getEventDate()));
            ps.executeUpdate();
            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                event.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Event> getAll() {
        String sql = "select * from event";
        List<Event> events = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                events.add(getEventFromResultSet(resultSet));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return events;
    }

    public Event getById(int id) {
        String sql = "select * from event where id = " + id;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                Event event = getEventFromResultSet(resultSet);
                return event;
                ///return getEventFromResultSet(resultSet);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Event getEventFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        return Event.builder()
                .id(resultSet.getInt("id"))
                .name(resultSet.getString("name"))
                .place(resultSet.getString("place"))
                .isOnline(resultSet.getBoolean("is_online"))
                .price(resultSet.getDouble("price"))
                .eventType(EventType.valueOf(resultSet.getString("event_type")))
                .eventDate(resultSet.getString("event_date") == null ? null : sdf.parse(resultSet.getString("event_date")))
                .build();
    }

    public void deleteEventById(int id) {
        String sql = "delete from event where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editEvent(Event event) {
        String sql = "update event set name=?,place=?,is_online=?,price=?,event_type=?,event_date=? where id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, event.getName());
            preparedStatement.setString(2, event.getPlace());
            preparedStatement.setBoolean(3, event.isOnline());
            preparedStatement.setDouble(4, event.getPrice());
            preparedStatement.setString(5, event.getEventType().name());
            preparedStatement.setString(6, sdf.format(event.getEventDate()));
            preparedStatement.setInt(7, event.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void join(int eventId, int userId) {
        String sql = "insert into user_event(user_id,event_id) values(?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, eventId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void cancel(int eventId, int userId) {
        String sql = "delete from user_event where event_id=? and user_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, eventId);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Event> getEventsByUserId(int userId) {
        String sql = "select event_id from user_event where user_id=?";
        List<Event> events = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet eventsResultSet = ps.executeQuery();
            while (eventsResultSet.next()) {
                events.add(getById(eventsResultSet.getInt(1)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    public List<Event> search(String keyword) {
        String sql = "select * from event where name like '%" + keyword + "%' or place like '%" + keyword + "%'";
        List<Event> events = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery(sql);
            while (resultSet.next()) {
                events.add(getEventFromResultSet(resultSet));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return events;
    }

    public List<Event> filter(double minPrice, double maxPrice) {
        String sql = "select * from event where price > " + minPrice + "and price < " + maxPrice;
        List<Event> events = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery(sql);
            while (resultSet.next()) {
                events.add(getEventFromResultSet(resultSet));
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return events;
    }
}



