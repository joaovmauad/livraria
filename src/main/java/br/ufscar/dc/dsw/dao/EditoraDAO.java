package br.ufscar.dc.dsw.dao;
import java.sql.*;
import java.util.*;
import br.ufscar.dc.dsw.domain.Editora;

public class EditoraDAO extends GenericDAO {
    public void insert(Editora ed) {
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement("INSERT INTO Editora (cnpj, nome) VALUES (?, ?)")) {
            s.setString(1, ed.getCnpj()); s.setString(2, ed.getNome()); s.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }
    public List<Editora> getAll() {
        List<Editora> l = new ArrayList<>();
        try (Connection c = getConnection(); Statement s = c.createStatement(); ResultSet r = s.executeQuery("SELECT * FROM Editora")) {
            while (r.next()) l.add(new Editora(r.getLong("id"), r.getString("cnpj"), r.getString("nome")));
        } catch (SQLException e) { throw new RuntimeException(e); }
        return l;
    }
    public void delete(Editora ed) {
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement("DELETE FROM Editora WHERE id = ?")) {
            s.setLong(1, ed.getId()); s.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }
    public void update(Editora ed) {
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement("UPDATE Editora SET cnpj = ?, nome = ? WHERE id = ?")) {
            s.setString(1, ed.getCnpj()); s.setString(2, ed.getNome()); s.setLong(3, ed.getId()); s.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }
    public Editora get(Long id) {
        try (Connection c = getConnection(); PreparedStatement s = c.prepareStatement("SELECT * FROM Editora WHERE id = ?")) {
            s.setLong(1, id);
            try (ResultSet r = s.executeQuery()) { if (r.next()) return new Editora(id, r.getString("cnpj"), r.getString("nome")); }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return null;
    }
}