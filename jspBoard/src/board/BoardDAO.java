package board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    String url, user, pass;

    public BoardDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.out.println("Oracle Driver ERROR!!");
        }
        url = "jdbc:oracle:thin:@localhost:1521:xe";
        user = "spring07";
        pass = "spring07";
    }

    protected List<BoardDTO> makeList(ResultSet rs) throws SQLException {
        List<BoardDTO> list = new ArrayList<>();
        while (rs.next()) {
            BoardDTO dto = new BoardDTO();
            dto.setNum(rs.getInt("num"));
            dto.setWriter(rs.getString("writer"));
            dto.setEmail(rs.getString("email"));
            dto.setSubject(rs.getString("subject"));
            dto.setPasswd(rs.getString("passwd"));
            dto.setReg_date(rs.getString("reg_date"));
            dto.setReadcount(rs.getInt("readcount"));
            dto.setContent(rs.getString("content"));
            dto.setIp(rs.getString("ip"));
            list.add(dto);
        }
        return list;
    }

    public List<BoardDTO> listBoard() {
        String sql = "select * from BOARD order by num desc";
        try {
            con = DriverManager.getConnection(url, user, pass);
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            return makeList(rs);
        } catch (SQLException e) {
            System.out.println("listBoard() ERROR!!");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ignored) {}
        }
        return null;
    }

    public int insertBoard(BoardDTO dto) throws SQLException {
        String sql = "insert into board values(board_seq.nextval,?,?,?,?,sysdate,0,?,?)";
        try {
            con = DriverManager.getConnection(url, user, pass);
            ps = con.prepareStatement(sql);
            ps.setString(1, dto.getWriter());
            ps.setString(2, dto.getEmail());
            ps.setString(3, dto.getSubject());
            ps.setString(4, dto.getPasswd());
            ps.setString(5, dto.getContent());
            ps.setString(6, dto.getIp());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insertBoard() ERROR!!");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ignored) {}
        }
        return 0;
    }

    public BoardDTO getBoard(int num, String mode) {
        if (mode.equals("content")) plusReadcount(num);
        String sql = "select * from BOARD where num = ?";
        try {
            con = DriverManager.getConnection(url, user, pass);
            ps = con.prepareStatement(sql);
            ps.setInt(1, num);
            rs = ps.executeQuery();
            return makeList(rs).get(0);
        } catch (SQLException e) {
            System.out.println("getBoard() ERROR!!");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ignored) {}
        }
        return null;
    }

    protected void plusReadcount(int num) {
        try {
            String sql = "update board set READCOUNT = READCOUNT + 1 where num = ?";
            con = DriverManager.getConnection(url, user, pass);
            ps = con.prepareStatement(sql);
            ps.setInt(1, num);
            ps.executeUpdate();
        } catch (SQLException ignored) {} finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ignored) {}
        }
    }

    public int deleteBoard(int num, String passwd) {
        String sql = "delete from BOARD where num = ?";
        try {
            BoardDTO dto = getBoard(num, "password");
            if (!passwd.equals(dto.getPasswd())) {
                return -1;
            }
            con = DriverManager.getConnection(url, user, pass);
            ps = con.prepareStatement(sql);
            ps.setInt(1, num);
            return ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("deleteBoard() ERROR!!");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            }catch(SQLException ignored) {}
        }
        return 0;
    }

    public int updateBoard(BoardDTO dto) {
        String sql = "update BOARD set SUBJECT=?, EMAIL=?, CONTENT=? where num=?";
        try {
            BoardDTO dbdto = getBoard(dto.getNum(), "password");
            if (!dto.getPasswd().equals(dbdto.getPasswd())) {
                return -1;
            }
            con = DriverManager.getConnection(url, user, pass);
            ps = con.prepareStatement(sql);
            ps.setString(1, dto.getSubject());
            ps.setString(2, dto.getEmail());
            ps.setString(3, dto.getContent());
            ps.setInt(4, dto.getNum());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateBoard() ERROR!!");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException ignored) {}
        }
        return 0;
    }

}
