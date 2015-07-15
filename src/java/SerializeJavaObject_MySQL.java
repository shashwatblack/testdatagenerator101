/**
 * Created by shashwat on 7/3/15.
 */
import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SerializeJavaObject_MySQL {
    static final String WRITE_OBJECT_SQL = "INSERT INTO javaobj (name, object_value) VALUES (?, ?)";

    static final String READ_OBJECT_SQL = "SELECT object_value FROM javaobj WHERE id = ?";

    public static Connection getConnection() throws Exception {
        String driver = "org.gjt.mm.mysql.Driver";
        String url = "jdbc:mysql://localhost/sample";
        String username = "root";
        String password = "shashhta";
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, username, password);
        return conn;
    }

    public static long writeJavaObject(Connection conn, Object object) throws Exception {
        String className = object.getClass().getName();
        PreparedStatement pstmt = conn.prepareStatement(WRITE_OBJECT_SQL, Statement.RETURN_GENERATED_KEYS);

        // set input parameters
        pstmt.setString(1, className);
        pstmt.setObject(2, object);
        pstmt.execute();

        // get the generated key for the id
        ResultSet rs = pstmt.getGeneratedKeys();
        int id = -1;
//        if (rs.next()) {
//            id = rs.getInt(1);
//        }
        while (rs.next()) {
            id = (rs.getInt(1));
        }

        rs.close();
        pstmt.close();
        System.out.println("writeJavaObject: done serializing: " + className);
        return id;
    }

    public static Object readJavaObject(Connection conn, long id) throws Exception {
        PreparedStatement pstmt = conn.prepareStatement(READ_OBJECT_SQL);
        pstmt.setLong(1, id);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        Object object = rs.getObject(1);
        String className = object.getClass().getName();

        rs.close();
        pstmt.close();
        System.out.println("readJavaObject: done de-serializing: " + className);
        return object;
    }
    public static void main(String args[])throws Exception {
        Connection conn = null;
        try {
            conn = getConnection();
            System.out.println("conn=" + conn);
            conn.setAutoCommit(false);
            List<Object> list = new ArrayList<Object>();
            list.add(new Integer(1234));
            list.add("This is a short string.");
            list.add(new Date());

            long objectID = writeJavaObject(conn, list);
            conn.commit();
            System.out.println("Serialized objectID => " + objectID);
            List listFromDatabase = (List) readJavaObject(conn, objectID);
            System.out.println("[After De-Serialization] list=" + listFromDatabase);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
        }
    }
}
